import 'package:blackjack/src/models/baralho.dart';
import 'package:blackjack/src/models/jogador.dart';

class Partida {
  Baralho? _baralho;
  List<Jogador> jogadores = [];
  late int _primeiraCarta; //Carta do topo

  baralhoIniciar() {
    _baralho;
  }

  adiconarJogadores(String p, Jogador j) {
    jogadores.add(j);
  }

  pegarCartaDoBaralho(Jogador j) {
    j.pegarCarta(_baralho!.retornaTopo(_primeiraCarta));
    j.somaDePontos();
    _primeiraCarta++;
  }

  iniciarPartida() {
    if (jogadores.length == 2) {
      iniciarPartida();
      _primeiraCarta = 0;
      limpaMao();
    }
  }

  limpaMao() {
    for (Jogador j in jogadores) {
      j.maosLimpas;
      j.jogadaTerminada = false;
    }
  }
}
