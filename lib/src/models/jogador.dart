import 'package:blackjack/src/models/carta.dart';

class Jogador {
  String? _nome;
  List<Carta> _minhasCartas = [];
  bool _jogadaTerminada = false;
  int _pontosJogador = 0;

  Jogador(this._nome) {
    jogadorSemCartas();
  }

  String get nome => _nome!;
  set nome(String nome) => _nome = nome;

  int get pontosJogador => _pontosJogador;
  set pontosJogador(int value) => _pontosJogador = value;

  bool get jogadaTerminada => _jogadaTerminada;
  set jogadaTerminada(bool value) => _jogadaTerminada = value;

  List<Carta> get minhasCartas => _minhasCartas;

  jogadorSemCartas() {
    if (_minhasCartas.isNotEmpty) {
      _minhasCartas.clear();
    }
  }

  pegarCarta(Carta c) {
    _minhasCartas.add(c);
  }

  mostrarCartas() {
    return _minhasCartas;
  }

  int somaDePontos() {
    for (Carta c in _minhasCartas) {
      _pontosJogador += c.numero;
    }
    return _pontosJogador;
  }

  @override
  String toString() {
    return "$nome + $pontosJogador";
  }
}
