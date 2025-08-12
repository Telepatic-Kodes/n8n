FROM node:18-alpine

# Install dependencies
RUN apk add --no-cache \
    graphicsmagick \
    tzdata \
    su-exec \
    tini

# Set working directory
WORKDIR /home/node

# Install n8n globally
RUN npm config set update-notifier false && \
    npm install -g n8n@latest

# Create n8n user
RUN addgroup -g 1000 n8n && \
    adduser -D -u 1000 -G n8n n8n

# Create n8n directories
RUN mkdir -p /home/node/.n8n && \
    chown -R n8n:n8n /home/node

# Switch to n8n user
USER n8n

# Expose port
EXPOSE 5678

# Set environment variables
ENV NODE_ENV=production
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=https
ENV WEBHOOK_URL=https://n8n.tudominio.com
ENV GENERIC_TIMEZONE=America/Santiago

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
    CMD node -e "require('http').get('http://localhost:5678/healthz', (res) => { process.exit(res.statusCode === 200 ? 0 : 1) })"

# Start n8n
ENTRYPOINT ["tini", "--", "n8n"]
