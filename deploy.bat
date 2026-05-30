@echo off
REM Script para desplegar Taekwondo Toros a Firebase Hosting
REM Uso: deploy.bat

echo.
echo ╔════════════════════════════════════════════════════════════╗
echo ║    🚀 Taekwondo Toros - Firebase Deployment Script        ║
echo ╚════════════════════════════════════════════════════════════╝
echo.

REM Verificar que .env.local existe
if not exist ".env.local" (
    echo ❌ ERROR: .env.local no encontrado
    echo.
    echo Por favor:
    echo 1. Copia .env.example a .env.local
    echo 2. Llena con tus credenciales de Firebase
    echo.
    pause
    exit /b 1
)

echo ✅ .env.local encontrado

REM Verificar que Node está instalado
where node >nul 2>nul
if %errorlevel% neq 0 (
    echo ❌ ERROR: Node.js no está instalado o no está en PATH
    pause
    exit /b 1
)

echo ✅ Node.js detectado

REM Compilar
echo.
echo 📦 Compilando proyecto...
call npm run build
if %errorlevel% neq 0 (
    echo ❌ Error durante la compilación
    pause
    exit /b 1
)

echo ✅ Compilación exitosa

REM Desplegar
echo.
echo 🔄 Desplegando a Firebase...
echo.
echo 💡 Si es la primera vez:
echo    1. Presiona Ctrl+C en el navegador que se abre
echo    2. Regresa aquí y presiona cualquier tecla
echo.

REM Intenta con firebase local si existe, sino pide instalarlo
where firebase >nul 2>nul
if %errorlevel% neq 0 (
    echo ⚠️  Firebase CLI no está instalado globalmente
    echo.
    echo Opciones:
    echo 1. Instalar globalmente: npm install -g firebase-tools
    echo 2. O ejecutar: npx firebase deploy
    echo.
    echo Ejecutando con npx...
    call npx firebase deploy
) else (
    call firebase deploy
)

if %errorlevel% equ 0 (
    echo.
    echo ╔════════════════════════════════════════════════════════════╗
    echo ║         ✅ ¡Despliegue Exitoso!                           ║
    echo ║                                                            ║
    echo ║  Tu app está en línea en:                                 ║
    echo ║  https://taekwondo-toros.firebaseapp.com                  ║
    echo ║                                                            ║
    echo ║  Accesible desde:                                         ║
    echo ║  📱 Móvil, Tablet, PC - Cualquier dispositivo            ║
    echo ╚════════════════════════════════════════════════════════════╝
    echo.
) else (
    echo.
    echo ❌ Error durante el despliegue
    echo.
    echo Verifica:
    echo 1. .env.local tiene credenciales válidas
    echo 2. Firebase CLI está instalado (npm install -g firebase-tools)
    echo 3. Has ejecutado: firebase login
    echo.
)

pause
