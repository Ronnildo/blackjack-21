import 'package:blackjack/src/models/jogador.dart';
import 'package:blackjack/src/models/partida.dart';

import 'package:blackjack/src/view/game.dart';
import 'package:blackjack/src/view/widgets/input_player.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _jogadorUmController =
      TextEditingController(text: "Pedro");
  final TextEditingController _jogadorDoisController =
      TextEditingController(text: "Lucas");

  iniciarPartida() {
    Partida p = Partida();
    Jogador playerOne = Jogador(_jogadorUmController.text);
    p.adiconarJogadores(playerOne);
    Jogador playerTwo = Jogador(_jogadorDoisController.text);
    p.adiconarJogadores(playerTwo);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: ((context) => GameScreen(
              partida: p,
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
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
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  child: Text(
                    "Bem-Vindo ao BlackJack",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple.shade800,
                    ),
                    softWrap: true,
                    textAlign: TextAlign.center,
                  ),
                ),
                const Text(
                  "Jogador 1",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.end,
                ),
                InputPlayer(
                  controller: _jogadorUmController,
                  text: "Jogador1",
                ),
                const Text(
                  "Jogador 2",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.start,
                ),
                InputPlayer(
                  controller: _jogadorDoisController,
                  text: "Jogador2",
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: iniciarPartida,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple.shade800,
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text("Start Game"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
