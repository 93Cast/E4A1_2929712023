# Declaración de Alcance - TaskFlow / App Flutter

A continuación se detalla el alcance funcional implementado y verificado en la aplicación Flutter para la práctica de integración y pruebas.

| Módulo / servicio | ¿Aplica? | Observación |
| :--- | :---: | :--- |
| **Autenticación** | Sí | Implementado mediante Firebase Authentication (`auth_service.dart`) para inicio de sesión y registro de usuarios. |
| **Base de datos (Firestore / Realtime DB)** | Sí | Uso de Cloud Firestore (`firestore_service.dart`) para la persistencia, lectura, escritura y sincronización de tareas. |
| **Almacenamiento (Storage)** | No | No se requiere almacenamiento de archivos multimedia en esta versión del proyecto. |
| **Notificaciones push (FCM)** | No / Opcional | *No ejecutado en dispositivo físico actual por limitaciones de emulador, justificado en la plantilla de pruebas.* |
| **API REST externa** | No | La aplicación consume directamente los servicios de Firebase sin intermediarios REST externos. |
| **Otros (Analytics, Crashlytics, Remote Config…)** | No | Fuera del alcance actual del proyecto. |