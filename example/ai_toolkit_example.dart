import 'package:ai_toolkit/src/nlp.dart';

void main() {
  final nlp = NLP();
  print(nlp.analyzeSentiment(
      "Este producto es excelente y maravilloso")); // Resultado: positivo (valor > 0)
  print(nlp.analyzeSentiment(
      " horrible, malo, triste y terrible")); // Resultado: negativo (valor < 0)
}
