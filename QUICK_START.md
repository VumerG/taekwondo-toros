# ⚡ Guía Rápida: Poner Tu App Online en 15 Minutos

## 📝 Checklist Rápido

- [ ] Cuenta Google
- [ ] Crear proyecto Firebase
- [ ] Obtener credenciales
- [ ] Llenar `.env.local`
- [ ] Configurar Firestore
- [ ] Configurar Authentication
- [ ] Instalar Firebase CLI
- [ ] Hacer login
- [ ] Ejecutar deploy

---

## 🚀 Paso a Paso (15 minutos)

### 1️⃣ Crear Proyecto Firebase (2 min)
```
1. Ve a: https://console.firebase.google.com/
2. "Crear proyecto" → "taekwondo-toros"
3. Esperar a que se cree
```

### 2️⃣ Registrar App Web (2 min)
```
1. Click en </> (Web)
2. Nombre: "taekwondo-toros"
3. COPIAR estas líneas:
   - apiKey
   - authDomain
   - projectId
   - storageBucket
   - messagingSenderId
   - appId
```

### 3️⃣ Llenar `.env.local` (2 min)
```
En tu editor, abre: .env.local

VITE_FIREBASE_API_KEY=AIzaSyDemoKeyExample123456789
VITE_FIREBASE_AUTH_DOMAIN=taekwondo-toros.firebaseapp.com
VITE_FIREBASE_PROJECT_ID=taekwondo-toros
VITE_FIREBASE_STORAGE_BUCKET=taekwondo-toros.appspot.com
VITE_FIREBASE_MESSAGING_SENDER_ID=123456789
VITE_FIREBASE_APP_ID=1:123456789:web:abc123def456ghi789
```

### 4️⃣ Configurar Firestore (2 min)
```
1. Firebase Console → Cloud Firestore
2. "Crear base de datos"
3. Modo: "Iniciar en modo de prueba"
4. Ubicación: Tu región
5. "Crear"
```

### 5️⃣ Configurar Authentication (2 min)
```
1. Firebase Console → Authentication
2. "Configurar método de inicio de sesión"
3. "Correo electrónico/Contraseña" → Activar → Guardar
4. "Agregar usuario" (crear 3 usuarios de prueba)
```

**Usuarios a crear:**
```
- admin@taekwondo-toros.com / admin123
- secretario@taekwondo-toros.com / secretario123
- scanner@taekwondo-toros.com / scanner123
```

### 6️⃣ Instalar Firebase CLI (2 min)
```bash
# Abrir CMD como Administrador
npm install -g firebase-tools

# Esperar a que termine
```

### 7️⃣ Login en Firebase (1 min)
```bash
firebase login

# Se abrirá navegador, completa el login
```

### 8️⃣ Desplegar (2 min)
```bash
# En la carpeta del proyecto
npm run build
npx firebase deploy
```

### ✅ ¡LISTO!
Tu app está en:
```
https://taekwondo-toros.firebaseapp.com
```

---

## 📱 Usar desde Cualquier Dispositivo

### PC/Laptop
```
Navegador → https://taekwondo-toros.firebaseapp.com
```

### Teléfono/Tablet
```
1. Abre navegador (Chrome, Firefox, Safari, etc.)
2. Copia la URL
3. Marca como favorito
4. ¡Usa como una app!
```

### Datos en Tiempo Real
Todos los cambios se sincronizan automáticamente en todos los dispositivos.

---

## 🆘 Si Algo Falla

### "Firebase SDK Error"
→ Verifica `.env.local`

### "Usuario no encontrado"
→ Crea el usuario en Authentication

### "CORS Error"
→ Revisa Reglas en Cloud Firestore

### "Despliegue falla"
→ Ejecuta: `firebase login` nuevamente

---

## 💾 Archivos Importantes

```
📁 tu-proyecto/
├── 📄 .env.local ← TUS CREDENCIALES (no compartir)
├── 📄 README_ONLINE.md ← Guía completa
├── 📄 FIREBASE_SETUP.md ← Detalles técnicos
├── 📄 deploy.bat ← Script para Windows
├── 📄 deploy.sh ← Script para Mac/Linux
├── 📄 firebase.json ← Config de despliegue
└── 📄 .firebaserc ← Config de proyecto
```

---

## 📊 Ver Tus Datos Online

```
1. Firebase Console
2. Cloud Firestore
3. Ver todas tus colecciones:
   - students (estudiantes)
   - attendance (asistencia)
   - users (usuarios)
```

---

## 🎯 Próximos Pasos (Opcionales)

- [ ] Comprar dominio personalizado
- [ ] Agregar más usuarios
- [ ] Respaldar datos periódicamente
- [ ] Configurar email de recuperación
- [ ] Agregar más colegios/clases

---

## 📞 Soporte

Si necesitas ayuda:
1. Revisa `README_ONLINE.md` (guía completa)
2. Firebase Documentation: https://firebase.google.com/docs
3. Stack Overflow: Busca tu error específico

---

**¡Felicidades! Tu sistema de asistencia está completamente funcional en línea.** ✅
