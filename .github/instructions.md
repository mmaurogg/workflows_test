# Instrucciones de CI/CD para `ci_app`

## validation
- Tipo: calidad de código
- Trigger: `push` y `pull_request`
- Plataforma: GitHub Actions en `ubuntu-latest`
- Pasos:
  - `actions/checkout@v6`
  - `subosito/flutter-action@v2` con `channel: stable`, `flutter-version: 3.35.0`
  - `bash ./scripts/check_flutter_version.sh`
  - `flutter pub get`
  - `dart format --output=none --set-exit-if-changed .`
  - `flutter analyze`
  - `flutter test`

## build_android
- Tipo: build
- Dependencia: `needs: validation`
- Output: APK
- Plataforma: GitHub Actions en `ubuntu-latest`
- Pasos:
  - `actions/checkout@v6`
  - `subosito/flutter-action@v2`
  - `bash ./scripts/check_flutter_version.sh`
  - `flutter pub get`
  - `flutter build apk`
  - `actions/upload-artifact@v7` para subir `build/app/outputs/flutter-apk/app-release.apk`

## device_validation
- Tipo: pruebas en dispositivo físico local
- Trigger: `workflow_dispatch`
- Requisito: runner `self-hosted` o local con dispositivo Android/iOS conectado
- Pasos sugeridos:
  - `actions/checkout@v6`
  - `subosito/flutter-action@v2`
  - `bash ./scripts/check_flutter_version.sh`
  - `flutter pub get`
  - Ejecutar tests de integración:
    - `flutter test integration_test/main_test.dart`
  - Opcional para pruebas en dispositivo:
    - `flutter drive --driver integration_test/driver.dart integration_test/main_test.dart`

> Nota: para ejecutar realmente en un dispositivo físico, el workflow debe correr en un runner local/self-hosted con el dispositivo conectado y configurado.

## Observación del repositorio
El repo ya tiene `.github/workflows/ci.yml` con `validation` y `build_android`. Los archivos `.github/workflows/build_android.yml`, `.github/workflows/device_validation.yml` y `.github/workflows/validation.yml` aparecen vacíos, así que si quieres un archivo `instructions` independiente, este texto es el adecuado para copiar.

Si quieres, también puedo sugerirte el contenido exacto de cada workflow YAML basado en estas reglas.# Instrucciones de CI/CD para `ci_app`

## validation
- Tipo: calidad de código
- Trigger: `push` y `pull_request`
- Plataforma: GitHub Actions en `ubuntu-latest`
- Pasos:
  - `actions/checkout@v6`
  - `subosito/flutter-action@v2` con `channel: stable`, `flutter-version: 3.35.0`
  - `bash ./scripts/check_flutter_version.sh`
  - `flutter pub get`
  - `dart format --output=none --set-exit-if-changed .`
  - `flutter analyze`
  - `flutter test`

## build_android
- Tipo: build
- Dependencia: `needs: validation`
- Output: APK
- Plataforma: GitHub Actions en `ubuntu-latest`
- Pasos:
  - `actions/checkout@v6`
  - `subosito/flutter-action@v2`
  - `bash ./scripts/check_flutter_version.sh`
  - `flutter pub get`
  - `flutter build apk`
  - `actions/upload-artifact@v7` para subir `build/app/outputs/flutter-apk/app-release.apk`

## device_validation
- Tipo: pruebas en dispositivo físico local
- Trigger: `workflow_dispatch`
- Requisito: runner `self-hosted` o local con dispositivo Android/iOS conectado
- Pasos sugeridos:
  - `actions/checkout@v6`
  - `subosito/flutter-action@v2`
  - `bash ./scripts/check_flutter_version.sh`
  - `flutter pub get`
  - Ejecutar tests de integración:
    - `flutter test integration_test/main_test.dart`
  - Opcional para pruebas en dispositivo:
    - `flutter drive --driver integration_test/driver.dart integration_test/main_test.dart`

> Nota: para ejecutar realmente en un dispositivo físico, el workflow debe correr en un runner local/self-hosted con el dispositivo conectado y configurado.

## Observación del repositorio
El repo ya tiene `.github/workflows/ci.yml` con `validation` y `build_android`. Los archivos `.github/workflows/build_android.yml`, `.github/workflows/device_validation.yml` y `.github/workflows/validation.yml` aparecen vacíos, así que si quieres un archivo `instructions` independiente, este texto es el adecuado para copiar.