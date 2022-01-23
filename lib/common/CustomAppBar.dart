import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({Key? key, required String title, required BuildContext context, required bool isBackPossible})
      : super(
    key: key,
    title: Text(title),
    backgroundColor: Colors.deepPurple,
     leading :
       IconButton(
          icon: isBackPossible? Icon(Icons.arrow_back) : Icon(Icons.graphic_eq_rounded),
          onPressed: () {
            isBackPossible? Navigator.of(context).pop(context) : null;
          },
        )
  );
}
