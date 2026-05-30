# 🚀 Guía Completa: Taekwondo Toros Online

## Resumen Rápido

Tu aplicación está lista para funcionar **en línea con datos reales**. Solo necesitas:
1. ✅ Crear un proyecto en Firebase (5 minutos)
2. ✅ Configurar las variables de entorno (5 minutos)
3. ✅ Desplegar a Firebase Hosting (2 minutos)

**Total: ~15 minutos para tener tu app en línea**

---

## 📋 Pre-requisitos

- Cuenta de Google (para Firebase)
- Node.js instalado
- Terminal/CMD acceso al proyecto

---

## Paso 1️⃣: Crear Proyecto Firebase

### 1.1 Ir a Firebase Console
```
https://console.firebase.google.com/
```

### 1.2 Crear Nuevo Proyecto
- Click en **"Crear proyecto"** o **"Agregar proyecto"**
- Nombre: `taekwondo-toros`
- Ubicación: Tu país/región
- Click en **"Crear proyecto"** (esperar ~3 minutos)

### 1.3 Esperar Confirmación
Cuando veas el dashboard de Firebase, continúa al Paso 2.

---

## Paso 2️⃣: Registrar la App Web

### 2.1 En el Dashboard, Click en </> (Web)
```
Ícono de </> al lado de "iOS" y "Android"
```

### 2.2 Nombre de la App
```
Nombre: taekwondo-toros
```

### 2.3 Copiar Credenciales
Verás algo como:
```javascript
const firebaseConfig = {
  apiKey: "AIzaSyDemoKeyExample123456789",
  authDomain: "taekwondo-toros.firebaseapp.com",
  projectId: "taekwondo-toros",
  storageBucket: "taekwondo-toros.appspot.com",
  messagingSenderId: "123456789",
  appId: "1:123456789:web:abc123def456ghi789",
};
```

**Copia estos valores** → Irán en `.env.local`

---

## Paso 3️⃣: Crear Archivo .env.local

### 3.1 En tu proyecto, crea: `.env.local`

```bash
# Windows (en la carpeta del proyecto)
type nul > .env.local
```

### 3.2 Pega tus credenciales:

```env
VITE_FIREBASE_API_KEY=AIzaSyDemoKeyExample123456789
VITE_FIREBASE_AUTH_DOMAIN=taekwondo-toros.firebaseapp.com
VITE_FIREBASE_PROJECT_ID=taekwondo-toros
VITE_FIREBASE_STORAGE_BUCKET=taekwondo-toros.appspot.com
VITE_FIREBASE_MESSAGING_SENDER_ID=123456789
VITE_FIREBASE_APP_ID=1:123456789:web:abc123def456ghi789
```

**⚠️ IMPORTANTE**: No compartas este archivo. Está en `.gitignore`

---

## Paso 4️⃣: Configurar Firestore Database

### 4.1 En Firebase Console, click en **Cloud Firestore**

### 4.2 Click en **"Crear base de datos"**

### 4.3 Configuración:
- **Modo**: "Iniciar en modo de prueba"
- **Ubicación**: Tu región más cercana
- Click en **"Crear"**

### 4.4 Crear Colecciones Automáticamente

La app creará estas colecciones automáticamente:
- `users` - Usuarios registrados
- `students` - Estudiantes
- `attendance` - Registros de asistencia

---

## Paso 5️⃣: Configurar Autenticación

### 5.1 Click en **Authentication** (lado izquierdo)

### 5.2 Click en **"Configurar método de inicio de sesión"**

### 5.3 Selecciona **"Correo electrónico/Contraseña"**

### 5.4 Activa:
- ✅ Correo electrónico/Contraseña
- ✅ Correo electrónico con contraseña

Click en **"Guardar"**

### 5.5 Crear Usuarios de Prueba

Click en **"Agregar usuario"**

Crea estos 3 usuarios:

| Email | Contraseña | Rol |
|-------|-----------|-----|
| admin@taekwondo-toros.com | admin123 | admin |
| secretario@taekwondo-toros.com | secretario123 | secretario |
| scanner@taekwondo-toros.com | scanner123 | scanner |

---

## Paso 6️⃣: Configurar Reglas de Seguridad

### 6.1 En Cloud Firestore, click en **"Reglas"**

