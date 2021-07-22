import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  @override
  final int resultScore;
  final Function resetQuiz;

  Result(this.resultScore, this.resetQuiz);

  String get resultPhrase {
    String resultText; 
    if (resultScore <= 8) {
      resultText = 'Você é incrível!';
    }  else if (resultScore <= 12) {
      resultText = 'Você é admiravel!';
    } else if (resultScore <= 16) {
      resultText = 'Você é estranho';
    } else {
      resultText = 'Você é top'; 
    }
    return resultText; 
  }

  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget> [
          Text(resultPhrase,
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
        FlatButton(child: Text('Reiniciar Quiz!'), textColor: Colors.blue, onPressed: resetQuiz,)
        ],
      ),
    );
  }
}
