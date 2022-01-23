import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quiz_app/dto/quiz.dart';

class QuizFetchService {
  getQuiz(Object payload) async {
    var response = await http.post(Uri.parse('http://10.0.2.2:8080/get-quiz'));
    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      List<Quiz> quizes = [];
      jsonList.forEach((element) {
        quizes.add(Quiz.fromJson(element));
      });
      return quizes;
    } else {
      throw Exception('Failed to Get Quiz');
    }
  }
}
