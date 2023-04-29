import 'dart:math';

import 'package:flutter/material.dart';

import '../model/number_generator.dart';

class NumberChecker extends StatefulWidget {
  const NumberChecker({super.key});

  @override
  State<NumberChecker> createState() => _NumberCheckerState();
}

class _NumberCheckerState extends State<NumberChecker> {
  int num1 = Random().nextInt(101);
  int num2 = Random().nextInt(101);

  int correctAnswer = 0;
  int incorrectAnswer = 0;
  int attempts = 0;

  void generateNumber() {
    var model = NumberGeneratorModel();
    setState(() {
      var randomNum = model.generateRandom();
      num1 = randomNum[0];
      num2 = randomNum[1];
    });
  }

  void checkAnswer(int num1, int num2) {
    if (++attempts > 10) {
      restartGame();
    } else {
      if (num1 > num2) {
        correctAnswer++;
      } else if (num1 < num2) {
        incorrectAnswer++;
      }
      generateNumber();
    }
  }

  void restartGame() {
    correctAnswer = 0;
    incorrectAnswer = 0;
    attempts = 0;

    generateNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Number Generator game"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    checkAnswer(num1, num2);
                  },
                  child: Text('$num1'),
                ),
                ElevatedButton(
                  onPressed: () {
                    checkAnswer(num2, num1);
                  },
                  child: Text('$num2'),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            RichText(
              text: const TextSpan(
                text: 'Result:',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            RichText(
              text: TextSpan(
                text: 'Attempts: $attempts',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            RichText(
              text: TextSpan(
                text: 'Correct Answer: $correctAnswer',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            RichText(
              text: TextSpan(
                text: 'Incorrect Answer: $incorrectAnswer',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                restartGame();
              },
              child: const Text('Restart Game'),
            ),
          ],
        ),
      ),
    );
  }
}
