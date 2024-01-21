import 'package:flutter/material.dart';
import 'package:quiz_app/models/quiz_questions.dart';

List<QuizQuestion> question = [
  QuizQuestion(
    answers: [
      'Widgets',
      'Components',
      'Blocks',
      'Functions',
    ],
    question: 'What are the main building blocks of Flutter UIs?',
  ),
  QuizQuestion(
    question: 'How are Flutter UIs built?',
    answers: [
      'By combining widgets in code',
      'By combining widgets in a visual editor',
      'By defining widgets in config files',
      'By using XCode for iOS and Android Studio for Android',
    ],
  ),
  QuizQuestion(
    question: 'What\'s the purpose of a StatefulWidget?',
    answers: [
      'Update UI as data changes',
      'Update data as UI changes',
      'Ignore data changes',
      'Render UI that does not depend on data',
    ],
  ),
  QuizQuestion(
    question:
        'Which widget should you try to use more often: StatelessWidget or StatefulWidget?',
    answers: [
      'StatelessWidget',
      'StatefulWidget',
      'Both are equally good',
      'None of the above',
    ],
  ),
  QuizQuestion(
    question: 'What happens if you change data in a StatelessWidget?',
    answers: [
      'The UI is not updated',
      'The UI is updated',
      'The closest StatefulWidget is updated',
      'Any nested StatefulWidgets are updated',
    ],
  ),
  QuizQuestion(
    question: 'How should you update data inside of StatefulWidgets?',
    answers: [
      'By calling setState()',
      'By calling updateData()',
      'By calling updateUI()',
      'By calling updateState()',
    ],
  ),
];

class ResultScreen extends StatelessWidget {
  ResultScreen(
      {Key? key, required this.choosenAnswer, required this.questionLength})
      : super(key: key);

  final List<String> choosenAnswer;
  final int questionLength;

  int calculateScore() {
    int score = 0;

    // Ensure that choosenAnswer and question have the same length
    if (choosenAnswer.length == question.length) {
      for (int i = 0; i < choosenAnswer.length; i++) {
        // Check if the selected answer is correct
        if (choosenAnswer[i] == question[i].answers[0]) {
          score++;
        }
      }
    } else {
      print("Error: Lists have different lengths");
    }

    return score;
  }

  @override
  Widget build(BuildContext context) {
    int score = calculateScore();

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Quiz Result",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Your Score: $score/${question.length}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              // const SizedBox(height: 20),
              // const Text(
              //   "Selected Answers:",
              //   style: TextStyle(
              //     fontSize: 18,
              //     fontWeight: FontWeight.w600,
              //     color: Colors.white,
              //   ),
              // ),
              const SizedBox(height: 10),
              // Display selected answers
              DataTable(
                columns: const [
                  DataColumn(
                      label: Text(
                    'Question',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  )),
                  DataColumn(
                      label: Text(
                    'Selected Answer',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  )),
                ],
                rows: List.generate(
                  choosenAnswer.length,
                  (index) => DataRow(
                    cells: [
                      DataCell(Text(
                        "Question ${index + 1}",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      )),
                      DataCell(Text(
                        choosenAnswer[index],
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
