import 'dart:math';

import 'package:blackjack/src/models/carta.dart';
import 'package:blackjack/src/models/naipe.dart';
import 'package:blackjack/src/models/valor.dart';

class Baralho {
  final int qtdCartas = 52;
  List<Carta> cartaList = [];
  List<int> cartasEmbaralhadas = [];

  Baralho._() {
    criarBaralho();
    embaralhar();
    // printBaralho();
  }
  static final baralho = Baralho._();

  criarBaralho() {
    List<Naipe> naipes = Naipe.values;
    List<Valor> valores = Valor.values;

    for (int n = 0; n < 4; n++) {
      Naipe naipe = naipes[n];
      for (var i = 0; i < 13; i++) {
        Valor valor = valores[i];
        if (i > 9) {
          Carta c = Carta(valor, 10, naipe);
          cartaList.add(c);
        } else {
          Carta c = Carta(valor, i + 1, naipe);
          cartaList.add(c);
        }
      }
    }
    // print(cartaList[0].numero);
  }

  int contemNaLista(int val) {
    for (int ant in cartasEmbaralhadas) {
      if (val == ant) {
        val = Random().nextInt(52);
        return contemNaLista(val);
      }
    }
    return val;
  }

  embaralhar() {
    for (int i = 0; i < qtdCartas; i++) {
      var sort = Random().nextInt(52);
      cartasEmbaralhadas.add(contemNaLista(sort));
    }
  }

  printBaralho() {
    if (cartaList.isNotEmpty) {
      for (Carta c in cartaList) {
        print(c.toString());
      }
    } else {
      for (int value in cartasEmbaralhadas) {
        print(cartaList.elementAt(value).toString());
      }
    }
  }

  Carta retornaTopo(int value) {
    int aux = cartas.elementAt(value);
    return cartaList.elementAt(aux);
  }

  List<int> get cartas => cartasEmbaralhadas;
}
