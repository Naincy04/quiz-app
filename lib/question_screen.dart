import 'package:flutter/material.dart';

class QuestionScreen extends StatelessWidget {
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
          child: Text("Question"),
        ),
      ),
    );
  }
}
