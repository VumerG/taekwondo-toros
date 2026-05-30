# 📚 Taekwondo Toros - Sistema de Gestión de Asistencia

**Aplicación Web Completa con React, TypeScript, Tailwind CSS y Base de Datos Real**

---

## 🎯 Características

### ✅ Funcionales
- [x] Autenticación por rol (Admin, Secretario, Scanner)
- [x] Gestión de estudiantes (CRUD)
- [x] Registro de asistencia
- [x] Gráficos de asistencia
- [x] Sistema de escáner de huella dactilar simulado
- [x] Búsqueda y filtros
- [x] Tienda de productos
- [x] Interfaz responsive (móvil, tablet, PC)
- [x] Base de datos en tiempo real (Firebase)
- [x] Datos persistentes

### 🚀 Estado Actual
**Versión**: 1.0.0  
**Estado**: ✅ Listo para producción  
**Despliegue**: Firebase Hosting (gratuito)

---

## 🌐 Poner Online (15 minutos)

### Ver Guía Rápida
👉 **Abre:** `QUICK_START.md`

### O Ver Guía Completa
👉 **Abre:** `README_ONLINE.md`

---

## 💻 Desarrollo Local

```bash
# Instalar dependencias
npm install

# Iniciar servidor de desarrollo
npm run dev

# Abrir navegador
http://localhost:5173
```

### Credenciales de Prueba
- **Admin**: admin / admin123
- **Secretario**: secretario / secretario123
- **Scanner**: huella / huella123

---

## 📁 Estructura del Proyecto

```
taekwondo-toros/
├── src/app/
│   ├── components/ → Componentes React
│   ├── pages/ → Páginas (Home, Dashboard, etc)
│   ├── hooks/ → Lógica reutilizable
│   ├── types/ → Definiciones TypeScript
│   ├── lib/ → Firebase y utilidades
│   └── styles/ → CSS y Tailwind
├── .env.local → Credenciales Firebase (a llenar)
├── README_ONLINE.md → Guía completa
├── QUICK_START.md → Guía rápida
└── FIREBASE_SETUP.md → Detalles técnicos
```

---

## 🔧 Stack Tecnológico

| Aspecto | Tecnología |
|--------|-----------|
| Frontend | React 19 + TypeScript |
| Build | Vite 6 |
| Styling | Tailwind CSS 4 |
| UI Components | Radix UI |
| Routing | React Router 7 |
| Backend/DB | Firebase (Cloud Firestore) |
| Auth | Firebase Authentication |
| Hosting | Firebase Hosting |

---

## 🚀 Desplegar a Producción

### Firebase Hosting (Recomendado)
```bash
npm run build
firebase deploy
```

### Vercel
```bash
npm run build
# Push a GitHub y conectar Vercel
```

### Netlify
```bash
npm run build
# Push a GitHub y conectar Netlify
```

---

## 👥 Roles y Permisos

| Rol | Permisos |
|-----|---------|
| **Admin** | Todo (estudiantes, asistencia, estadísticas, facturación) |
| **Secretario** | Estudiantes, asistencia, estadísticas básicas |
| **Scanner** | Solo registrar asistencia |

---

## 📊 Base de Datos Firestore

Colecciones automáticas:
- `users/` - Usuarios registrados
- `students/` - Estudiantes
- `attendance/` - Registros de asistencia

---

## 📱 Acceso desde Cualquier Dispositivo

Una vez online, accede desde:
- **PC/Laptop**: Navegador
- **Teléfono Android**: Navegador + Favorito
- **iPad/Tablet**: Navegador + Favorito
- **iPhone**: Safari + Favorito

Completamente **responsive** ✅

---

## 🐛 Troubleshooting

| Problema | Solución |
|----------|---------|
| Firebase SDK Error | Verifica `.env.local` |
| Login no funciona | Crea usuarios en Firebase Auth |
| Datos no sincronizan | Verifica conexión internet |
| Despliegue falla | `firebase login` nuevamente |

---

## 📚 Documentación Completa

- **QUICK_START.md** - 15 minutos a producción
- **README_ONLINE.md** - Guía paso a paso
- **FIREBASE_SETUP.md** - Detalles técnicos

---

## ✅ Checklist

- [ ] Leer `QUICK_START.md`
- [ ] Crear proyecto Firebase
- [ ] Llenar `.env.local`
- [ ] Configurar Firestore
- [ ] Desplegar con `firebase deploy`
- [ ] ¡Usar desde cualquier dispositivo!

---

## 🎉 Lista para Usar

Tu sistema está completamente funcional para:
✅ Uso local
✅ Uso online con datos reales
✅ Múltiples dispositivos
✅ Escalable y profesional

---

**Status**: 🟢 Producción  
**Última actualización**: 19 de mayo, 2026
import reactDom from 'eslint-plugin-react-dom'

export default defineConfig([
  globalIgnores(['dist']),
  {
    files: ['**/*.{ts,tsx}'],
    extends: [
      // Other configs...
      // Enable lint rules for React
      reactX.configs['recommended-typescript'],
      // Enable lint rules for React DOM
      reactDom.configs.recommended,
    ],
    languageOptions: {
      parserOptions: {
        project: ['./tsconfig.node.json', './tsconfig.app.json'],
        tsconfigRootDir: import.meta.dirname,
      },
      // other options...
    },
  },
])
```
