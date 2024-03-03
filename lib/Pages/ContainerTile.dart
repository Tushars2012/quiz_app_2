import "package:flutter/material.dart";

class QuizLang extends StatelessWidget {
  final String title;
  final Function()? onPressed;

  const QuizLang({
    super.key,
    required this.title,
    required this.onPressed
  });

  Widget build(BuildContext context) {
    return Container(
        height: 100,
        width: 350,
        decoration:BoxDecoration(
          color:Colors.blue,
          borderRadius:BorderRadius.circular(10)
        ),
        child: Center(
            child: TextButton(
                onPressed: onPressed,
                child: Text(title,
                    style: TextStyle(fontSize: 25, color: Colors.amber)))));
  }
}
