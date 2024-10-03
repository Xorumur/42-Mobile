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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Initial text to be displayed
  String displayText = 'Press the button below';
  bool isHelloWorld = false;

  void _toggleText() {
    setState(() {
      // Toggle between the two texts
      if (isHelloWorld) {
        displayText = 'Press the button below';
      } else {
        displayText = 'Hello World!';
      }
      isHelloWorld = !isHelloWorld; // Switch the state
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(displayText), // The text that changes
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleText, // Calls the function to toggle the text
              child: const Text('Press me'),
            ),
          ],
        ),
      ),
    );
  }
}
