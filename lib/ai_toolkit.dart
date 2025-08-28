library ai_toolkit;

export 'src/nlp.dart';

import 'src/nlp.dart';

class AIToolkit {
  final NLP nlp;

  AIToolkit() : nlp = NLP();

  // Método para analizar sentimientos directamente desde AIToolkit
  double analyzeSentiment(String text, {List<String>? documents}) {
    return nlp.analyzeSentiment(text, documents ?? nlp.defaultDocuments);
  }

  // Otros métodos de alto nivel pueden agregarse aquí
}
