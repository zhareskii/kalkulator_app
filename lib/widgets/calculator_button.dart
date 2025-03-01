import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final Function(String) onPressed;

  CalculatorButton(this.text, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1, // Agar tombol tetap berbentuk kotak
      child: ElevatedButton(
        onPressed: () => onPressed(text),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(10),
          textStyle: TextStyle(fontSize: 20),
        ),
        child: Text(text),
      ),
    );
  }
}
