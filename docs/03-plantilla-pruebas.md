# Plantilla de Casos de Prueba

| ID | Módulo | Descripción | Datos de entrada | Resultado esperado | Resultado obtenido | Estado |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **CP-01** | Arranque | La app inicia sin errores | — | Se muestra la primera pantalla sin excepción en consola | La app cargó correctamente en el emulador | **Aprobado** |
| **CP-02** | Autenticación | Inicio de sesión válido | `correo@valido.com` / `password123` | Acceso a la pantalla principal (`home_screen.dart`) | Redirección exitosa a Home | **Aprobado** |
| **CP-03** | Autenticación | Inicio de sesión inválido | `correo@valido.com` / `wrongpass` | Mensaje claro; sigue en login | Muestra alerta de error de credenciales | **Aprobado** |
| **CP-04** | Validación | Formulario vacío en Registro | Campos en blanco | Mensajes de validación activos; no se ejecuta el servicio | Campos resaltados en rojo sin llamada a Auth | **Aprobado** |
| **CP-05** | Navegación | Acceder a cada pantalla | Toque en opciones de perfil y tareas | Se abre la pantalla correcta | Transiciones fluidas a pantallas secundarias | **Aprobado** |
| **CP-06** | Navegación | Botón/gesto "atrás" | Acción de retroceso en `task_screen.dart` | Regresa a Home sin cierre inesperado | Retorno correcto al dashboard | **Aprobado** |
| **CP-07** | Datos | Crear tarea | Título: "Estudiar Flutter", Desc: "Práctica 16" | Aparece en la UI y sincroniza con Firestore | Visible en lista local y consola de Firebase | **Aprobado** |
| **CP-08** | Datos | Leer lista de tareas | — | Lista ordenada y completa de registros del usuario | Carga asíncrona de elementos completada | **Aprobado** |
| **CP-09** | Datos | Actualizar estado de tarea | Cambiar estado de pendiente a completado | Se refleja en la UI y se actualiza en Firestore | Actualización correcta en base de datos | **Aprobado** |
| **CP-12** | Estados | Error de red / Sin datos | Simulación de red desconectada al cargar lista | Mensaje amigable de error/vacío sin cierres forzosos | UI muestra indicador de reintento o vacío | **Aprobado** |
| **CP-18** | Sesión | Cerrar sesión | Pulsar botón "Salir" en `profile_screen.dart` | Vuelve a login; datos privados no visibles | Redirección segura a `login_screen.dart` | **Aprobado** |
| **CP-19** | Persistencia | Reabrir app | Cerrar aplicación por completo y volver a abrir | Mantiene la sesión activa si no se cerró explícitamente | Mantiene usuario autenticado en Home | **Aprobado** |