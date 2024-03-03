import "package:flutter/material.dart";
import "ContainerTile.dart";
import "Questions/JavaQuest.dart";
import "Questions/PyQuest.dart";
import "Questions/FlutterQuest.dart";
import "Questions/CQuest.dart";
import "Questions/DsaQuest.dart";
import "Questions/JSQuest.dart";

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.amber,
            automaticallyImplyLeading: false,
            title: const Text(
              "Quiz App",
              style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w700),
            ),
            centerTitle: true),
        body: Center(
          child: ListView(children: [
            Column(
              children: [
                const SizedBox(height: 25),
                Text("Choose a Language",
                    style: TextStyle(color: Colors.blue[700], fontSize: 30)),
                const SizedBox(height: 25),
                QuizLang(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => JavaQuest()));
                    },
                    title: "Java"),
                const SizedBox(height: 25),
                QuizLang(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => PyQuest()));
                    },
                    title: "Python"),
                const SizedBox(height: 25),
                QuizLang(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FlutterQuest()));
                    },
                    title: "Flutter"),
                const SizedBox(height: 25),
                QuizLang(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => CQuest()));
                    },
                    title: "C++"),
                const SizedBox(height: 25),
                QuizLang(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => JSQuest()));
                    },
                    title: "JavaScript"),
                const SizedBox(height: 25),
                QuizLang(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => DSAQuest()));
                    },
                    title: "DSA"),
              ],
            ),
          ]),
        ));
  }
}
