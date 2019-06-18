import 'package:flutter/material.dart';
import 'package:nepali_quiz/quiz_center.dart';

void main() => runApp(Quizzler());

QuizBrain quizBrain = QuizBrain();

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10.0),
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
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userAnswer) {
    bool correctAnswer = quizBrain.getQuestionAnswer();
    if (quizBrain.isFinished() == true) {
      if (correctAnswer == userAnswer) {
        setState(() {
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        });
      } else {
        setState(() {
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        });
      }
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('तपाई हाजिरी जवाफको अन्त्यमा पुग्नु भएको छ।'),
                  RaisedButton(
                    child: Text('हुन्छ'),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    onPressed: () {
                      setState(() {
                        Navigator.of(context).pop();
                        scoreKeeper.clear();
                        quizBrain.resetCounter();
                      });
                    },
                  ),
                ],
              ),
            );
          });
    } else {
      if (correctAnswer == userAnswer) {
        setState(() {
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        });
      } else {
        setState(() {
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        });
      }
      quizBrain.nextQuestion();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 16,
          child: Center(
            child: Text(
              quizBrain.getQuestionText(),
              style: TextStyle(fontSize: 18.0, fontStyle: FontStyle.italic),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.0)),
              color: Colors.green,
              child: Text('ठीक'),
              textColor: Colors.white,
              onPressed: () {
                checkAnswer(true);
              },
            ),
          ),
        ),
        SizedBox(
          height: 9.0,
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.0)),
              color: Colors.red,
              child: Text('बेठीक'),
              textColor: Colors.white,
              onPressed: () {
                checkAnswer(false);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Row(
              children: scoreKeeper,
            ),
          ),
        ),
      ],
    );
  }
}
