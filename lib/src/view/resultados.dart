import 'package:blackjack/src/models/historico.dart';
import 'package:blackjack/src/models/partida.dart';
import 'package:blackjack/src/view/widgets/card_historico.dart';
import 'package:flutter/material.dart';

class Resultados extends StatefulWidget {
  final Historico historico;
  const Resultados({
    Key? key,
    required this.historico,
  }) : super(key: key);

  @override
  State<Resultados> createState() => _ResultadosState();
}

class _ResultadosState extends State<Resultados> {
  Map<String, dynamic> data = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Histórico',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.purple.shade800,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // const Text("Histórico"),
            // Text(
            //   "${widget.historico.historico["Partida"]}",
            //   style: const TextStyle(
            //     fontSize: 30,
            //     color: Colors.red,
            //   ),
            // ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => const Divider(
                  color: Colors.red,
                ),
                itemCount: widget.historico.resultados.length,
                itemBuilder: (context, index) {
                  return CardHistorico(
                      j1: widget.historico.resultados[index]["jogador1"],
                      j2: widget.historico.resultados[index]["jogador2"],
                      ptj1: widget.historico.resultados[index]["ptj1"],
                      ptj2: widget.historico.resultados[index]["ptj2"],
                      res: widget.historico.resultados[index]["Resultado"]);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            widget.historico.resultados;
          });
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
