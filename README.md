# AI Toolkit

AI Toolkit es una librería para Flutter/Dart que proporciona herramientas básicas de inteligencia artificial. Actualmente, incluye una funcionalidad para realizar análisis de sentimientos en texto.

## Características

- **Análisis de Sentimientos**: Determina si un texto tiene un sentimiento positivo, negativo o neutral basado en palabras clave y su relevancia.

## Instalación

Agrega la dependencia en tu archivo `pubspec.yaml`:

```yaml
dependencies:
  ai_toolkit:
    git:
      url: https://github.com/tu_usuario/ai_toolkit.git
```

Luego, ejecuta:

```bash
flutter pub get
```

## Uso

A continuación, se muestra un ejemplo básico de cómo usar la funcionalidad de análisis de sentimientos:

```dart
import 'package:ai_toolkit/ai_toolkit.dart';

void main() {
  final aiToolkit = AIToolkit();

  final text = "Este producto es excelente y maravilloso";
  final sentiment = aiToolkit.analyzeSentiment(text);

  if (sentiment > 0) {
    print("El sentimiento es positivo");
  } else if (sentiment < 0) {
    print("El sentimiento es negativo");
  } else {
    print("El sentimiento es neutral");
  }
}
```

## Cómo funciona

El análisis de sentimientos utiliza una lista de palabras positivas y negativas para evaluar el texto. Además, puede ponderar la relevancia de las palabras utilizando el algoritmo **TF-IDF** si se proporciona un conjunto de documentos de referencia.

Si no se proporcionan documentos, la librería utiliza un conjunto de documentos predeterminados para calcular la relevancia de las palabras.

## Contribuciones

¡Las contribuciones son bienvenidas! Si tienes ideas para mejorar el análisis de sentimientos o agregar nuevas funcionalidades, no dudes en abrir un issue o enviar un pull request.
