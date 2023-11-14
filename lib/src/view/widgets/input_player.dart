import 'package:flutter/material.dart';

class InputPlayer extends StatefulWidget {
  TextEditingController controller;
  String text;
  InputPlayer({Key? key, required this.controller, required this.text})
      : super(key: key);

  @override
  State<InputPlayer> createState() => _InputPlayerState();
}

class _InputPlayerState extends State<InputPlayer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
        bottom: 16,
      ),
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          hintStyle: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 2,
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 2,
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          label: const Text("Digite seu nome"),
          labelStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          fillColor: Colors.white,
          hintText: widget.text,
        ),
      ),
    );
  }
}
