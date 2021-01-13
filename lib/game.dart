import 'dart:math';
import 'dart:ui';

import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


class Game {

  String _player1;
  String _player2;
  int _scorePlayer1;
  int _scorePlayer2;
  int _reverse;
  String _capsPlayer1;
  String _capsPlayer2;
  bool _turnPlayer1;

  Game.initial(String p1, String p2){ //reset or new game
    _player1 = p1;
    _player2 = p2;
    _scorePlayer1 = 0;
    _scorePlayer2 = 0;
    _reverse = 0;
    _capsPlayer1 = 'caps1pile';
    _capsPlayer2 = 'caps2pile';
    _turnPlayer1 = Random().nextBool();
  }

  Game(this._player1,
      this._player2,
      this._scorePlayer1,
      this._scorePlayer2,
      this._reverse,
      this._capsPlayer1,
      this._capsPlayer2,
      this._turnPlayer1);


  int getScorePlayer1() => _scorePlayer1;
  int getScorePlayer2() => _scorePlayer2;
  int getReverse() => _reverse;
  String getCapsPlayer1() => _capsPlayer1;
  String getCapsPlayer2() => _capsPlayer2;
  String getPlayer1() => _player1;
  String getPlayer2() => _player2;
  bool getTurnPlayer1() => _turnPlayer1;

  String getPlayerSTurn(){
    if (getTurnPlayer1()){
      return getPlayer1();
    }else{
      return getPlayer2();
    }
  }

  setScorePlayer1(int value) {
    _scorePlayer1 = value;
  }
  setScorePlayer2(int value) {
    _scorePlayer2 = value;
  }
  setReverse(int value) {
    _reverse = value;
  }
  setCapsPlayer1(String value) {
    _capsPlayer1 = value;
  }
  setCapsPlayer2(String value) {
    _capsPlayer2 = value;
  }
  setTurnPlayer1(bool value) {
    _turnPlayer1 = value;
  }



  void displayAlert(String player, BuildContext context){
    Alert(
      context: context,
      //type: AlertType.success,
      image : Image.asset('images/capsOuPasCaps.png', height: 150 ,width: 150,),
      title: "$player Commence",
      desc: "le tirage au sort est aléatoire",
      buttons: [
        DialogButton(
          child: Text(
            "C'est parti",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
  }
  void whoStart(BuildContext context){
    if (getTurnPlayer1()){
      displayAlert(_player1, context);
    }
    else{
      displayAlert(_player2, context);
    }
  }


  void player1Covered(){
    _capsPlayer1 = 'caps1pile';
  }
  void player2Covered(){
    _capsPlayer2 = 'caps2pile';
  }
  void playSoundCaps(){
    int n = Random().nextInt(10)+1;
    final player = AudioCache();
    player.play('sonCapsule$n.wav');
  }

  Icon displayWinnerPlayer1(){
    if (_scorePlayer1>_scorePlayer2){
      return(Icon(
        Icons.emoji_events,
        size: 40.0,
      ));
    }
    else{
      return(Icon(
        Icons.emoji_events,
        color: Colors.pink[100],
      ));
    }
  }
  Icon displayWinnerPlayer2(){
    if (_scorePlayer1<_scorePlayer2){
      return(Icon(
        Icons.emoji_events,
        size: 40.0,
      ));
    }
    else{
      return(Icon(
        Icons.emoji_events,
        color: Colors.pink[100],
      ));
    }
  }

  void playTurnPlayer1(bool touched){
    player1Covered();
    if (touched){
      _capsPlayer2 = 'bottle';
      playSoundCaps();
      _reverse++;
    }else{
      _scorePlayer2 = getScorePlayer2() + getReverse();
      _reverse = 0;
    }
  }
  void playTurnPlayer2(bool touched){
    player2Covered();
    if (touched){
      _capsPlayer1 = 'bottle';
      playSoundCaps();
      _reverse++;
    }else{
      _scorePlayer1 = getScorePlayer1() + getReverse();
      _reverse = 0;
    }
  }
}