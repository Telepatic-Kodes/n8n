#!/usr/bin/env node

// Simple n8n launcher for Render deployment
console.log('Starting n8n...');

// Set environment variables for n8n
process.env.N8N_BASIC_AUTH_ACTIVE = process.env.N8N_BASIC_AUTH_ACTIVE || 'true';
process.env.N8N_PORT = process.env.PORT || '10000';
process.env.N8N_PROTOCOL = 'https';
process.env.NODE_ENV = 'production';

// Import and start n8n
const { spawn } = require('child_process');

console.log('Environment variables set:');
console.log('- N8N_BASIC_AUTH_ACTIVE:', process.env.N8N_BASIC_AUTH_ACTIVE);
console.log('- N8N_PORT:', process.env.N8N_PORT);
console.log('- N8N_PROTOCOL:', process.env.N8N_PROTOCOL);
console.log('- NODE_ENV:', process.env.NODE_ENV);

// Start n8n using npx to ensure we get the correct version
const n8n = spawn('npx', ['n8n', 'start'], {
  stdio: 'inherit',
  env: process.env
});

n8n.on('error', (error) => {
  console.error('Failed to start n8n:', error);
  process.exit(1);
});

n8n.on('exit', (code) => {
  console.log(`n8n exited with code ${code}`);
  process.exit(code);
});
