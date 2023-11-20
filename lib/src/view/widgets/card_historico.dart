import 'package:blackjack/src/models/jogador.dart';
import 'package:flutter/material.dart';

class CardHistorico extends StatefulWidget {
  final String j1;
  final String j2;
  final int ptj1;
  final int ptj2;
  final String res;
  const CardHistorico({
    Key? key,
    required this.j1,
    required this.j2,
    required this.ptj1,
    required this.ptj2,
    required this.res,
  }) : super(key: key);

  @override
  State<CardHistorico> createState() => _CardHistoricoState();
}

class _CardHistoricoState extends State<CardHistorico> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.purple.shade700,
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              blurRadius: 2,
              spreadRadius: 2,
            ),
          ]),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.j1,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                Text(
                  widget.j2,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const Text(
              "Pontuação",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.greenAccent,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${widget.ptj1}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "${widget.ptj2}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Text(
              widget.res,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.greenAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
