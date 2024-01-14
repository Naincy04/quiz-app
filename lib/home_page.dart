import 'package:flutter/material.dart';
import 'package:quiz_app/question_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 10, 93, 175)!,
              Color.fromARGB(255, 2, 39, 95)!,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/quiz-logo.png",
                height: 350,
                width: 250,
                color: const Color.fromARGB(150, 255, 255, 255),
              ),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                child: Text(
                  "Learn flutter in a fun way!",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color?>(Colors.blue[900]),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuestionScreen(),
                    ),
                  );
                },
                child: const Text("Start Quiz"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
