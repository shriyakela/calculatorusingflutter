import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primaryColor:
            Color.fromARGB(255, 234, 140, 170), // Light Pink Background
        appBarTheme: AppBarTheme(
          // Hot Pink App Bar
          backgroundColor: Colors.pink,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 238, 134, 190), // Button Color
            onPrimary: Colors.white, // Text Color
            shape: CircleBorder(), // Circular Buttons
            minimumSize: Size(80, 80), // Bigger Buttons
          ),
        ),
      ),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = '';
  double _num1 = 0;
  double _num2 = 0;
  String _operand = '';

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        _output = '';
        _num1 = 0;
        _num2 = 0;
        _operand = '';
      } else if (buttonText == '+' ||
          buttonText == '-' ||
          buttonText == '*' ||
          buttonText == '/') {
        _num1 = double.parse(_output);
        _operand = buttonText;
        _output = '';
      } else if (buttonText == '=') {
        _num2 = double.parse(_output);
        if (_operand == '+') {
          _output = (_num1 + _num2).toString();
        }
        if (_operand == '-') {
          _output = (_num1 - _num2).toString();
        }
        if (_operand == '*') {
          _output = (_num1 * _num2).toString();
        }
        if (_operand == '/') {
          _output = (_num1 / _num2).toString();
        }
        _num1 = 0;
        _num2 = 0;
        _operand = '';
      } else {
        _output += buttonText;
      }
    });
  }

  Widget _buildButton(
    String buttonText,
  ) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            _buttonPressed(buttonText);
          },
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 24.0),
          ),
        ),
      ),
    );
  }

  Widget _buildButtonRow(List<String> buttons) {
    return Row(
      children: buttons.map((button) => _buildButton(button)).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.all(16.0),
            child: Text(
              _output,
              style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(height: 0.0),
          Column(
            children: [
              _buildButtonRow(['7', '8', '9', '/']),
              _buildButtonRow(['4', '5', '6', '*']),
              _buildButtonRow(['1', '2', '3', '-']),
              _buildButtonRow(['C', '0', '=', '+']),
            ],
          ),
        ],
      ),
    );
  }
}
