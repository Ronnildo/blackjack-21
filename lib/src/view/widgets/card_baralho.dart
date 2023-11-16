import 'package:blackjack/src/models/carta.dart';

import 'package:flutter/material.dart';

class CardBaralho extends StatefulWidget {
  final Carta carta;
  const CardBaralho({
    Key? key,
    required this.carta,
  }) : super(key: key);

  @override
  State<CardBaralho> createState() => _CardBaralhoState();
}

class _CardBaralhoState extends State<CardBaralho> {
  bool valorCarta() {
    if (widget.carta.valor.name == "A" ||
        widget.carta.valor.name == "J" ||
        widget.carta.valor.name == "Q" ||
        widget.carta.valor.name == "K") {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 16,
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        width: 80,
        height: 110,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: valorCarta()
            ? Text(
                "${widget.carta.valor.name} ${widget.carta.naipe.name}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )
            : Text(
                "${widget.carta.numero} ${widget.carta.naipe.name}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }
}
