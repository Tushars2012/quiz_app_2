import "package:flutter/material.dart";
import "package:adv_quiz_app/Pages/HomePage.dart";

class DSAQuest extends StatefulWidget {
  const DSAQuest({super.key});
  @override
  State<DSAQuest> createState() => _DSAQuestState();
}

class _DSAQuestState extends State<DSAQuest> {
  List<Map> allQuestions = [
    {
      "Question":
          "Q1.What does FIFO stand for in the context of data structures?",
      "options": [
        "a) First In First Out",
        "b) First In Last Out",
        "c) First Index First Out",
        "d) First Index Last Out"
      ],
      "answerIndex": 0
    },
    {
      "Question":
          "Q2.Which data structure uses Last In First Out (LIFO) order of elements?",
      "options": ["a) Queue", "b) Stack", "c) Heap", "d) Linked List"],
      "answerIndex": 1
    },
    {
      "Question":
          "Q3.What does DFS stand for in the context of graph traversal?",
      "options": [
        "a) Directed First Search",
        "b)Data First Search",
        "c) Distance First Search",
        "d)Depth-First Search"
      ],
      "answerIndex": 3
    },
    {
      "Question":
          "Q4.Which data structure is typically used to implement a priority queue?",
      "options": ["a) Stack", "b) Queue", "c) Binary Search Tree", "d) Heap"],
      "answerIndex": 3
    },
    {
      "Question":
          "In which data structure are elements stored in a non-linear hierarchical manner?",
      "options": ['a) Queue', 'b) Stack', "c) Tree", "d) Linked List"],
      "answerIndex": 2
    },
  ];

  bool questionScreen = true;
  int questionIndex = 0;
  int noOfCorrectAnswer = 0;
  int selectedAnswerIndex = -1;

  MaterialStateProperty<Color?> checkAnswer(int buttonIndex) {
    if (selectedAnswerIndex != -1) {
      if (buttonIndex == allQuestions[questionIndex]["answerIndex"]) {
        return const MaterialStatePropertyAll(Colors.green);
      } else if (buttonIndex == selectedAnswerIndex) {
        return const MaterialStatePropertyAll(Colors.red);
      } else {
        return const MaterialStatePropertyAll(null);
      }
    } else {
      return const MaterialStatePropertyAll(null);
    }
  }

  void validatePage() {
    if (selectedAnswerIndex == -1) {
      return;
    }

    if (selectedAnswerIndex == allQuestions[questionIndex]['answerIndex']) {
      noOfCorrectAnswer += 1;
    }

    if (selectedAnswerIndex != -1) {
      if (questionIndex == allQuestions.length - 1) {
        setState(() {
          questionScreen = false;
        });
      }
    }
    selectedAnswerIndex = -1;
    setState(() {
      questionIndex += 1;
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
              const Text("DSA Questions",
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
                    if (selectedAnswerIndex == -1) {
                      setState(() {
                        selectedAnswerIndex = 0;
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
                    if (selectedAnswerIndex == -1) {
                      setState(() {
                        selectedAnswerIndex = 1;
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
                    if (selectedAnswerIndex == -1) {
                      setState(() {
                        selectedAnswerIndex = 2;
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
                    if (selectedAnswerIndex == -1) {
                      setState(() {
                        selectedAnswerIndex = 3;
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

  @override
  Widget build(BuildContext context) {
    return isQuestionScreen();
  }
}
