import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/qstns.dart';
import 'package:quiz_app/models/quiz_questions.dart'; // Make sure to import the correct file

class QuestionScreen extends StatefulWidget {
  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void answerQuestionIndex() {
    setState(() {
      currentQuestionIndex = currentQuestionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Replace with the actual function to get questions

    if (currentQuestionIndex >= question.length) {
      // Handle the case when there are no more questions
      return const Scaffold(
        body: Center(
          child: Text(
            'Quiz completed!',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
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
                  (items) {
                    return AnswerButton(
                      answerText: items,
                      onPressed: answerQuestionIndex,
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
