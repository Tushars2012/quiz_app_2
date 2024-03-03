import "package:flutter/material.dart";
import "SecondPage.dart";


class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: SizedBox(
          width: double.infinity,
          child: Column(
              // crossAxisAlignment:CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("QUIZ",
                    style: TextStyle(
                        color: Colors.amber,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        letterSpacing:5,
                        fontFamily:'MadimiOne')),
                const SizedBox(height: 7),
                const Text("APP",
                    style: TextStyle(
                        color: Colors.amber,
                        fontSize: 50,
                        fontWeight: FontWeight.w900,
                        letterSpacing:5,
                        fontFamily:'MadimiOne'),
                        ),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SecondPage()));
                    },
                    child: const Text("Start Quiz",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          
                        )))
              ]),
        ));
  }
}
