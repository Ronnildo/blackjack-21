import 'package:blackjack/src/view/home.dart';
import "package:flutter/material.dart";

void main(List<String> args) {
  runApp(BlackJack());
}

class BlackJack extends StatelessWidget {
  const BlackJack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BlackJack",
      home: Home(),
    );
  }
}
