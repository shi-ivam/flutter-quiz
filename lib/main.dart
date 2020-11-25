import 'package:flutter/material.dart';
import './question.dart';
import './answers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var questionsIndex = 0;
  var questionsComplete = false;

  var questions = [
    {
      "title": "What is Your Favourite Color?",
      "answers": ["Orange 1", "Red 1", "Blue 1", "Pink 1"]
    },
    {
      "title": "What is Your Favourite Color 2?",
      "answers": ["Orange 2", "Red 2", "Blue 2", "Pink 2"]
    },
    {
      "title": "What is Your Favourite Color 3?",
      "answers": ["Orange 3", "Red 3", "Blue 3", "Pink 3"]
    },
    {
      "title": "What is Your Favourite Color 4?",
      "answers": ["Orange 4", "Red 4", "Blue 4", "Pink 4"]
    },
  ];

  void _changeQuestionIndex() {
    if (questionsIndex == 3) {
      setState(() {
        questionsComplete = true;
      });
    } else {
      setState(() {
        questionsIndex = questionsIndex + 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quizz'),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: questionsComplete == true
              ? Center(
                  child: Text(
                    'Completed',
                    style: TextStyle(fontSize: 34),
                  ),
                )
              : Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: Text(
                            'Question',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ),
                        Text(
                          (questionsIndex + 1).toString() + '/4',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Question(questions[questionsIndex]
                            ["title"]), //Question Widget is there
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                          child: Column(
                            children: [
                              ...(questions[questionsIndex]['answers']
                                      as List<String>)
                                  .map((e) => Answer(e, _changeQuestionIndex))
                                  .toList()
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
