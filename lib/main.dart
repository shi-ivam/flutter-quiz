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
  var totalPoints = 0;
  var questions = [
    {
      "title": "What is Your Favourite Color?",
      "answers": [
        {"name": "White", "points": 10},
        {"name": "Black", "points": 2},
        {"name": "Red", "points": 5},
        {"name": "Orange", "points": 7},
      ]
    },
    {
      "title": "What is Your Favourite Animal?",
      "answers": [
        {"name": "Lion", "points": 5},
        {"name": "Rabbit", "points": 10},
        {"name": "Dog", "points": 10},
        {"name": "Cat", "points": 7},
      ]
    },
    {
      "title": "What is Your Favourite Icecream?",
      "answers": [
        {"name": "Cookie & Cream", "points": 10},
        {"name": "Chocolate", "points": 10},
        {"name": "Vannila", "points": 10},
        {"name": "Black Current", "points": 10},
      ]
    },
    {
      "title": "What is Your Favourite Color?",
      "answers": [
        {"name": "Red 1", "points": 10},
        {"name": "Red 1", "points": 10},
        {"name": "Red 1", "points": 10},
        {"name": "Red 1", "points": 10},
      ]
    },
  ];

  void _changeQuestionIndex(argPoints) {
    if (questionsIndex == 3) {
      setState(() {
        questionsComplete = true;
        totalPoints = totalPoints + argPoints;
      });
    } else {
      setState(() {
        questionsIndex = questionsIndex + 1;
        totalPoints = totalPoints + argPoints;
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
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Completed',
                        style: TextStyle(fontSize: 34),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Score : " + totalPoints.toString(),
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Container(
                          color: Colors.blue[200],
                          child: FlatButton(
                            onPressed: () {
                              setState(() {
                                questionsIndex = 0;
                                questionsComplete = false;
                                totalPoints = 0;
                              });
                            },
                            child: Icon(
                              Icons.restore,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
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
                              ...(questions[questionsIndex]['answers'] as List)
                                  .map((e) => Answer(e["name"],
                                      _changeQuestionIndex, e["points"]))
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
