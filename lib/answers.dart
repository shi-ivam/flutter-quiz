import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answerText;
  final Function changeQuestionIndex;
  Answer(this.answerText, this.changeQuestionIndex);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
      width: double.infinity,
      child: RaisedButton(
        padding: EdgeInsets.all(10),
        child: Text(
          answerText,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
        onPressed: () {
          changeQuestionIndex();
        },
      ),
    );
  }
}
