import "package:flutter/material.dart";
import "package:adv_quiz_app/Pages/HomePage.dart";

class PyQuest extends StatefulWidget {
  const PyQuest({super.key});

  State<PyQuest> createState() => _PyQuestState();
}

class _PyQuestState extends State<PyQuest> {
  List<Map> allQuestions = [
    {
      "Question":
          "Q1.Which of the following is used to iterate over a sequence in Python?",
      "options": ["if-else", "for", "foreach", "iterate"],
      "answerIndex": 1
    },
    {
      "Question": "Q2.What does the 'lambda' keyword signify in Python?",
      "options": [
        "a) Define a new function",
        "b) Define a class",
        "c) Define a generator",
        "d) Define an anonymous function"
      ],
      "answerIndex": 3
    },
    {
      "Question":
          "Q3.In Python, which of the following is used to define a function?",
      "options": ["a) def", "b) function", "c) define", "d) func"],
      "answerIndex": 0
    },
    {
      "Question":
          "Q4.Which of the following is not a valid data type in Python?",
      "options": ["a)list", "b)tuple", "c)array", "d) set"],
      "answerIndex": 2
    },
    {
      "Question":
          "Which function is used to read a line of input from the user in Python?",
      "options": [
        "a) input()",
        "b) read_input()",
        "c) get_input()",
        "d) read()"
      ],
      "answerIndex": 0
    },
  ];
  bool questionScreen = true;
  int noOfCorrectAnswer = 0;
  int questionIndex = 0;
  int selectedIndex = -1;

  MaterialStateProperty<Color?> checkAnswer(int buttonIndex) {
    if (selectedIndex != -1) {
      if (buttonIndex == allQuestions[questionIndex]["answerIndex"]) {
        return const MaterialStatePropertyAll(Colors.green);
      } else if (buttonIndex == selectedIndex) {
        return const MaterialStatePropertyAll(Colors.red);
      } else {
        return const MaterialStatePropertyAll(null);
      }
    } else {
      return const MaterialStatePropertyAll(null);
    }
  }

  void validatePage() {
    if (selectedIndex == -1) {
      return;
    }

    if (selectedIndex == allQuestions[questionIndex]["answerIndex"]) {
      noOfCorrectAnswer += 1;
    }
    if (selectedIndex != -1) {
      if (questionIndex == allQuestions.length - 1) {
        setState(() {
          questionScreen = false;
        });
      }
    }
    selectedIndex = -1;
    setState(() {
      questionIndex++;
    });
  }

  Scaffold CorrectAns() {
    if (noOfCorrectAnswer >= 3) {
      return Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.amber,
              automaticallyImplyLeading: false,
              title: const Text(
                "Quiz App",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
              ),
              centerTitle: true),
          body: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  Image.asset("lib/assets/images/high.jpg",
                      height: 400, width: 400),
                  const SizedBox(height: 20),
                  const Text(
                    "Completed!!",
                    style: TextStyle(fontSize: 25),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Score: $noOfCorrectAnswer/${allQuestions.length}",
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                      child:
                          const Text("Restart", style: TextStyle(fontSize: 25)))
                ]),
          ));
    } else {
      return Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.amber,
              automaticallyImplyLeading: false,
              title: const Text(
                "Quiz App",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
              ),
              centerTitle: true),
          body: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  Image.asset("lib/assets/images/low.jpg",
                      height: 400, width: 400),
                  const SizedBox(height: 20),
                  const Text(
                    "Completed!!",
                    style: TextStyle(fontSize: 25),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Score: $noOfCorrectAnswer/${allQuestions.length}",
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                      child:
                          const Text("Restart", style: TextStyle(fontSize: 25)))
                ]),
          ));
    }
  }

  Scaffold isQuestionScreen() {
    if (questionScreen == true) {
      return Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.amber,
              automaticallyImplyLeading: false,
              title: const Text(
                "Quiz App",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
              ),
              centerTitle: true),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              const Text("Python Questions",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Questions: ",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
                  Text(
                    "${questionIndex + 1}/${allQuestions.length}",
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.w500),
                  )
                ],
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  allQuestions[questionIndex]["Question"],
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  style: ButtonStyle(backgroundColor: checkAnswer(0)),
                  onPressed: () {
                    if (selectedIndex == -1) {
                      setState(() {
                        selectedIndex = 0;
                      });
                    }
                  },
                  child: Text(allQuestions[questionIndex]["options"][0],
                      style: const TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 30, 112, 207)))),
              const SizedBox(height: 20),
              ElevatedButton(
                  style: ButtonStyle(backgroundColor: checkAnswer(1)),
                  onPressed: () {
                    if (selectedIndex == -1) {
                      setState(() {
                        selectedIndex = 1;
                      });
                    }
                  },
                  child: Text(allQuestions[questionIndex]["options"][1],
                      style: const TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 30, 112, 207)))),
              const SizedBox(height: 20),
              ElevatedButton(
                  style: ButtonStyle(backgroundColor: checkAnswer(2)),
                  onPressed: () {
                    if (selectedIndex == -1) {
                      setState(() {
                        selectedIndex = 2;
                      });
                    }
                  },
                  child: Text(allQuestions[questionIndex]["options"][2],
                      style: const TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 30, 112, 207)))),
              const SizedBox(height: 20),
              ElevatedButton(
                  style: ButtonStyle(backgroundColor: checkAnswer(3)),
                  onPressed: () {
                    if (selectedIndex == -1) {
                      setState(() {
                        selectedIndex = 3;
                      });
                    }
                  },
                  child: Text(allQuestions[questionIndex]["options"][3],
                      style: const TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 30, 112, 207)))),
            ],
          ),
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                validatePage();
              },
              child: const Text("Next"),
              backgroundColor: Colors.blue));
    } else {
      return CorrectAns();
    }
  }

  Widget build(BuildContext context) {
    return isQuestionScreen();
  }
}
