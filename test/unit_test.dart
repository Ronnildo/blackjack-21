import 'package:blackjack/src/model/baralho.dart';
import 'package:blackjack/src/model/carta.dart';
import 'package:blackjack/src/model/naipe.dart';
import 'package:blackjack/src/model/valor.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    "Carta Test",
    () {
      test("criar carta naipe ouro test", () {
        Carta c = Carta(Valor.quatro, 4, Naipe.O);
        expect(c.naipe, equals(Naipe.O));
      });
      test("criar carta naipe paus test", () {
        Carta c = Carta(Valor.quatro, 4, Naipe.P);
        expect(c.naipe, equals(Naipe.P));
      });
      test("criar carta naipe copas test", () {
        Carta c = Carta(Valor.quatro, 4, Naipe.C);
        expect(c.naipe, equals(Naipe.C));
      });
      test("criar carta naipe espada test", () {
        Carta c = Carta(Valor.quatro, 4, Naipe.E);
        expect(c.naipe, equals(Naipe.E));
      });
    },
  );

  group(
    "Baralho Test",
    () {
      test("criar carta naipe ouro test", () {
        var b = Baralho.baralho;
      });
    },
  );
}
