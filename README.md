# News App Flutter

**News App Flutter** es una aplicación móvil simple para mostrar noticias en tiempo real, desarrollada utilizando **Flutter** y gestionada con el patrón de arquitectura **Bloc**. La aplicación consume la [News API](https://newsapi.org/) para obtener y mostrar las últimas noticias de varias categorías.

## Características

- **Visualización de noticias**: Muestra una lista de las últimas noticias con detalles como título, imagen y descripción.
- **Gestión de estado con Bloc**: Uso del patrón Bloc para gestionar los diferentes estados de la app (cargando, datos listos, error).
- **Paginación**: La lista de noticias se carga de manera incremental conforme el usuario se desplaza hacia abajo.
- **Modularidad y reutilización**: Los widgets están diseñados de manera modular para ser reutilizables.
- **Diseño responsivo**: Adaptado para funcionar en diferentes tamaños de pantalla.
  
## Tecnologías utilizadas

- **Flutter**: Framework para construir interfaces de usuario nativas multiplataforma.
- **Bloc**: Gestor de estado basado en el patrón BLoC (Business Logic Component).
- **News API**: API RESTful utilizada para obtener los artículos de noticias.
  
## Instalación y configuración

### Requisitos previos
- Flutter SDK instalado (versión 3.10.5 o superior)
- Editor de texto (como VSCode o Android Studio)
- Una clave de API de [News API](https://newsapi.org/) (es necesario registrarse para obtenerla)

### Instrucciones

1. Clona este repositorio:
   ```bash
   git clone https://github.com/AvidanGC/news_app_flutter.git

2. Navega al directorio del proyecto:
   ```bash
   cd news_app_flutter

3. Instala las dependencias:
   ```bash
   flutter pub get

4. Corre la aplicación en un dispositivo o emulador:
    ```bash
    flutter run




