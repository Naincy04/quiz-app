import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';

import 'package:quiz_app/result_screen.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;
  List<String> selectedAnswer = [];

  void answerQuestionIndex(String answer) {
    setState(() {
      selectedAnswer.add(answer);
      print(selectedAnswer);
      currentQuestionIndex = currentQuestionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (currentQuestionIndex >= question.length) {
      // If all questions are answered, navigate to the result screen
      return ResultScreen(
          choosenAnswer: selectedAnswer, questionLength: question.length);
    }

    final currentQuestion = question[currentQuestionIndex];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 10, 93, 175),
              Color.fromARGB(255, 2, 39, 95),
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  child: Text(
                    currentQuestion.question,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                ...currentQuestion.getshuffledAnswers().map(
                  (item) {
                    return AnswerButton(
                      answerText: item,
                      onPressed: () => answerQuestionIndex(item),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
