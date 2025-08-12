# 🚀 Guía Completa de Despliegue en Render

## 📋 Resumen Rápido

Este repositorio está **100% optimizado** para Render. Solo necesitas:

1. **Fork** este repositorio
2. **Conectar** a Render
3. **Desplegar** automáticamente

¡Tu n8n estará funcionando en **menos de 10 minutos**!

---

## 🎯 Opción 1: Despliegue Automático (Recomendado)

### Paso 1: Preparar el Repositorio
```bash
# 1. Fork este repositorio a tu cuenta de GitHub
# 2. Clona tu fork localmente
git clone https://github.com/TUUSUARIO/n8n-render.git
cd n8n-render

# 3. (Opcional) Personaliza la configuración
# Edita render.yaml si quieres cambiar el nombre del servicio
```

### Paso 2: Desplegar en Render
1. Ve a [https://render.com](https://render.com)
2. Crea una cuenta o inicia sesión
3. Haz clic en **"New +"** → **"Blueprint"**
4. Conecta tu cuenta de GitHub
5. Selecciona tu repositorio
6. Render detectará automáticamente el `render.yaml`
7. Haz clic en **"Apply"**
8. ¡Espera 5-10 minutos!

### Paso 3: Configurar Credenciales
1. En tu servicio n8n → **Environment** → **Environment Variables**
2. Busca las variables generadas automáticamente:
   - `N8N_BASIC_AUTH_USER`
   - `N8N_BASIC_AUTH_PASSWORD`
3. **Guarda** estas credenciales en un lugar seguro
4. Accede a tu n8n con estas credenciales

---

## 🔧 Opción 2: Despliegue Manual

### Paso 1: Crear Web Service
1. En Render → **"New +"** → **"Web Service"**
2. Conecta tu repositorio de GitHub
3. Configura:
   - **Name**: `n8n-automation`
   - **Environment**: `Docker`
   - **Branch**: `main`
   - **Build Command**: *(dejar vacío)*
   - **Start Command**: *(automático)*

### Paso 2: Configurar Variables de Entorno
Añade estas variables en **Environment Variables**:

```bash
N8N_BASIC_AUTH_ACTIVE=true
N8N_BASIC_AUTH_USER=tuusuario
N8N_BASIC_AUTH_PASSWORD=tupassword123
N8N_HOST=tu-app.onrender.com
N8N_PORT=5678
N8N_PROTOCOL=https
WEBHOOK_URL=https://tu-app.onrender.com
GENERIC_TIMEZONE=America/Santiago
DB_TYPE=sqlite
DB_SQLITE_DATABASE=/home/node/.n8n/database.sqlite
```

### Paso 3: Configurar Disco Persistente
1. En tu servicio → **Disks** → **Add Disk**
2. Configura:
   - **Name**: `n8n-data`
   - **Mount Path**: `/home/node/.n8n`
   - **Size**: `1 GB`

### Paso 4: Desplegar
1. Haz clic en **"Create Web Service"**
2. Espera a que el estado cambie a **"Live"**
3. Accede a tu n8n en la URL proporcionada

---

## 🗄️ Configuración de Base de Datos

### SQLite (Recomendado para empezar)
- ✅ **Configuración automática**
- ✅ **Datos persistentes** en disco
- ✅ **Sin configuración adicional**
- ✅ **Perfecto para uso personal**

### PostgreSQL (Para uso avanzado)
Si necesitas PostgreSQL:

1. **Crear base de datos**:
   - Render → **"New +"** → **"PostgreSQL"**
   - Name: `n8n-database`
   - Plan: `Starter` (gratis)

2. **Obtener connection string**:
   - En tu DB → **Connections** → **External Database URL**
   - Copia la URL completa

3. **Configurar variables**:
   ```bash
   DB_TYPE=postgresdb
   DB_POSTGRESDB_CONNECTION_STRING=postgresql://user:pass@host:port/dbname
   ```

---

## 🔒 Seguridad

### Autenticación Básica
- ✅ **Activada por defecto**
- ✅ **Usuario y contraseña** generados automáticamente
- ✅ **HTTPS** automático en Render

### Headers de Seguridad
- ✅ **X-Frame-Options**: DENY
- ✅ **X-Content-Type-Options**: nosniff
- ✅ **X-XSS-Protection**: 1; mode=block
- ✅ **HSTS**: max-age=31536000

### Rate Limiting
- ✅ **100 requests** por 15 minutos
- ✅ **Configurable** via variables de entorno

---

## 📊 Monitoreo y Logs

### Health Checks
- **Endpoint**: `/healthz`
- **Intervalo**: 30 segundos
- **Timeout**: 10 segundos
- **Reintentos**: 3

### Logs
- **Disponibles** en el dashboard de Render
- **Nivel**: `info` por defecto
- **Rotación**: automática

### Métricas
- **CPU**: monitoreo automático
- **Memoria**: monitoreo automático
- **Tráfico**: métricas básicas

---

## 🛠️ Personalización

### Cambiar Zona Horaria
```bash
GENERIC_TIMEZONE=America/Santiago    # Chile
GENERIC_TIMEZONE=America/Mexico_City # México
GENERIC_TIMEZONE=America/New_York    # Estados Unidos
GENERIC_TIMEZONE=Europe/Madrid       # España
```

### Personalizar Tema
```bash
APP_TITLE=Mi n8n Personalizado
THEME_PRIMARY=#ff6d5a
THEME_SECONDARY=#1f2937
```

### Configurar Notificaciones por Email
```bash
EMAIL_NOTIFICATIONS_ENABLED=true
SMTP_HOST=smtp.gmail.com
SMTP_PORT=587
SMTP_SECURE=true
SMTP_USER=tu-email@gmail.com
SMTP_PASS=tu-password-app
```

---

## 🚨 Troubleshooting

### El servicio no inicia
1. **Verifica los logs** en Render
2. **Revisa las variables** de entorno
3. **Asegúrate** de que el puerto 5678 esté expuesto

### No se guardan los datos
1. **Verifica el disco** configurado
2. **Asegúrate** de que el mount path sea `/home/node/.n8n`
3. **Revisa los permisos** del disco

### Problemas de autenticación
1. **Verifica** `N8N_BASIC_AUTH_ACTIVE=true`
2. **Asegúrate** de que usuario y contraseña estén configurados
3. **Limpia el caché** del navegador

### Error de conexión a la base de datos
1. **Verifica** la connection string de PostgreSQL
2. **Asegúrate** de que la DB esté activa
3. **Revisa** los logs de n8n

---

## 💰 Costos

### Plan Gratuito
- ✅ **512 MB RAM**
- ✅ **0.1 CPU**
- ✅ **750 horas/mes**
- ✅ **1 GB disco persistente**
- ✅ **Perfecto para uso personal**

### Plan Starter ($7/mes)
- ✅ **1 GB RAM**
- ✅ **0.5 CPU**
- ✅ **Sin límite de horas**
- ✅ **5 GB disco persistente**
- ✅ **Recomendado para producción**

---

## 📞 Soporte

### Logs de Render
- **Build logs**: durante el despliegue
- **Runtime logs**: durante la ejecución
- **Health check logs**: monitoreo automático

### Comandos Útiles
```bash
# Ver logs en tiempo real
# (desde el dashboard de Render)

# Reiniciar servicio
# (desde el dashboard de Render)

# Ver métricas
# (disponibles en el dashboard)
```

### Recursos Adicionales
- 📖 [Documentación oficial de n8n](https://docs.n8n.io/)
- 🚀 [Documentación de Render](https://render.com/docs)
- 💬 [Comunidad de n8n](https://community.n8n.io/)

---

## 🎉 ¡Listo!

Una vez desplegado, tendrás:

- 🌐 **URL**: `https://tu-app.onrender.com`
- 🔐 **Autenticación**: Usuario y contraseña configurados
- 💾 **Persistencia**: Datos guardados en disco
- 🔒 **Seguridad**: HTTPS y autenticación básica
- 📊 **Monitoreo**: Health checks automáticos

¡Disfruta automatizando con n8n! 🤖
