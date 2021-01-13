import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CapsGamePage.dart';


void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.pink[100],
        appBar: AppBar(
          title: Center(
              child: Text(
                  'Player1 VS Player2',
              ),
          ),
          backgroundColor: Colors.red,
        ),
        body: CapsGamePage(),
      ),
    ),
  );
}


