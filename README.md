<img src="https://raw.githubusercontent.com/dart-lang/site-shared/main/src/_assets/image/dart/logo/64.png" alt="Dart Logo" width="64" height="64"> <img src="https://storage.googleapis.com/cms-storage-bucket/0dbfcc7a59cd1cf16282.png" alt="Flutter Logo" width="64" height="64">
# Demo View Shopify




**Demo_View_Shopify** es una aplicación demo móvil híbrida desarrollada con **Flutter** y **Dart**, disponible para **iOS** y **Android**. Esta aplicación muestra una vista de una tienda online, que consume una API creada con **NestJS** utilizando **AUTHJWT** para autenticación. La arquitectura sigue principios de **Clean Architecture**, con una estructura modular y escalable.

## Requisitos previos

Asegúrate de tener las siguientes herramientas instaladas:

- [Flutter](https://flutter.dev/docs/get-started/install) (versión 3.0 o superior)
- [Dart](https://dart.dev/get-dart)
- Un editor de código compatible (se recomienda [Visual Studio Code](https://code.visualstudio.com/) o [Android Studio](https://developer.android.com/studio))

## Instalación

Para ejecutar este proyecto localmente, sigue estos pasos:

1. Clona este repositorio:

    ```bash
    git clone https://github.com/alejandromacedopa/demo_view_shopify.git
    ```

2. Navega al directorio del proyecto:

    ```bash
    cd demo_view_shopify
    ```

3. Instala las dependencias de Flutter:

    ```bash
    flutter pub get
    ```

4. Ejecuta la aplicación en un emulador o dispositivo conectado:

    ```bash
    flutter run
    ```

## Descripción del proyecto

Este proyecto tiene como objetivo desarrollar un aplicativo móvil híbrido (para **iOS** y **Android**) que simula una tienda online, consumiendo una API externa creada con **NestJS**. La autenticación de usuarios se maneja a través de **JWT** (JSON Web Tokens), permitiendo un flujo seguro para el registro e inicio de sesión de los usuarios.

## Estructura del proyecto

La estructura del proyecto sigue una arquitectura limpia, con diferentes capas para manejar la lógica de negocio, datos y presentación. Aquí está la estructura principal:

```plaintext
lib/
├── src/
│   ├── data/                # Capa de datos
│   │   ├── api/
│   │   │   └── ApiConfig.dart
│   │   ├── dataSource/
│   │   ├── local/
│   │   ├── remote/
│   │   │   └── services/
│   │   │       └── AuthServices.dart
│   │   ├── repository/
│   │       └── AuthRepositoryImpl.dart
│   ├── di/                  # Inyección de dependencias
│   │   └── AppModule.dart
│   ├── domain/              # Lógica de negocio
│   │   ├── models/
│   │   │   ├── AuthResponse.dart
│   │   │   ├── Role.dart
│   │   │   └── User.dart
│   │   ├── repository/
│   │   │   └── AuthRepository.dart
│   │   └── useCases/
│   │       └── auth/
│   │           ├── AuthUseCases.dart
│   │           ├── GetUserSessionUseCase.dart
│   │           ├── LoginUseCase.dart
│   │           └── RegisterUseCase.dart
│   ├── presentation/        # Capa de presentación (UI)
│   │   ├── pages/
│   │   │   └── auth/
│   │   │       └── register/
│   │   │           └── RegisterPage.dart
│   │   └── blocProviders.dart
│   ├── utils/               # Utilidades
│   │   └── BlocFormItem.dart
│   └── widget/              # Widgets personalizados
│       ├── DefaultIconBack.dart
│       ├── DefaultTextField.dart
│       └── Injection.dart
├── main.dart                # Punto de entrada de la aplicación
├── Injection.config.dart    # Configuración de in
