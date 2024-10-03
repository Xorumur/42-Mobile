import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart'; // To evaluate the expression

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String expression = '';
  String result = '0';

  // List of calculator buttons
  final List<String> buttons = [
    '7', '8', '9', '/',
    '4', '5', '6', '*',
    '1', '2', '3', '-',
    'C', '0', '.', '+',
    'AC', '='
  ];

  // Button Pressed Logic
  void _onButtonPressed(String value) {
    setState(() {
      if (value == 'AC') {
        expression = '';
        result = '0';
      } else if (value == 'C') {
        if (expression.isNotEmpty) {
          expression = expression.substring(0, expression.length - 1);
        }
      } else if (value == '=') {
        try {
          Parser parser = Parser();
          Expression exp = parser.parse(expression);
          ContextModel cm = ContextModel();
          result = exp.evaluate(EvaluationType.REAL, cm).toString();
        } catch (e) {
          result = 'Error';
        }
      } else {
        // Append the value to the expression
        expression += value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenHeight = constraints.maxHeight;
          double screenWidth = constraints.maxWidth;

          double displayHeight = screenHeight * 0.4; // 30% for display
          double buttonHeight = screenHeight * 0.6;  // 70% for buttons
          double buttonWidth = screenWidth / 4;      // 4 buttons per row

          return Column(
            children: <Widget>[
              Container(
                height: displayHeight / 2, // Half for expression
                padding: const EdgeInsets.all(10),
                child: TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Expression',
                  ),
                  controller: TextEditingController(text: expression),
                  style: TextStyle(fontSize: 24),
                ),
              ),
              Container(
                height: displayHeight / 2, // Half for result
                padding: const EdgeInsets.all(10),
                child: TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Result',
                  ),
                  controller: TextEditingController(text: result),
                  style: TextStyle(fontSize: 24),
                ),
              ),
              SizedBox(
                height: buttonHeight,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: buttons.map((btnValue) {
                    return SizedBox(
                      width: buttonWidth,
                      height: buttonHeight / 5, 
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ElevatedButton(
                          onPressed: () => _onButtonPressed(btnValue),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                          child: Text(btnValue, style: const TextStyle(fontSize: 24)),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
