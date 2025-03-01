import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import '../models/history_model.dart';
import '../widgets/calculator_button.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String userInput = '';
  String result = '0';

  void onButtonPressed(String btnTxt) {
    setState(() {
      if (btnTxt == 'AC') {
        userInput = '';
        result = '0';
      } else if (btnTxt == '=') {
        try {
          Parser p = Parser();
          Expression exp = p.parse(userInput.replaceAll('x', '*'));
          ContextModel cm = ContextModel();
          double eval = exp.evaluate(EvaluationType.REAL, cm);
          result = eval.toString();
          HistoryModel.historyList.add('$userInput = $result');
        } catch (e) {
          result = 'Error';
        }
      } else if (btnTxt == '⌫') {
        if (userInput.isNotEmpty) {
          userInput = userInput.substring(0, userInput.length - 1);
        }
      } else {
        userInput += btnTxt;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 400, // Agar tombol tetap dalam ukuran wajar di layar besar
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(userInput, style: TextStyle(fontSize: 32)),
            Text(result, style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            Flexible(
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 4,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                padding: EdgeInsets.all(10),
                children: [
                  '7', '8', '9', '/',
                  '4', '5', '6', 'x',
                  '1', '2', '3', '-',
                  'AC', '0', '=', '+',
                  '⌫'
                ].map((text) => CalculatorButton(text, onButtonPressed)).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
