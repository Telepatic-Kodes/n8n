// 🚀 Configuración avanzada de n8n para Render
// Este archivo permite personalizar n8n más allá de las variables de entorno

module.exports = {
  // Configuración de la base de datos
  database: {
    type: process.env.DB_TYPE || 'sqlite',
    sqlite: {
      database: process.env.DB_SQLITE_DATABASE || '/home/node/.n8n/database.sqlite',
    },
    postgresdb: {
      host: process.env.DB_POSTGRESDB_HOST,
      port: process.env.DB_POSTGRESDB_PORT,
      database: process.env.DB_POSTGRESDB_DATABASE,
      user: process.env.DB_POSTGRESDB_USER,
      password: process.env.DB_POSTGRESDB_PASSWORD,
      schema: process.env.DB_POSTGRESDB_SCHEMA || 'public',
      ssl: {
        rejectUnauthorized: process.env.DB_POSTGRESDB_SSL_REJECT_UNAUTHORIZED === 'true',
      },
    },
  },

  // Configuración de autenticación
  security: {
    basicAuth: {
      active: process.env.N8N_BASIC_AUTH_ACTIVE === 'true',
      user: process.env.N8N_BASIC_AUTH_USER,
      password: process.env.N8N_BASIC_AUTH_PASSWORD,
    },
  },

  // Configuración del servidor
  server: {
    host: process.env.N8N_HOST || '0.0.0.0',
    port: parseInt(process.env.N8N_PORT) || 5678,
    protocol: process.env.N8N_PROTOCOL || 'https',
    webhookUrl: process.env.WEBHOOK_URL,
  },

  // Configuración de ejecución
  execution: {
    mode: process.env.EXECUTIONS_MODE || 'regular',
    timeout: parseInt(process.env.EXECUTION_TIMEOUT) || 3600,
    maxTimeout: parseInt(process.env.EXECUTION_MAX_TIMEOUT) || 3600,
  },

  // Configuración de logs
  logs: {
    level: process.env.LOG_LEVEL || 'info',
    output: process.env.LOG_OUTPUT || 'console',
  },

  // Configuración de timezone
  generic: {
    timezone: process.env.GENERIC_TIMEZONE || 'America/Santiago',
  },

  // Configuración de webhooks
  webhooks: {
    timeout: parseInt(process.env.WEBHOOK_TIMEOUT) || 10000,
  },

  // Configuración de rate limiting
  rateLimit: {
    windowMs: parseInt(process.env.RATE_LIMIT_WINDOW_MS) || 15 * 60 * 1000, // 15 minutos
    max: parseInt(process.env.RATE_LIMIT_MAX) || 100, // límite por ventana
  },

  // Configuración de seguridad adicional
  security: {
    // Deshabilitar CORS para desarrollo (habilitar en producción)
    cors: {
      origin: process.env.CORS_ORIGIN || '*',
      credentials: true,
    },
    
    // Configuración de headers de seguridad
    headers: {
      'X-Frame-Options': 'DENY',
      'X-Content-Type-Options': 'nosniff',
      'X-XSS-Protection': '1; mode=block',
      'Strict-Transport-Security': 'max-age=31536000; includeSubDomains',
    },
  },

  // Configuración de backup
  backup: {
    enabled: process.env.BACKUP_ENABLED === 'true',
    schedule: process.env.BACKUP_SCHEDULE || '0 2 * * *', // 2 AM diario
    retention: parseInt(process.env.BACKUP_RETENTION) || 7, // 7 días
  },

  // Configuración de notificaciones
  notifications: {
    email: {
      enabled: process.env.EMAIL_NOTIFICATIONS_ENABLED === 'true',
      smtp: {
        host: process.env.SMTP_HOST,
        port: parseInt(process.env.SMTP_PORT) || 587,
        secure: process.env.SMTP_SECURE === 'true',
        auth: {
          user: process.env.SMTP_USER,
          pass: process.env.SMTP_PASS,
        },
      },
    },
  },

  // Configuración de personalización
  customizations: {
    // Personalizar el título de la aplicación
    appTitle: process.env.APP_TITLE || 'n8n - Automatización',
    
    // Personalizar el logo (URL)
    appLogo: process.env.APP_LOGO,
    
    // Personalizar colores del tema
    theme: {
      primary: process.env.THEME_PRIMARY || '#ff6d5a',
      secondary: process.env.THEME_SECONDARY || '#1f2937',
    },
  },
};
