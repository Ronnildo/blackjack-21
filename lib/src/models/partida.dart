import 'package:blackjack/src/exceptions/excessao_numero_de_jogadores_invalido.dart';
import 'package:blackjack/src/models/baralho_singleton.dart';
import 'package:blackjack/src/models/carta.dart';
import 'package:blackjack/src/models/jogador.dart';
import 'package:blackjack/src/models/observer.dart';

abstract class Observable {
  void addObserver(Observer observer);
  void removeObserver(Observer observer);
  void notifyChange(Carta carta);
}

class Partida implements Observable {
  var baralho;
  final List<Observer> _listObserverCarta = [];
  final List<Jogador> _jogadores = [];
  int top = 0;

  void iniciarPartida() {
    baralho = Baralho.baralho;
    limparMaos();
    distribuirCartas();
  }

  void pegarCarta(Jogador j) {
    j.pegarCarta(baralho.retornaTopo(top));
    top++;
  }

  int retornaPontuacao(Jogador j) {
    int soma = 0;
    for (Carta c in j.minhasCartas) {
      soma += c.numero;
    }
    return soma;
  }

  void limparMaos() {
    for (Jogador j in _jogadores) {
      j.jogadorSemCartas();
      j.jogadaTerminada = false;
    }
  }

  void adiconarJogadores(Jogador playerOne) {
    try {
      if (_jogadores.length < 2) {
        _jogadores.add(playerOne);
      }
    } catch (err) {
      throw ExcessaoNumeroDeJogadoresInvalidos("Número de Jogadores Inválidos");
    }
  }

  void distribuirCartas() {
    for (int i = 0; i <= 1; i++) {
      for (Jogador j in _jogadores) {
        pegarCarta(j);
      }
    }
  }

  partidaEncerrada() {
    for (Jogador j in _jogadores) {
      if (j.jogadaTerminada) {
        return true;
      }
    }
    return false;
  }

  bool vencedor() {
    if (partidaEncerrada()) {
      return true;
    }
    return false;
  }

  void jogadorDaVez(Jogador j) {
    if (!j.jogadaTerminada) {
      pegarCarta(j);
    }
    if (retornaPontuacao(j) == 21) {
      j.jogadaTerminada = true;
    } else if (retornaPontuacao(j) > 21) {
      j.jogadaTerminada = true;
    }
    j.mostrarCartas();
  }

  List<Jogador> get jogadores => _jogadores;

  @override
  void addObserver(Observer observer) {
    _listObserverCarta.add(observer);
  }

  @override
  void removeObserver(Observer observer) {
    _listObserverCarta.remove(observer);
  }

  @override
  void notifyChange(Carta carta) {
    for (var observer in _listObserverCarta) {
      observer.notifyChange(carta);
    }
  }
}
