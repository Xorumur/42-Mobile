import 'package:flutter/material.dart';

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
  String expression = '0';
  String result = '0';

  void _onButtonPressed(String value) {
    print('Button pressed: $value');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              readOnly: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Expression',
              ),
              controller: TextEditingController(text: expression),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              readOnly: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Result',
              ),
              controller: TextEditingController(text: result),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              padding: const EdgeInsets.all(10),
              children: <Widget>[
                _buildButton('7'),
                _buildButton('8'),
                _buildButton('9'),
                _buildButton('/'),
                _buildButton('4'),
                _buildButton('5'),
                _buildButton('6'),
                _buildButton('*'),
                _buildButton('1'),
                _buildButton('2'),
                _buildButton('3'),
                _buildButton('-'),
                _buildButton('C'),
                _buildButton('0'),
                _buildButton('.'),
                _buildButton('+'),
                _buildButton('AC'),
                _buildButton('='),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () => _onButtonPressed(value),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          padding: const EdgeInsets.all(20), 
        ),
        child: Text(value, style: const TextStyle(fontSize: 24)),
      ),
    );
  }
}
