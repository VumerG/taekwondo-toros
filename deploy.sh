#!/bin/bash

# Script para desplegar Taekwondo Toros a Firebase Hosting
# Uso: ./deploy.sh

echo
echo "╔════════════════════════════════════════════════════════════╗"
echo "║    🚀 Taekwondo Toros - Firebase Deployment Script        ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo

# Verificar que .env.local existe
if [ ! -f ".env.local" ]; then
    echo "❌ ERROR: .env.local no encontrado"
    echo
    echo "Por favor:"
    echo "1. Copia .env.example a .env.local"
    echo "2. Llena con tus credenciales de Firebase"
    echo
    exit 1
fi

echo "✅ .env.local encontrado"

# Verificar que Node está instalado
if ! command -v node &> /dev/null; then
    echo "❌ ERROR: Node.js no está instalado"
    exit 1
fi

echo "✅ Node.js detectado"

# Compilar
echo
echo "📦 Compilando proyecto..."
npm run build

if [ $? -ne 0 ]; then
    echo "❌ Error durante la compilación"
    exit 1
fi

echo "✅ Compilación exitosa"

# Desplegar
echo
echo "🔄 Desplegando a Firebase..."
echo

# Intenta con firebase global, sino usa npx
if command -v firebase &> /dev/null; then
    firebase deploy
else
    echo "⚠️  Firebase CLI no está instalado globalmente"
    echo "Ejecutando con npx..."
    npx firebase deploy
fi

if [ $? -eq 0 ]; then
    echo
    echo "╔════════════════════════════════════════════════════════════╗"
    echo "║         ✅ ¡Despliegue Exitoso!                           ║"
    echo "║                                                            ║"
    echo "║  Tu app está en línea en:                                 ║"
    echo "║  https://taekwondo-toros.firebaseapp.com                  ║"
    echo "║                                                            ║"
    echo "║  Accesible desde:                                         ║"
    echo "║  📱 Móvil, Tablet, PC - Cualquier dispositivo            ║"
    echo "╚════════════════════════════════════════════════════════════╝"
    echo
else
    echo
    echo "❌ Error durante el despliegue"
    echo
    echo "Verifica:"
    echo "1. .env.local tiene credenciales válidas"
    echo "2. Firebase CLI está instalado (npm install -g firebase-tools)"
    echo "3. Has ejecutado: firebase login"
    echo
fi
