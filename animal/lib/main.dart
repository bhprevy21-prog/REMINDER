import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const GuessingGameApp());
}

class GuessingGameApp extends StatelessWidget {
  const GuessingGameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const GamePage(),
    );
  }
}

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _ThemeColors {
  static const primary = Colors.blue;
}

class _GamePageState extends State<GamePage> {
  final TextEditingController _controller = TextEditingController();
  late int _targetNumber;
  String _message = 'Guess a number between 1 and 100!';
  int _attempts = 0;
  bool _hasWon = false;

  @override
  void initState() {
    super.initState();
    _startNewGame();
  }

  void _startNewGame() {
    setState(() {
      _targetNumber = Random().nextInt(100) + 1;
      _message = 'Guess a number between 1 and 100!';
      _attempts = 0;
      _hasWon = false;
      _controller.clear();
    });
  }

  void _checkGuess() {
    final int? guess = int.tryParse(_controller.value.text);
    if (guess == null) {
      setState(() => _message = 'Please enter a valid number.');
      return;
    }

    setState(() {
      _attempts++;
      if (guess == _targetNumber) {
        _message = '🎉 Correct! You guessed it in $_attempts attempts.';
        _hasWon = true;
      } else if (guess < _targetNumber) {
        _message = 'Too low! Try again.';
      } else {
        _message = 'Too high! Try again.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Simple Guessing Game')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_message, style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            if (!_hasWon) ...[
              TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your guess',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _checkGuess,
                child: const Text('Submit Guess'),
              ),
            ] else
              ElevatedButton(
                onPressed: _startNewGame,
                style: ElevatedButton.styleFrom(backgroundColor: _ThemeColors.primary),
                child: const Text('Play Again', style: TextStyle(color: Colors.white)),
              ),
          ],
        ),
      ),
    );
  }
}
