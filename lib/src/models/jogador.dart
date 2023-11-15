import 'package:blackjack/src/models/carta.dart';

class Jogador {
  String? _nome;
  List<Carta> _minhasCartas = [];
  bool? _jogadaTerminada;
  int _pontosJogador = 0;

  Jogador(this._nome) {
    jogadorSemCartas();
  }

  String get nome => _nome!;
  set nome(String nome) => _nome = nome;

  int get pontosJogador => _pontosJogador;
  set pontosJogador(int value) => _pontosJogador = value;

  bool get jogadaTerminada => _jogadaTerminada!;
  set jogadaTerminada(bool value) => _jogadaTerminada = value;

  List<Carta> get maosLimpas => _minhasCartas;

  jogadorSemCartas() {
    if (_minhasCartas.isEmpty) {
      return true;
    }
  }

  pegarCarta(Carta c) {
    _minhasCartas.add(c);
  }

  mostrarCartas() {
    for (Carta c in _minhasCartas) {
      print(c.toString());
    }
  }

  somaDePontos() {
    for (Carta c in _minhasCartas) {
      _pontosJogador += c.numero;
    }
    return pontosJogador;
  }

  @override
  String toString() {
    return "Nome: $nome, Pontuação: $pontosJogador";
  }
}
