# Registro de Incidencias

### Incidencia INC-001 (Corregida)
* **Módulo:** Autenticación / UI
* **Severidad:** Alta | **Prioridad:** Alta
* **Descripción:** Excepción de tipo `NullPointerException` al intentar leer los datos del usuario autenticado inmediatamente después del registro antes de que el stream de Firebase emita el objeto actualizado.
* **Causa raíz:** Falta de verificación de nulidad (`?.`) y control de estado asíncrono en `profile_screen.dart` al consumir el servicio `auth_service.dart`.
* **Método de resolución (5 pasos aplicado):**
  1. *Reproducir:* Registrar usuario nuevo y acceder directamente al perfil.
  2. *Leer:* Revisar traza de consola en Flutter DevTools (`Null check operator used on a null value`).
  3. *Hipótesis:* El widget intenta renderizar `user.email` antes de que Firebase devuelva la entidad completa.
  4. *Comprobar:* Añadir un condicional de carga (`CircularProgressIndicator`) mientras se resuelve el futuro.
  5. *Corregir y proteger:* Se actualizó `profile_screen.dart` y se protegió la UI con validaciones de nulos.
* **Commit de corrección asociadas:** `fix: INC-001 corregir manejo de nulos en perfil de usuario`
* **Estado:** **Corregida y Re-probada (Aprobado)**

---

### Incidencia INC-002 (Corregida)
* **Módulo:** Base de Datos (Firestore)
* **Severidad:** Media | **Prioridad:** Media
* **Descripción:** Al crear una tarea con campos de fecha vacíos o nulos, la aplicación generaba un error de escritura en Firestore debido a restricciones de esquema.
* **Causa raíz:** Falta de un valor por defecto o validación previa en el modelo `task_model.dart` antes de serializar a JSON.
* **Método de resolución:** Se añadió una validación defensiva en `task_model.dart` para asignar la fecha actual por defecto si el parámetro llega nulo.
* **Commit de corrección asociado:** `fix: INC-002 agregar valores por defecto en modelo de tareas`
* **Estado:** **Corregida y Re-probada (Aprobado)**

---

### Incidencia INC-003 (Corregida)
* **Módulo:** Navegación y Rutas
* **Severidad:** Baja | **Prioridad:** Baja
* **Descripción:** Advertencia recurrente en consola por rutas nombradas no tipadas correctamente en `app_routes.dart` generando avisos de rendimiento en depuración.
* **Causa raíz:** Declaración estática antigua en el mapa de rutas de MaterialApp.
* **Método de resolución:** Estandarización de rutas mediante funciones generadoras y constantes de texto limpias.
* **Commit de corrección asociado:** `refactor: INC-003 optimizar rutas nombradas en app_routes.dart`
* **Estado:** **Corregida y Re-probada (Aprobado)**