# 🚀 n8n en Render - Despliegue Automático

Este repositorio contiene todo lo necesario para desplegar **n8n** en Render de forma rápida y segura, con persistencia de datos y configuración optimizada.

## ✨ Características

- ✅ **Despliegue automático** en Render
- ✅ **Persistencia de datos** con almacenamiento en disco
- ✅ **Autenticación básica** configurada
- ✅ **SSL/HTTPS** automático
- ✅ **Health checks** para monitoreo
- ✅ **Configuración optimizada** para producción
- ✅ **Docker optimizado** para Render

## 🚀 Despliegue Rápido en Render

### Opción 1: Despliegue Automático (Recomendado)

1. **Fork este repositorio** a tu cuenta de GitHub
2. Ve a [Render.com](https://render.com) y crea una cuenta
3. Haz clic en **"New +"** → **"Blueprint"**
4. Conecta tu repositorio de GitHub
5. Render detectará automáticamente el `render.yaml`
6. Haz clic en **"Apply"** y espera el despliegue

### Opción 2: Despliegue Manual

1. **Fork este repositorio** a tu cuenta de GitHub
2. En Render → **"New +"** → **"Web Service"**
3. Conecta tu repositorio
4. Configura:
   - **Environment**: `Docker`
   - **Branch**: `main`
   - **Build Command**: *(dejar vacío)*
   - **Start Command**: *(automático)*

5. **Environment Variables** (añadir manualmente):
   ```
   N8N_BASIC_AUTH_ACTIVE=true
   N8N_BASIC_AUTH_USER=tuusuario
   N8N_BASIC_AUTH_PASSWORD=tupassword
   N8N_HOST=tu-app.onrender.com
   N8N_PORT=5678
   N8N_PROTOCOL=https
   WEBHOOK_URL=https://tu-app.onrender.com
   GENERIC_TIMEZONE=America/Santiago
   DB_TYPE=sqlite
   DB_SQLITE_DATABASE=/home/node/.n8n/database.sqlite
   ```

6. **Disks** (para persistencia):
   - Nombre: `n8n-data`
   - Mount Path: `/home/node/.n8n`
   - Size: `1 GB`

## 🔧 Configuración Local

Para probar localmente:

```bash
# Clonar el repositorio
git clone <tu-repo-url>
cd n8n

# Ejecutar con Docker Compose
docker-compose up -d

# Acceder a n8n
# URL: http://localhost:5678
# Usuario: admin
# Contraseña: password123
```

## 📊 Variables de Entorno

| Variable | Descripción | Valor por Defecto |
|----------|-------------|-------------------|
| `N8N_BASIC_AUTH_ACTIVE` | Activar autenticación | `true` |
| `N8N_BASIC_AUTH_USER` | Usuario de acceso | Generado automáticamente |
| `N8N_BASIC_AUTH_PASSWORD` | Contraseña de acceso | Generado automáticamente |
| `N8N_HOST` | Host de n8n | Tu dominio de Render |
| `N8N_PORT` | Puerto de n8n | `5678` |
| `N8N_PROTOCOL` | Protocolo (http/https) | `https` |
| `WEBHOOK_URL` | URL para webhooks | Tu dominio de Render |
| `GENERIC_TIMEZONE` | Zona horaria | `America/Santiago` |
| `DB_TYPE` | Tipo de base de datos | `sqlite` |
| `DB_SQLITE_DATABASE` | Ruta de la base de datos | `/home/node/.n8n/database.sqlite` |

## 🗄️ Base de Datos

### SQLite (Recomendado para empezar)
- **Ventajas**: Simple, no requiere configuración adicional
- **Datos**: Persisten en el disco de Render
- **Configuración**: Automática

### PostgreSQL (Para uso avanzado)
Si quieres usar PostgreSQL:

1. Crea una base de datos PostgreSQL en Render
2. Cambia las variables de entorno:
   ```
   DB_TYPE=postgresdb
   DB_POSTGRESDB_CONNECTION_STRING=postgresql://user:pass@host:port/dbname
   ```

## 🔒 Seguridad

- ✅ Autenticación básica activada por defecto
- ✅ HTTPS automático en Render
- ✅ Usuario y contraseña generados automáticamente
- ✅ Datos persistentes en disco seguro

## 📈 Monitoreo

- **Health Check**: `/healthz` (automático)
- **Logs**: Disponibles en el dashboard de Render
- **Métricas**: Render proporciona métricas básicas

## 🛠️ Personalización

### Cambiar zona horaria:
```bash
GENERIC_TIMEZONE=America/Santiago  # Chile
GENERIC_TIMEZONE=America/Mexico_City  # México
GENERIC_TIMEZONE=America/New_York  # Estados Unidos
```

### Activar modo desarrollo:
```bash
NODE_ENV=development
N8N_BASIC_AUTH_ACTIVE=false
```

## 🚨 Troubleshooting

### El servicio no inicia:
1. Verifica los logs en Render
2. Asegúrate de que las variables de entorno estén correctas
3. Verifica que el puerto 5678 esté expuesto

### No se guardan los datos:
1. Verifica que el disco esté configurado correctamente
2. Asegúrate de que el mount path sea `/home/node/.n8n`

### Problemas de autenticación:
1. Verifica que `N8N_BASIC_AUTH_ACTIVE=true`
2. Asegúrate de que usuario y contraseña estén configurados

## 📞 Soporte

Si tienes problemas:
1. Revisa los logs en Render
2. Verifica la configuración de variables de entorno
3. Asegúrate de que el repositorio esté actualizado

## 🎉 ¡Listo!

Una vez desplegado, tendrás n8n funcionando en:
- **URL**: `https://tu-app.onrender.com`
- **Usuario**: El que configuraste
- **Contraseña**: La que configuraste

¡Disfruta automatizando! 🤖
