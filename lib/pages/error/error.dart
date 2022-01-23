import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatefulWidget {
  final String message;
  const ErrorPage({Key? key, required this.message}) : super(key: key);
  @override
  State<ErrorPage> createState() => _ErrorPage();
}

class _ErrorPage extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Error'),
        backgroundColor: Colors.purple,
        leading: IconButton(icon: Icon(Icons.menu),onPressed: () {
        },),
      ),
      body: Center(
        child: Text(
          widget.message
        ),
      ),
    );
  }


}