### 6.2 Reemplaza TODO el contenido con:

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /users/{userId} {
      allow read, write: if request.auth.uid == userId;
    }
    match /students/{document=**} {
      allow read, write: if request.auth != null;
    }
    match /attendance/{document=**} {
      allow read, write: if request.auth != null;
    }
  }
}
```

### 6.3 Click en **"Publicar"**

---

## Paso 7️⃣: Instalar Firebase CLI

```bash
npm install -g firebase-tools
```

---

## Paso 8️⃣: Login en Firebase

```bash
firebase login
```

Se abrirá tu navegador para que inicies sesión con tu cuenta Google.

---

## Paso 9️⃣: Inicializar Firebase en el Proyecto

En la carpeta de tu proyecto:

```bash
firebase init hosting
```

Responde las preguntas:
```
? What do you want to use as your public directory? dist
? Configure as a single-page app? Yes
? Set up automatic builds and deploys? No
```

Esto crea `firebase.json` y `.firebaserc`

---

## Paso 🔟: Compilar y Desplegar

### 10.1 Compilar el proyecto
```bash
npm run build
```

### 10.2 Desplegar a Firebase Hosting
```bash
firebase deploy
```

**¡Listo!** Tu app estará en vivo en:
```
https://taekwondo-toros.firebaseapp.com
```

---

## 📱 Acceder desde Cualquier Dispositivo

Una vez desplegado, accede desde:

### PC/Laptop
```
https://taekwondo-toros.firebaseapp.com
```

### Teléfono/Tablet (Android/iOS)
1. Abre el navegador
2. Pega la URL
3. Marca como favorito
4. ¡Listo!

La app es **100% responsive** ✅

---

## 🧪 Pruebas

### 1. Iniciar Sesión con Credenciales de Prueba
```
Email: admin@taekwondo-toros.com
Contraseña: admin123
```

### 2. Pruebas Funcionales
- ✅ Login/Logout
- ✅ Agregar estudiantes
- ✅ Registrar asistencia
- ✅ Ver gráficos
- ✅ Búsqueda
- ✅ Filtros

---

## 🔧 Troubleshooting

### Error: "Firebase SDK Error"
**Solución**: Verifica que `.env.local` tenga las credenciales correctas

### Error: "CORS Error"
**Solución**: Las reglas de Firestore deben estar publicadas

### Error: "User not found"
**Solución**: Crea el usuario en Authentication

### App no responde
**Solución**: Recarga la página (Ctrl+R o Cmd+R)

---

## 📊 Ver Datos en Firebase

Para ver los datos que tu app está guardando:

1. Firebase Console → Cloud Firestore
2. Click en la colección (`students`, `attendance`, etc.)
3. Ve todos los datos en tiempo real

---

## 🔐 Seguridad Importante

Nunca compartas:
- `.env.local` ⛔
- `firebaserc` ⛔
- Credenciales de Firebase ⛔

Mantén privados:
- API Key ⛔
- Auth Domain ⛔
- Project ID ⛔

---

## 📈 Próximos Pasos (Opcional)

Una vez online, puedes:

1. **Comprar dominio personalizado**
   - Firebase Hosting → Dominios personalizados
   - Ejemplo: `asistencia.taekwondotoros.com`

2. **Agregar más usuarios**
   - Authentication → Agregar usuarios manualmente
   - O implementar registro de usuarios

3. **Respaldar datos**
   - Export en Firestore (periódico)

4. **Monitoreo**
   - Firebase Console → Monitoreo
   - Ver estadísticas de uso

---

## ✅ Checklist Final

- [ ] Proyecto Firebase creado
- [ ] App web registrada
- [ ] `.env.local` configurado
- [ ] Firestore habilitado
- [ ] Authentication configurado
- [ ] Usuarios de prueba creados
- [ ] Reglas de seguridad publicadas
- [ ] Firebase CLI instalado
- [ ] Desplegado exitosamente
- [ ] Accesible desde navegador

---

## 💡 Tips

1. **Rápido**: Firebase hosting es muy rápido (~100ms latencia)
2. **Escalable**: Soporta miles de usuarios simultáneamente
3. **Automático**: Se actualiza en tiempo real sin recargar
4. **Gratis**: Plan gratuito cubre muchísimo uso
5. **SSL**: Todos los datos encriptados automáticamente

---

## 🎉 ¡Felicidades!

Tu sistema de asistencia para Taekwondo Toros está **100% funcional en línea** con datos reales en una base de datos profesional. 

Accesible desde cualquier dispositivo, en cualquier lugar, en cualquier momento. ✅

---

¿Preguntas? Revisa:
- `FIREBASE_SETUP.md` - Guía detallada
- Firebase Console → Documentación
- Stack Overflow - Busca tu error específico
