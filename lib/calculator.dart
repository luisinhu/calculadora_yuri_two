import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'memory.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final _memory = Memory();
  //cabeçalho da calculadora
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Calculator'),
      ),
      body: Column(
        children: <Widget>[
          _buildDisplay(),
          const Divider(height: 0.1),
          _buildKeyboard(),
        ],
      ),
    );
  }
 //display da parte dos numeros
  Widget _buildDisplay() {
    return Expanded(
      flex: 1,
      child: Container(
        color: const Color.fromARGB(255, 0, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AutoSizeText(
                _memory.result,
                minFontSize: 30.0,
                maxFontSize: 80.0,
                maxLines: 1,
                textAlign: TextAlign.end,
                style: const TextStyle(
                  fontWeight: FontWeight.w200,
                  decoration: TextDecoration.none,
                  fontSize: 80.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKeyboardButton(String label,
      {int flex = 1, Color textColor = Colors.white, Color backgroundColor = const Color.fromARGB(138, 48, 48, 48)}) {
    return Expanded(
      flex: flex,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: textColor, 
          backgroundColor: backgroundColor,
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(10),
          minimumSize: const Size(20, 20),
          
        ),
        child: Text(
          label,
          style: const TextStyle(fontSize: 20),
        ),
        onPressed: () {
          setState(() {
            _memory.applyCommand(label);
          });
        },
      ),
    );
}


  Widget _buildKeyboard() {
    return Container(
      color: Colors.black,
      height: 380.0,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildKeyboardButton('AC', backgroundColor: const Color.fromARGB(255, 255, 17, 0)),
                _buildKeyboardButton('DEL', backgroundColor: const Color.fromARGB(255, 255, 17, 0)),
                _buildKeyboardButton('%', backgroundColor: const Color.fromARGB(255, 255, 17, 0)),
                _buildKeyboardButton('÷', backgroundColor: const Color.fromARGB(255, 255, 17, 0)),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildKeyboardButton('7'),
                _buildKeyboardButton('8'),
                _buildKeyboardButton('9'),
                _buildKeyboardButton('x', backgroundColor: const Color.fromARGB(255, 255, 17, 0)),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildKeyboardButton('4'),
                _buildKeyboardButton('5'),
                _buildKeyboardButton('6'),
                _buildKeyboardButton('+', backgroundColor: const Color.fromARGB(255, 255, 17, 0)),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildKeyboardButton('1'),
                _buildKeyboardButton('2'),
                _buildKeyboardButton('3'),
                _buildKeyboardButton('-',backgroundColor: const Color.fromARGB(255, 255, 17, 0)),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildKeyboardButton('0', flex: 2),
                _buildKeyboardButton('.'),
                _buildKeyboardButton('=', backgroundColor: const Color.fromARGB(255, 255, 17, 0)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}