import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String input = "";
  String result = "0";
  String operator = "";
  double firstOperand = 0;

  void handleButtonPress(String value) {
    setState(() {
      if (value == "C") {
        input = "";
        result = "0";
        operator = "";
        firstOperand = 0;
      } else if (value == "+" || value == "-" || value == "×" || value == "÷" || value == "%" || value == "()") {
        operator = value;
        firstOperand = double.tryParse(input) ?? 0;
        input = "";
      } else if (value == "=") {
        double secondOperand = double.tryParse(input) ?? 0;
        switch (operator) {
          case "+":
            result = (firstOperand + secondOperand).toString();
            break;
          case "-":
            result = (firstOperand - secondOperand).toString();
            break;
          case "×":
            result = (firstOperand * secondOperand).toString();
            break;
          case "÷":
            result = secondOperand != 0
                ? (firstOperand / secondOperand).toString()
                : "Error";
            break;
            case "%":
            result = (firstOperand /secondOperand * 100).toString();
            break;
          default:
            result = "0";
        }
        input = result;
        operator = "";
      } else {
        input += value;
        result = input;
      }
    });
  }

  Widget buildButton(String label, Color color) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            padding:const EdgeInsets.all(20),
          ),
          onPressed: () => handleButtonPress(label),
          child: Text(
            label,
            style:const TextStyle(fontSize: 24, fontWeight: FontWeight.bold,
            color:  Color.fromARGB(255, 239, 237, 237)),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 243, 243),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:const Text("CALCULATOR",style:  TextStyle(color: Colors.white),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              padding:const EdgeInsets.all(20),
              child: Text(
                result,
                style:const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Row(
            children: [
              buildButton("7", const Color.fromARGB(255, 6, 6, 6)),
              buildButton("8", const Color.fromARGB(255, 22, 22, 22)),
              buildButton("9", const Color.fromARGB(255, 19, 18, 18)),
              buildButton("÷", Colors.orange),
            ],
          ),
          Row(
            children: [
              buildButton("4", const Color.fromARGB(255, 12, 12, 12)),
              buildButton("5", const Color.fromARGB(255, 9, 9, 9)),
              buildButton("6", const Color.fromARGB(255, 21, 21, 21)),
              buildButton("×", Colors.orange),
            ],
          ),
          Row(
            children: [
              buildButton("1", const Color.fromARGB(255, 8, 8, 8)),
              buildButton("2", const Color.fromARGB(255, 15, 14, 14)),
              buildButton("3", const Color.fromARGB(255, 11, 11, 11)),
              buildButton("-", Colors.orange),
            ],
          ),
          Row(
            children: [
              buildButton(".", const Color.fromARGB(255, 45, 44, 44)),
              buildButton("0", const Color.fromARGB(255, 9, 9, 9)),
              buildButton("=", const Color.fromARGB(255, 36, 36, 36)),
              buildButton("+", Colors.orange),
            ],
          ),
          Row(
            children: [
              buildButton("C", const Color.fromARGB(255, 239, 75, 75)),
              buildButton("%", const Color.fromARGB(255, 29, 28, 28)),
              buildButton("(", const Color.fromARGB(255, 17, 17, 17)),
              buildButton(")", Colors.orange),
            ],
          ),
        ],
      ),
    );
  }
}
