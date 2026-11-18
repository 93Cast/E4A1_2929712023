# Mapa de Flujos Críticos

Se definen 4 flujos críticos principales evaluados de extremo a extremo en la aplicación:

1. **Autenticación de usuario:** El usuario puede ingresar sus credenciales válidas en la pantalla de inicio de sesión (`login_screen.dart`) y acceder de manera exitosa a la pantalla principal (`home_screen.dart`).
2. **Gestión de tareas (Creación):** El usuario puede navegar hacia la pantalla de tareas (`task_screen.dart`), rellenar el formulario con los datos requeridos de una nueva tarea y verificar su almacenamiento inmediato en Cloud Firestore y su reflejo visual en la interfaz.
3. **Exploración de navegación general:** El usuario puede desplazarse de forma fluida y sin cierres inesperados a través de la barra de navegación o menús hacia el perfil de usuario (`profile_screen.dart`), la lista de tareas y regresar mediante el botón de retroceso (`app_routes.dart`).
4. **Cierre de sesión y protección de datos:** El usuario puede pulsar la opción de cerrar sesión desde su perfil, invalidando la sesión activa actual y redirigiendo de forma segura al flujo de autenticación, impidiendo el acceso a pantallas privadas sin credenciales.