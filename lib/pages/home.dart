import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/common/CustomAppBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  Color titleColor = Colors.deepPurple;
  Color bodyColor = Colors.deepPurpleAccent;
  Color highlightColor = Colors.purple;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Home',
        context: context,
        isBackPossible: false,
      ),
      backgroundColor: bodyColor,
      body: Center(
          child: RawMaterialButton(
        onPressed: () {
          Navigator.of(context)
              .pushNamed('/multiple-choice', arguments: {"genre": "abc"});
        },
        shape: StadiumBorder(),
        fillColor: Colors.deepPurple,
        padding: EdgeInsets.all(25.0),
        elevation: 0.0,
        child: Text(
          'Goto Quiz',
          style: TextStyle(color: Colors.white),
        ),
      )),
    );
  }
}
