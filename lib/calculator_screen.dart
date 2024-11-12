import 'package:flutter/material.dart';
import 'calculator_button.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = "0";
  String _currentNumber = "";
  String? _operation;
  double? _firstNumber;
  bool _isNewNumber = true;

  void _onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        _output = "0";
        _currentNumber = "";
        _operation = null;
        _firstNumber = null;
        _isNewNumber = true;
      } else if (buttonText == "+/-") {
        if (_output.startsWith("-")) {
          _output = _output.substring(1);
        } else {
          _output = "-$_output";
        }
        _currentNumber = _output;
      } else if (buttonText == "%") {
        double number = double.parse(_output);
        _output = (number / 100).toString();
        _currentNumber = _output;
      } else if (["+", "-", "×", "÷"].contains(buttonText)) {
        _firstNumber = double.parse(_output);
        _operation = buttonText;
        _isNewNumber = true;
      } else if (buttonText == "=") {
        if (_operation != null && _firstNumber != null) {
          double secondNumber = double.parse(_output);
          switch (_operation) {
            case "+":
              _output = (_firstNumber! + secondNumber).toString();
              break;
            case "-":
              _output = (_firstNumber! - secondNumber).toString();
              break;
            case "×":
              _output = (_firstNumber! * secondNumber).toString();
              break;
            case "÷":
              _output = (_firstNumber! / secondNumber).toString();
              break;
          }
          _currentNumber = _output;
          _operation = null;
          _isNewNumber = true;
        }
      } else if (buttonText == ".") {
        if (!_output.contains(".")) {
          _output = _output + buttonText;
          _currentNumber = _output;
        }
      } else {
        if (_isNewNumber) {
          _output = buttonText;
          _isNewNumber = false;
        } else {
          _output = _output + buttonText;
        }
        _currentNumber = _output;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(24),
              alignment: Alignment.bottomRight,
              child: Text(
                _output,
                style: const TextStyle(
                  fontSize: 72,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                Row(
                  children: [
                    CalculatorButton(
                      text: "C",
                      textColor: Colors.black,
                      backgroundColor: Colors.grey[350]!,
                      onPressed: () => _onButtonPressed("C"),
                    ),
                    CalculatorButton(
                      text: "+/-",
                      textColor: Colors.black,
                      backgroundColor: Colors.grey[350]!,
                      onPressed: () => _onButtonPressed("+/-"),
                    ),
                    CalculatorButton(
                      text: "%",
                      textColor: Colors.black,
                      backgroundColor: Colors.grey[350]!,
                      onPressed: () => _onButtonPressed("%"),
                    ),
                    CalculatorButton(
                      text: "÷",
                      backgroundColor: Colors.orange,
                      onPressed: () => _onButtonPressed("÷"),
                    ),
                  ],
                ),
                Row(
                  children: [
                    CalculatorButton(
                      text: "7",
                      backgroundColor: Colors.grey[850]!,
                      onPressed: () => _onButtonPressed("7"),
                    ),
                    CalculatorButton(
                      text: "8",
                      backgroundColor: Colors.grey[850]!,
                      onPressed: () => _onButtonPressed("8"),
                    ),
                    CalculatorButton(
                      text: "9",
                      backgroundColor: Colors.grey[850]!,
                      onPressed: () => _onButtonPressed("9"),
                    ),
                    CalculatorButton(
                      text: "×",
                      backgroundColor: Colors.orange,
                      onPressed: () => _onButtonPressed("×"),
                    ),
                  ],
                ),
                Row(
                  children: [
                    CalculatorButton(
                      text: "4",
                      backgroundColor: Colors.grey[850]!,
                      onPressed: () => _onButtonPressed("4"),
                    ),
                    CalculatorButton(
                      text: "5",
                      backgroundColor: Colors.grey[850]!,
                      onPressed: () => _onButtonPressed("5"),
                    ),
                    CalculatorButton(
                      text: "6",
                      backgroundColor: Colors.grey[850]!,
                      onPressed: () => _onButtonPressed("6"),
                    ),
                    CalculatorButton(
                      text: "-",
                      backgroundColor: Colors.orange,
                      onPressed: () => _onButtonPressed("-"),
                    ),
                  ],
                ),
                Row(
                  children: [
                    CalculatorButton(
                      text: "1",
                      backgroundColor: Colors.grey[850]!,
                      onPressed: () => _onButtonPressed("1"),
                    ),
                    CalculatorButton(
                      text: "2",
                      backgroundColor: Colors.grey[850]!,
                      onPressed: () => _onButtonPressed("2"),
                    ),
                    CalculatorButton(
                      text: "3",
                      backgroundColor: Colors.grey[850]!,
                      onPressed: () => _onButtonPressed("3"),
                    ),
                    CalculatorButton(
                      text: "+",
                      backgroundColor: Colors.orange,
                      onPressed: () => _onButtonPressed("+"),
                    ),
                  ],
                ),
                Row(
                  children: [
                    CalculatorButton(
                      text: "0",
                      backgroundColor: Colors.grey[850]!,
                      flex: 2,
                      onPressed: () => _onButtonPressed("0"),
                    ),
                    CalculatorButton(
                      text: ".",
                      backgroundColor: Colors.grey[850]!,
                      onPressed: () => _onButtonPressed("."),
                    ),
                    CalculatorButton(
                      text: "=",
                      backgroundColor: Colors.orange,
                      onPressed: () => _onButtonPressed("="),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
