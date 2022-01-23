import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/common/CustomAppBar.dart';
import 'package:quiz_app/dto/quiz.dart';
import 'package:quiz_app/services/quiz_fetch_service.dart';

class MultipleChoice extends StatefulWidget {
  final Object data;

  const MultipleChoice({Key? key, required this.data}) : super(key: key);

  @override
  State<MultipleChoice> createState() => _MultipleChoice();
}

class _MultipleChoice extends State<MultipleChoice> {
  Color titleColor = Colors.deepPurple;
  Color bodyColor = Colors.white;
  Color highlightColor = Colors.purple;
  List<Quiz> quiz = [];
  int index = 0;
  int question_pos = 0;
  int score = 0;
  bool btnPressed = false;
  PageController? _controller;
  String btnText = "Next Question";
  bool answered = false;

  @override
  void initState() {
    super.initState();
    Object payload = widget.data;
    QuizFetchService quizService = QuizFetchService();
    quizService.getQuiz(payload).then((data) {
      setState(() {
        _controller = PageController(initialPage: 0);
        quiz = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return quiz.length > 0
        ? Scaffold(
            appBar: CustomAppBar(
              title: "Quiz",
              context: context,
              isBackPossible: true,
            ),
            backgroundColor: bodyColor,
            body: Padding(
              padding: const EdgeInsets.all(18.0),
              child: PageView.builder(
                  controller: _controller,
                  onPageChanged: (page) {
                    if (page == quiz.length - 1) {
                      setState(() {
                        btnText = "See Results";
                      });
                    }
                    setState(() {
                      answered = false;
                    });
                  },
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: quiz.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            "Question ${index + 1}/${quiz.length}",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 28.0,
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 1.5,
                          color: Colors.deepPurple,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 200.0,
                          child: Text(
                            "${quiz[index].question}",
                            style: TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 22.0,
                            ),
                          ),
                        ),
                        for (int i = 0; i < quiz[index].choices.length; i++)
                          Container(
                            width: double.infinity,
                            height: 50.0,
                            margin: EdgeInsets.only(
                                bottom: 20.0, left: 12.0, right: 12.0),
                            child: RawMaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                // side: BorderSide(width: 1.0, color: Colors.purple),
                              ),
                              fillColor: btnPressed
                                  ? quiz[index].choices.values.toList()[i]
                                      ? Colors.green
                                      : Colors.red
                                  : Colors.deepPurple,
                              onPressed: !answered
                                  ? () {
                                      // Option Selected
                                      quiz[index].choices.values.toList()[i]
                                          ? score++
                                          : score;
                                      setState(() {
                                        btnPressed = true;
                                        answered = true;
                                      });
                                    }
                                  : null,
                              child: Text(quiz[index].choices.keys.toList()[i],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                  )),
                            ),
                          ),
                        SizedBox(
                          height: 40.0,
                        ),
                        RawMaterialButton(
                          onPressed: () {
                            if (_controller!.page?.toInt() == quiz.length - 1) {
                              // AlertDialog(title: Text("Total Score : ${score}") );
                              Navigator.pop(context);
                            } else {
                              _controller!.nextPage(
                                  duration: Duration(milliseconds: 250),
                                  curve: Curves.easeInExpo);
                              setState(() {
                                btnPressed = false;
                              });
                            }
                          },
                          shape: StadiumBorder(),
                          fillColor: Colors.deepPurple,
                          padding: EdgeInsets.all(18.0),
                          elevation: 0.0,
                          child: Text(
                            btnText,
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    );
                  }),
            ))
        : Center(
            child: CircularProgressIndicator(),
          );
  }
}
