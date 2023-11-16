import 'package:flutter/material.dart';

class JogadorWidget extends StatefulWidget {
  final String name;
  const JogadorWidget({Key? key, required this.name}) : super(key: key);

  @override
  State<JogadorWidget> createState() => _JogadorWidgetState();
}

class _JogadorWidgetState extends State<JogadorWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.name,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
