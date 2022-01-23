import 'package:flutter/material.dart';
import 'package:quiz_app/routes/route_generator.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
        title: 'Quiz App',
        theme: ThemeData(
          primaryColor: Colors.purple,
          secondaryHeaderColor: Colors.deepPurple,
        ),
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}