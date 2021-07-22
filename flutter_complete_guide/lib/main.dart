import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

// runApp => takes the widget tree and draw it onto the screen
void main() => runApp(MyApp());

// main app widgets where all of them are inside of it;
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyappState();
  }
}

class _MyappState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Qual sua cor favorita?',
      'answers': [
        {'text': 'Preto', 'score': 10},
        {'text': 'Vermelho', 'score': 5},
        {'text': 'Verde', 'score': 3},
        {'text': 'Branco', 'score': 1}
      ]
    },
    {
      'questionText': 'Qual sua linguagem favorita?',
      'answers': [
        {'text': 'Dart', 'score': 10},
        {'text': 'Javascript', 'score': 5},
        {'text': 'Ruby', 'score': 3},
        {'text': 'Python', 'score': 1}
      ]
    },
    {
      'questionText': 'Quem é seu professor favorito?',
      'answers': [
        {'text': 'Gracon', 'score': 10},
        {'text': 'Felipão', 'score': 5},
        {'text': 'Marilia', 'score': 3},
        {'text': 'Jorgiano', 'score': 1}
      ]
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  // called by flutter to build the app on the screen
  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    // MaterialApp => class that recieve params so it has a constructor
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Meu primeiro aplicativo'),
          ),
          //<Widget>[] => list (group of data)
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              : Result(_totalScore, _resetQuiz)),
    );
  }
}
