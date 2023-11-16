import 'package:blackjack/src/models/naipe.dart';
import 'package:blackjack/src/models/valor.dart';

class Carta {
  Valor _valor;
  int _numero;
  Naipe _naipe;

  Carta(this._valor, this._numero, this._naipe);

  set valor(Valor value) => _valor = value;
  Valor get valor => _valor;

  set numero(int numero) => _numero = numero;
  int get numero => _numero;

  set naipe(Naipe naipe) => _naipe = naipe;
  Naipe get naipe => _naipe;

  literalNaipe(Naipe n) {
    if (naipe == Naipe.C) {
      return "Copas";
    } else if (naipe == Naipe.O) {
      return "Ouro";
    } else if (naipe == Naipe.P) {
      return "Paus";
    } else if (naipe == Naipe.E) {
      return "Espadas";
    }
  }

  @override
  String toString() {
    if (valor.name == "a" ||
        valor.name == "J" ||
        valor.name == "Q" ||
        valor.name == "K") {
      return "${valor.name.toUpperCase()}${naipe.name}";
    }
    return "$numero${naipe.name}";
  }
}
