# People, Chats & Calls — Flutter

Aplicación de ejemplo para practicar el menú inferior en Flutter con tres secciones: **Peoples**, **Chats** y **Calls**. Los datos y las acciones son simulados; no requiere conexión a un servicio.

## Requisitos

- Flutter SDK instalado y configurado (`flutter doctor`).
- Un emulador, simulador o dispositivo conectado.

## Ejecutar

Desde la carpeta del proyecto:

```bash
flutter pub get
flutter run
```

## Recorrido de la actividad

1. `main()` inicia `MessagingDemoApp`, que configura el tema y abre `HomePage`.
2. `HomePage` es un `StatefulWidget`: guarda el índice seleccionado y lo actualiza al tocar una opción del `NavigationBar`.
3. `IndexedStack` muestra la pantalla elegida y conserva el estado de las demás.
4. `PeoplePage` presenta una lista simulada de contactos.
5. `ChatsPage` presenta conversaciones con hora y mensajes pendientes de leer.
6. `CallsPage` muestra llamadas entrantes, salientes y perdidas; sus botones simulan una llamada mediante un aviso.
7. El botón `+` muestra una acción simulada según la sección activa.

## Subir como evidencia a un repositorio

Crea un repositorio vacío en GitHub y, desde la carpeta del proyecto, ejecuta:

```bash
git init
git add .
git commit -m "Crear demo Flutter con navegación inferior"
git branch -M main
git remote add origin https://github.com/TU-USUARIO/TU-REPOSITORIO.git
git push -u origin main
```

Reemplaza la URL por la de tu repositorio. No incluyas carpetas generadas como `build/` ni archivos locales del IDE. Flutter normalmente las excluye mediante el `.gitignore` que genera `flutter create`.
