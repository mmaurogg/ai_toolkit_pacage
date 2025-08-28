import 'dart:math' as math;

class NLP {
  final defaultDocuments = [
    "este producto es bueno y útil",
    "la experiencia fue excelente y maravillosa",
    "el servicio fue malo y decepcionante",
    "me siento feliz con el resultado",
    "la calidad es pésima y horrible",
  ];

  List<String> tokenize(String text) {
    final regex = RegExp(r'\b\w+\b', caseSensitive: false);
    return regex
        .allMatches(text)
        .map((match) => match.group(0)!.toLowerCase())
        .toList();
  }

  // Calcula la frecuencia de cada palabra en un documento
  Map<String, double> calculateTF(String document) {
    final tokens = tokenize(document);
    final tokenCount = tokens.length;

    final tf = <String, double>{};
    for (var token in tokens) {
      tf[token] = (tf[token] ?? 0) + 1 / tokenCount;
    }
    return tf;
  }

  // Calcula la frecuencia inversa de documentos para cada palabra en una lista de documentos
  Map<String, double> calculateIDF(List<String> documents) {
    final idf = <String, double>{};
    final totalDocuments = documents.length;

    final documentTokens = documents.map(tokenize).toList();
    final allTokens = documentTokens.expand((tokens) => tokens).toSet();

    for (var token in allTokens) {
      final containingDocs =
          documentTokens.where((tokens) => tokens.contains(token)).length;
      idf[token] = (containingDocs > 0)
          ? math.log(1 + totalDocuments / (1 + containingDocs))
          : 0;
    }
    return idf;
  }

  Map<String, double> calculateTFIDF(String document, List<String> documents) {
    final tf = calculateTF(document);
    final idf = calculateIDF(documents);

    final tfidf = <String, double>{};
    for (var token in tf.keys) {
      tfidf[token] = tf[token]! * (idf[token] ?? 0);
    }
    return tfidf;
  }

  double analyzeSentiment(String text, [List<String>? documents]) {
    if (documents == null || documents.isEmpty) {
      documents = defaultDocuments;
    }
    // Listas de palabras positivas y negativas
    final positiveWords = [
      'bueno',
      'excelente',
      'feliz',
      'maravilloso',
      'genial',
      'gracias',
      'lindo',
      'fantástico',
      'positivo',
      'agradable',
      'increíble',
      'satisfecho',
      'perfecto',
      'espectacular',
      'brillante',
      'fabuloso',
      'sorprendente',
      'divertido',
      'emocionante',
      'alegre',
      'encantador',
      'asombroso',
      'excepcional',
      'notable',
      'sensacional',
    ];
    final negativeWords = [
      'malo',
      'horrible',
      'triste',
      'terrible',
      'horrendo',
      'desperdicio',
      'feo',
      'pésimo',
      'negativo',
      'desagradable',
      'decepcionante',
      'insatisfecho',
      'defectuoso',
      'lamentable',
      'vergonzoso',
      'aburrido',
      'frustrante',
      'angustiante',
      'desalentador',
      'desastroso',
    ];

    // Calcular TF-IDF para el texto
    final tfidf = calculateTFIDF(text, documents);

    // Calcular puntaje ponderado
    double score = 0;
    double totalWeight = 0;

    for (var token in tfidf.keys) {
      if (positiveWords.contains(token)) {
        score += tfidf[token]!;
      } else if (negativeWords.contains(token)) {
        score -= tfidf[token]!;
      }
      totalWeight += tfidf[token]!;
    }

    // Normalizar el puntaje
    return totalWeight > 0 ? score / totalWeight : 0;
  }
}
