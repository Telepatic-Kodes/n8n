#!/bin/bash

# 🚀 Script de Despliegue Automático para n8n en Render
# Este script te ayuda a configurar y desplegar n8n rápidamente

set -e

echo "🚀 Iniciando despliegue de n8n en Render..."
echo "=========================================="

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Función para imprimir mensajes
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

# Verificar si git está instalado
if ! command -v git &> /dev/null; then
    print_error "Git no está instalado. Por favor instala Git primero."
    exit 1
fi

# Verificar si Docker está instalado (para pruebas locales)
if command -v docker &> /dev/null; then
    print_success "Docker detectado - puedes probar localmente"
else
    print_warning "Docker no detectado - solo podrás desplegar en Render"
fi

# Configuración inicial
print_status "Configurando el repositorio..."

# Verificar si estamos en un repositorio git
if [ ! -d ".git" ]; then
    print_status "Inicializando repositorio Git..."
    git init
    git add .
    git commit -m "🚀 Configuración inicial de n8n para Render"
    print_success "Repositorio Git inicializado"
fi

# Verificar archivos esenciales
required_files=("Dockerfile" "render.yaml" "README.md" "docker-compose.yml")
for file in "${required_files[@]}"; do
    if [ ! -f "$file" ]; then
        print_error "Archivo requerido no encontrado: $file"
        exit 1
    fi
done

print_success "Todos los archivos requeridos están presentes"

# Generar credenciales aleatorias para desarrollo
if [ ! -f ".env.example" ]; then
    print_status "Creando archivo de ejemplo de variables de entorno..."
    cat > .env.example << EOF
# Variables de entorno para n8n
N8N_BASIC_AUTH_ACTIVE=true
N8N_BASIC_AUTH_USER=admin
N8N_BASIC_AUTH_PASSWORD=password123
N8N_HOST=localhost
N8N_PORT=5678
N8N_PROTOCOL=http
WEBHOOK_URL=http://localhost:5678
GENERIC_TIMEZONE=America/Santiago
DB_TYPE=sqlite
DB_SQLITE_DATABASE=/home/node/.n8n/database.sqlite

# Para PostgreSQL (opcional)
# DB_TYPE=postgresdb
# DB_POSTGRESDB_CONNECTION_STRING=postgresql://user:pass@host:port/dbname
EOF
    print_success "Archivo .env.example creado"
fi

# Instrucciones de despliegue
echo ""
echo "🎯 INSTRUCCIONES DE DESPLIEGUE:"
echo "================================"
echo ""
echo "1️⃣  SUBE EL REPOSITORIO A GITHUB:"
echo "   git remote add origin https://github.com/TUUSUARIO/n8n-render.git"
echo "   git push -u origin main"
echo ""
echo "2️⃣  DESPLIEGA EN RENDER:"
echo "   - Ve a https://render.com"
echo "   - Crea una cuenta o inicia sesión"
echo "   - Haz clic en 'New +' → 'Blueprint'"
echo "   - Conecta tu repositorio de GitHub"
echo "   - Haz clic en 'Apply'"
echo ""
echo "3️⃣  CONFIGURA LAS VARIABLES DE ENTORNO:"
echo "   - En Render, ve a tu servicio"
echo "   - Environment → Environment Variables"
echo "   - Añade las variables del archivo .env.example"
echo "   - Cambia N8N_HOST por tu URL de Render"
echo ""
echo "4️⃣  CONFIGURA EL DISCO (para persistencia):"
echo "   - En tu servicio → Disks → Add Disk"
echo "   - Nombre: n8n-data"
echo "   - Mount Path: /home/node/.n8n"
echo "   - Size: 1 GB"
echo ""

# Probar localmente si Docker está disponible
if command -v docker &> /dev/null; then
    echo "🧪 PRUEBA LOCAL (opcional):"
    echo "=========================="
    echo "Para probar localmente antes de desplegar:"
    echo "   docker-compose up -d"
    echo "   # Accede a http://localhost:5678"
    echo "   # Usuario: admin, Contraseña: password123"
    echo ""
fi

print_success "¡Configuración completada!"
echo ""
echo "📚 DOCUMENTACIÓN:"
echo "================="
echo "📖 README.md - Instrucciones detalladas"
echo "🔧 render.yaml - Configuración de Render"
echo "🐳 Dockerfile - Configuración de Docker"
echo ""
echo "🎉 ¡Tu n8n estará listo en menos de 10 minutos!"
echo ""
print_warning "Recuerda cambiar las credenciales por defecto en producción"
