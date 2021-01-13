

import 'package:flutter/material.dart';

class ScoreContainer extends StatelessWidget{

  final int score;
  final String legend;

  ScoreContainer({this.score, this.legend});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Text(
        legend + ': \n' + score.toString(),
        style : TextStyle(
          color: Colors.white,
          fontSize: 20.0,
        ),
      ),
    );
  }



}