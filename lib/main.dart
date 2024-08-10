import 'package:flutter/material.dart';

void main() => runApp(CalculatorApp());

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home: CalculatorHomePage(),
    );
  }
}

class CalculatorHomePage extends StatefulWidget {
  @override
  _CalculatorHomePageState createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  String _output = "0";
  String _expression = "";
  String _operator = "";
  double _num1 = 0;
  double _num2 = 0;
void _buttonPressed(String buttonText) {
  if (buttonText == "C") {
    _output = "0";
    _expression = "";
    _num1 = 0;
    _num2 = 0;
    _operator = "";
  } else if (buttonText == "⌫") {
    _output = _output.length > 1 ? _output.substring(0, _output.length - 1) : "0";
    _expression = _expression.length > 1 ? _expression.substring(0, _expression.length - 1) : "";
  } else if (buttonText == "+" || buttonText == "-" || buttonText == "x" || buttonText == "÷") {
    _num1 = double.parse(_output);
    _operator = buttonText;
    _expression = "$_output $buttonText ";
    _output = "";
  } else if (buttonText == "=") {
    _num2 = double.parse(_output);

    switch (_operator) {
      case "+":
        _output = (_num1 + _num2).toString();
        break;
      case "-":
        _output = (_num1 - _num2).toString();
        break;
      case "x":
        _output = (_num1 * _num2).toString();
        break;
      case "÷":
        _output = (_num1 / _num2).toString();
        break;
      default:
        _output = "0";
        break;
    }


_expression = "$_num1 $_operator $_num2 = $_output";
_num1 = 0;
_num2 = 0;
_operator = "";
  } else {
    if (_output == "0") {
      _output = buttonText;
    } else {
      _output += buttonText;
    }
    _expression += buttonText;
  }

  setState(() {});
}

  Widget _buildButton(String buttonText, {Color color = Colors.black26}) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(2.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(24.0),
            backgroundColor: color,
          ),
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          onPressed: () => _buttonPressed(buttonText),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
            child: Text(
              _expression,
              style: TextStyle(fontSize: 24.0, color: Colors.grey),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
            child: Text(
              _output,
              style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  _buildButton("%"),
                  _buildButton("CE"),
                  _buildButton("C"),
                  _buildButton("⌫"),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton("1/x"),
                  _buildButton("x²"),
                  _buildButton("²√x"),
                  _buildButton("÷", color: Color.fromARGB(46, 158, 158, 158)),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton("7"),
                  _buildButton("8"),
                  _buildButton("9"),
                  _buildButton("x", color: Color.fromARGB(46, 158, 158, 158)),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton("4"),
                  _buildButton("5"),
                  _buildButton("6"),
                  _buildButton("-", color: Color.fromARGB(46, 158, 158, 158)),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton("1"),
                  _buildButton("2"),
                  _buildButton("3"),
                  _buildButton("+", color: Color.fromARGB(46, 158, 158, 158)),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton("+/-"),
                  _buildButton("0"),
                  _buildButton("."),
                  _buildButton("=", color: Color.fromARGB(255, 204, 122, 234)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
