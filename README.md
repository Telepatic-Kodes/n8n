# n8n Automation Platform - Render Deployment

## 🚀 **Despliegue Automático en Render**

Este proyecto configura n8n (plataforma de automatización de workflows) para desplegarse automáticamente en Render.

### 📋 **¿Qué es n8n?**

n8n es una plataforma de **automatización de workflows** que te permite:
- Conectar diferentes aplicaciones y servicios
- Automatizar tareas repetitivas
- Crear flujos de trabajo complejos
- Integrar APIs y webhooks

### 🏗️ **Estructura del Proyecto**

```
├── package.json          # Dependencias y scripts
├── index.js             # Punto de entrada de la aplicación
├── render.yaml          # Configuración de Render
├── .gitignore          # Archivos a ignorar
└── README.md           # Este archivo
```

### ⚙️ **Configuración**

El proyecto está configurado para:
- **Autenticación básica**: Usuario y contraseña generados automáticamente
- **Base de datos SQLite**: Almacenamiento local de workflows
- **Puerto 10000**: Puerto estándar de n8n
- **Protocolo HTTPS**: Seguridad habilitada
- **Zona horaria**: America/Santiago

### 🚀 **Despliegue Automático**

1. **Conectar repositorio**: El proyecto se conecta automáticamente a GitHub
2. **Despliegue automático**: Cada commit activa un nuevo despliegue
3. **Variables de entorno**: Se configuran automáticamente en Render
4. **URL de acceso**: https://n8n-automation-hea4.onrender.com

### 📝 **Uso**

Una vez desplegado:
1. Accede a la URL de la aplicación
2. Usa las credenciales generadas automáticamente
3. Comienza a crear tus workflows de automatización

### 🔧 **Desarrollo Local**

```bash
# Instalar dependencias
npm install

# Iniciar n8n localmente
npm start
```

### 📚 **Recursos**

- [Documentación de n8n](https://docs.n8n.io/)
- [Documentación de Render](https://render.com/docs)
- [Guía de automatización](https://docs.n8n.io/workflows/)
