import "package:flutter/material.dart";
import "package:adv_quiz_app/Pages/HomePage.dart";

class JavaQuest extends StatefulWidget {
  const JavaQuest({super.key});
  @override
  State<JavaQuest> createState() => _JavaQuestState();
}

class _JavaQuestState extends State<JavaQuest> {
  List<Map> allQuestions = [
    {
      "Question": "Q1.What does JVM stand for?",
      "options": [
        "a) Java Virtual Machine",
        "b) Java Visual Model",
        "c) Java Virtual Method",
        "d) Java Virtual Memory"
      ],
      "answerIndex": 0
    },
    {
      "Question": "Q2.What is the parent class of all classes in Java?",
      "options": ["a) Main", "b) Object", "c) Parent", "d) Base"],
      "answerIndex": 1
    },
    {
      "Question":
          "Q3.Which keyword is used to allocate memory dynamically in Java?",
      "options": ["a) dynamic", "b) alloc", "c) malloc", "d) new"],
      "answerIndex": 3
    },
    {
      "Question": "Q4.Which keyword is used to define a constant in Java?",
      "options": ["a) static", "b) const", "c) final", "d) constant"],
      "answerIndex": 2
    },
    {
      "Question":
          "Q5.Which of the following is a valid declaration of a String in Java?",
      "options": [
        'a) String s = "Hello";',
        'b) String s = new String("Hello")',
        "c) Both a & b",
        "d) None"
      ],
      "answerIndex": 2
    },
  ];

  bool questionScreen = true;
  int questionIndex = 0;
  int noOfCorrectAnswer = 0;
  int selectedAnswerIndex = -1;
  //TO Change the button Color
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
//to validate the page and go to next one
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
//To check the correct answer
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
              const Text("Java Questions",
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
