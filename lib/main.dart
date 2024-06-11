import 'dart:ffi';

import 'package:flutter/material.dart';
import 'QuestionBank.dart';
import 'Qustion.dart';

Questionbank quiz = Questionbank();
void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text("Java Quiz"),
        ),
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  var counter = 0;

  void checkAnswer(bool UserPickedQustion) {
    bool correctQuestion = quiz.getCorrectQuestoin();
    setState(() {
      if (quiz.isFinsh()) {
        _showSimpleDialog(context);
        print(quiz.getScore());
        quiz.reset();
      } else {
        if (correctQuestion == UserPickedQustion) {
          quiz.updateScore();
        }
        quiz.nextQuestion();
      }
    });
  }

  void _showSimpleDialog(BuildContext context) {
    int myScore = quiz.getScore();
    int listLength = quiz.getQuestion().length;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('your reslut'),
          content: Text(quiz.showResult()),
          actions: [
            TextButton(
              child: Text('you get $myScore from  $listLength'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quiz.getCurrentQuession().text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              // textColor: Colors.white,
              // color: Colors.green,
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(Colors.green),
              ),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(Colors.red),
              ),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAnswer(false);
              },
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [],
          ),
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
