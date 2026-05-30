# 🔧 Configuración de Firebase para Taekwondo Toros

## Paso 1: Crear Proyecto en Firebase

1. Ve a **[Firebase Console](https://console.firebase.google.com/)**
2. Click en **"Crear proyecto"**
3. Nombre: `taekwondo-toros`
4. Desactiva Google Analytics (opcional)
5. Click en **"Crear proyecto"**

## Paso 2: Obtener Credenciales

1. En la consola, ve a **⚙️ Configuración del Proyecto**
2. En la pestaña **"General"**, busca **"Tus aplicaciones"**
3. Click en el icono **"</>"** (Web)
4. Nombre: `taekwondo-toros`
5. Check en **"También configurar Cloud Firestore"**
6. Click en **"Registrar app"**
7. **Copia el objeto `firebaseConfig`**

## Paso 3: Configurar Variables de Entorno

1. Abre `.env.local` en tu editor
2. Pega tus credenciales:

```
VITE_FIREBASE_API_KEY=Tu API Key
VITE_FIREBASE_AUTH_DOMAIN=taekwondo-toros.firebaseapp.com
VITE_FIREBASE_PROJECT_ID=taekwondo-toros
VITE_FIREBASE_STORAGE_BUCKET=taekwondo-toros.appspot.com
VITE_FIREBASE_MESSAGING_SENDER_ID=123456789
VITE_FIREBASE_APP_ID=1:123456789:web:...
```

## Paso 4: Configurar Firestore Database

1. En la consola Firebase, ve a **Cloud Firestore**
2. Click en **"Crear base de datos"**
3. Modo: **"Iniciar en modo de prueba"** (para desarrollo)
4. Ubicación: Cercana a tu país
5. Click en **"Crear"**

### Crear Colecciones en Firestore:

**Colección: `users`**
```
{
  "username": "admin",
  "password": "",
  "name": "Administrador Principal",
  "email": "admin@taekwondo-toros.com",
  "role": "admin"
}
```

**Colección: `students`**
```
{
  "name": "Carlos Méndez",
  "age": 25,
  "belt": "Negro",
  "joinDate": "2020-01-14",
  "fingerprintId": "01",
  "classId": "default"
}
```

**Colección: `attendance`**
```
{
  "studentId": "student-id-123",
  "date": "2026-05-19",
  "present": true,
  "createdAt": timestamp
}
```

## Paso 5: Configurar Authentication

1. En la consola Firebase, ve a **Authentication**
2. Click en **"Configurar método de inicio de sesión"**
3. Selecciona **"Correo electrónico/Contraseña"**
4. Activa **"Correo electrónico/Contraseña"** y **"Correo electrónico sin contraseña"**
5. Click **"Guardar"**

## Paso 6: Configurar Reglas de Seguridad (Importante!)

En **Cloud Firestore**, ve a la pestaña **"Reglas"** y reemplaza con:

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Permitir lectura/escritura si está autenticado
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

Click en **"Publicar"**

## Paso 7: Instalar Firebase CLI

```bash
npm install -g firebase-tools
```

## Paso 8: Iniciar Sesión en Firebase

```bash
firebase login
```

## Paso 9: Inicializar Firebase en tu proyecto

```bash
firebase init hosting
```

Responde:
- **What do you want to use as your public directory?** → `dist`
- **Configure as a single-page app?** → `y`

## Paso 10: Desplegar

```bash
npm run build
firebase deploy
```

¡Tu aplicación estará en vivo en: `https://taekwondo-toros.firebaseapp.com`

---

## 🔐 Usuarios de Prueba (crear manualmente en Firebase Auth)

| Usuario | Contraseña | Rol |
|---------|-----------|-----|
| admin@taekwondo-toros.com | admin123 | admin |
| secretario@taekwondo-toros.com | secretario123 | secretario |
| scanner@taekwondo-toros.com | scanner123 | scanner |

## 📱 Acceder desde cualquier dispositivo

Una vez desplegado, accede desde:
- **PC**: `https://taekwondo-toros.firebaseapp.com`
- **Móvil**: Mismo enlace en navegador
- **Tablet**: Mismo enlace en navegador

La aplicación es **100% responsive** ✅

---

¿Problemas? Verifica:
- ✅ Variables de entorno en `.env.local`
- ✅ Firestore está en modo de prueba
- ✅ Authentication está configurado
- ✅ Reglas de seguridad están publicadas
