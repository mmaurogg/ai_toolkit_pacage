import 'package:ai_toolkit/src/nlp.dart';
import 'package:test/test.dart';

void main() {
  final nlp = NLP();

  test("NLP analyzes sentiment with TF-IDF correctly", () {
    final sentiment =
        nlp.analyzeSentiment("este producto es excelente y maravilloso");
    expect(sentiment, greaterThan(0)); // Sentimiento positivo

    final negativeSentiment =
        nlp.analyzeSentiment("horrible, malo, triste y terrible");
    expect(negativeSentiment, lessThan(0)); // Sentimiento negativo
  });
}
