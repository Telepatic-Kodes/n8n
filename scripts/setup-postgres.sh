#!/bin/bash

# 🗄️ Script de Configuración de PostgreSQL para n8n
# Este script te ayuda a configurar PostgreSQL en Render

set -e

echo "🗄️ Configurando PostgreSQL para n8n..."
echo "====================================="

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

echo ""
echo "📋 PASOS PARA CONFIGURAR POSTGRESQL:"
echo "===================================="
echo ""
echo "1️⃣  CREAR BASE DE DATOS EN RENDER:"
echo "   - Ve a https://render.com"
echo "   - Haz clic en 'New +' → 'PostgreSQL'"
echo "   - Configura:"
echo "     * Name: n8n-database"
echo "     * Database: n8n"
echo "     * User: n8n"
echo "     * Plan: Starter (gratis)"
echo "   - Haz clic en 'Create Database'"
echo ""
echo "2️⃣  OBTENER LA CONNECTION STRING:"
echo "   - En tu base de datos → 'Connections'"
echo "   - Copia la 'External Database URL'"
echo "   - Formato: postgresql://user:pass@host:port/dbname"
echo ""
echo "3️⃣  CONFIGURAR VARIABLES DE ENTORNO:"
echo "   En tu servicio n8n, añade estas variables:"
echo ""
echo "   DB_TYPE=postgresdb"
echo "   DB_POSTGRESDB_CONNECTION_STRING=TU_CONNECTION_STRING_AQUI"
echo ""
echo "4️⃣  MIGRAR DESDE SQLITE (si ya tienes datos):"
echo "   - n8n migrará automáticamente los datos"
echo "   - Los datos se mantendrán en PostgreSQL"
echo ""

# Crear archivo de configuración de ejemplo
cat > postgres-config.env.example << EOF
# Configuración PostgreSQL para n8n
DB_TYPE=postgresdb
DB_POSTGRESDB_CONNECTION_STRING=postgresql://n8n:password@host:port/n8n

# Variables adicionales para PostgreSQL
DB_POSTGRESDB_SCHEMA=public
DB_POSTGRESDB_SSL_REJECT_UNAUTHORIZED=false

# Backup de configuración SQLite (comentado)
# DB_TYPE=sqlite
# DB_SQLITE_DATABASE=/home/node/.n8n/database.sqlite
EOF

print_success "Archivo postgres-config.env.example creado"
echo ""
echo "🔧 VENTAJAS DE POSTGRESQL:"
echo "=========================="
echo "✅ Mejor rendimiento para workflows complejos"
echo "✅ Soporte para múltiples usuarios"
echo "✅ Backup automático en Render"
echo "✅ Escalabilidad"
echo "✅ Mejor para producción"
echo ""
echo "⚠️  CONSIDERACIONES:"
echo "==================="
echo "🔸 PostgreSQL consume más recursos"
echo "🔸 Plan gratuito tiene limitaciones"
echo "🔸 Para uso personal, SQLite es suficiente"
echo ""
print_success "¡Configuración de PostgreSQL completada!"
