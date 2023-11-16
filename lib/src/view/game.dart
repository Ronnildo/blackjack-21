import 'package:blackjack/src/models/carta.dart';
import 'package:blackjack/src/models/jogador.dart';
import 'package:blackjack/src/models/naipe.dart';
import 'package:blackjack/src/models/observer.dart';
import 'package:blackjack/src/models/partida.dart';
import 'package:blackjack/src/models/valor.dart';
import 'package:blackjack/src/view/home.dart';
import 'package:blackjack/src/view/widgets/card_baralho.dart';
import 'package:blackjack/src/view/widgets/jogador_name.dart';
import 'package:flutter/material.dart';

// Utilizando Observer
class GameScreen extends StatefulWidget {
  final Partida partida;
  const GameScreen({
    Key? key,
    required this.partida,
  }) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> implements Observer {
  @override
  void initState() {
    widget.partida.iniciarPartida();
    widget.partida.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    widget.partida.removeObserver(this);
    super.dispose();
  }

  dialog(String title, String text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(text),
          alignment: Alignment.center,
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Voltar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(),
                        ));
                  },
                  child: Text('Iniciar Nova Partida'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  List<Carta> lista(int index) {
    return widget.partida.jogadores[index].mostrarCartas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 14, 126, 18),
      appBar: AppBar(
        title: const Text(
          'BlackJack',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.purple.shade800,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 40,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Pontuação de ${widget.partida.jogadores[0].nome}: ${widget.partida.retornaPontuacao(widget.partida.jogadores[0])}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 5,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: lista(0).map((car) {
                  return CardBaralho(
                    carta: car,
                  );
                }).toList(),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              "Pontuação de ${widget.partida.jogadores[1].nome}: ${widget.partida.retornaPontuacao(widget.partida.jogadores[1])}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 5,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: lista(1).map((car) {
                  return CardBaralho(
                    carta: car,
                  );
                }).toList(),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (!widget.partida.jogadores[0].jogadaTerminada) {
                      setState(() {
                        widget.partida
                            .jogadorDaVez(widget.partida.jogadores[0]);
                        if (widget.partida.jogadores[0].jogadaTerminada) {
                          if (widget.partida.retornaPontuacao(
                                  widget.partida.jogadores[0]) ==
                              21) {
                            dialog("Você venceu!!",
                                "Atingiu os ${widget.partida.jogadores[0]} pontos");
                          } else if (widget.partida.retornaPontuacao(
                                  widget.partida.jogadores[0]) >
                              21) {
                            dialog(
                                "Você Perdeu!!",
                                "Atingiu ${widget.partida.retornaPontuacao(
                                  widget.partida.jogadores[0],
                                )} Pontos");
                          }
                        }
                      });
                    } else {
                      setState(() {
                        widget.partida
                            .jogadorDaVez(widget.partida.jogadores[1]);
                        if (widget.partida.jogadores[1].jogadaTerminada) {
                          if (widget.partida.retornaPontuacao(
                                  widget.partida.jogadores[1]) ==
                              21) {
                            dialog("Você venceu!!",
                                "Atingiu os ${widget.partida.retornaPontuacao(widget.partida.jogadores[1])} pontos");
                          } else if (widget.partida.retornaPontuacao(
                                  widget.partida.jogadores[1]) >
                              21) {
                            dialog(
                                "Você Perdeu!!",
                                "Atingiu ${widget.partida.retornaPontuacao(
                                  widget.partida.jogadores[1],
                                )} Pontos");
                          }
                        }
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple.shade800,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                  ),
                  child: const Text(
                    "Pegar Carta",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    for (Jogador j in widget.partida.jogadores) {
                      if (j.jogadaTerminada) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Text(
                                  "Vez do Jogador ${widget.partida.jogadores[1].nome}",
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              );
                            });
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple.shade800,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                  ),
                  child: const Text(
                    "Passar a Vez",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void notifyChange(Carta carta) {
    setState(() {
      for (Jogador j in widget.partida.jogadores) {
        if (!j.jogadaTerminada) {
          j.pegarCarta(carta);
        }
        j.mostrarCartas();
      }
    });
  }
}
