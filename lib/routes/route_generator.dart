import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/pages/error/error.dart';
import 'package:quiz_app/pages/home.dart';
import 'package:quiz_app/pages/quiz/multiple_choice.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final argument = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) =>
            HomePage(title: 'home',
            ),
        );
      case '/multiple-choice':
        if (argument is Object) {
          return MaterialPageRoute(builder: (_) =>
              MultipleChoice(data: argument,
              ),
          );
        }
        return _errorRoute('ERROR SERVER ISSUE');
      default:
        return _errorRoute('404 NOT FOUND');
    }
  }

  static Route<dynamic> _errorRoute(String message){
    return MaterialPageRoute(builder: (_) =>
        ErrorPage(message: message,
        ),
    );
  }
}