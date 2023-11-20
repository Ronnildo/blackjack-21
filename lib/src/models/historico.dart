import 'package:blackjack/src/models/jogador.dart';
import 'package:blackjack/src/models/partida.dart';

class Historico {
  List<Map<String, dynamic>> resultados = [];

  addPartidaHistorico(Map<String, dynamic> partida) {
    resultados.add(partida);
  }

  removerPartidaHistorico(Map<String, dynamic> partida) {
    resultados.remove(partida);
  }

  List<Map<String, dynamic>> retornaHistorico() {
    return resultados;
  }

  @override
  String toString() {
    // TODO: implement toString
    return resultados.toString();
  }
}

/**"jogadores": {
          "jogador1": j1.nome,
          "jogador2": j2.nome,
        },
        "Pontuação": {"Pontuação Jogador 1": ptJ1, "Pontuação Jogador 2": ptJ2},
        "Resultado": p.retornaResultado(j1, j2), */