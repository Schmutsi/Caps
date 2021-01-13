
import 'package:dicee/Score_Container.dart';
import 'package:dicee/game.dart';
import 'package:flutter/material.dart';
import 'Reusable_Thumb.dart';

class CapsGamePage extends StatefulWidget {
  @override
  _CapsGamePageState createState() => _CapsGamePageState();
}

class _CapsGamePageState extends State<CapsGamePage> {

  Game game = Game.initial('Pierrot', 'SCH');
  Game previousGame = Game.initial('Pierrot', 'SCH');

  Game getGame(){
    return Game(game.getPlayer1(), game.getPlayer2(), game.getScorePlayer1(), game.getScorePlayer2(), game.getReverse(), game.getCapsPlayer1(), game.getCapsPlayer2(), game.getTurnPlayer1());
  }

  Text displayName(String player){
    return game.getPlayerSTurn() == player ? Text(player+' c\'est à toi !' , style: TextStyle(fontWeight : FontWeight.bold),) : Text(player);
  }

  @override
  Widget build(BuildContext context) {
    //game.whoStart(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget> [
        RotatedBox(
          quarterTurns: 2,
          child: displayName(game.getPlayer2()),
        ),
        RotatedBox(
          quarterTurns: 2,
          child: Row(
            children: [
              Expanded(
                child: ReusableThumbDown(
                  clic: (){
                    if (!game.getTurnPlayer1()){
                      setState(() {
                      previousGame = getGame();
                      game.playTurnPlayer2(false);
                    });
                      game.setTurnPlayer1(true);
                    }
                  },
                ),
              ),

              Expanded(
                child: Image.asset('images/'+game.getCapsPlayer2().toString()+'.png'),
              ),
              Expanded(
                child: ReusableThumbUp(
                  clic: (){
                    if (!game.getTurnPlayer1()){
                      setState(() {
                        previousGame = getGame();
                        game.playTurnPlayer2(true);
                      });
                      game.setTurnPlayer1(true);
                    }
                  },
                ),
              ),

            ],
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            RotatedBox(
              quarterTurns: 2,
              child: ScoreContainer(
                legend: 'Score',
                score: game.getScorePlayer2(),
              ),
            ),
            RotatedBox(
              quarterTurns: 2,
              child: game.displayWinnerPlayer2(),
            ),
            ScoreContainer(
              legend: 'Score',
              score: game.getScorePlayer2(),
            ),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            RotatedBox(
              quarterTurns: 2,
              child: ScoreContainer(
                legend: 'reverse',
                score: game.getReverse(),
              ),
            ),
            Column(
              children: <Widget>[
                IconButton(
                  constraints: BoxConstraints(minHeight: 0.0,minWidth: 0.0),
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.all(0),
                  icon : Icon(Icons.settings_backup_restore),
                  onPressed: (){
                    setState(() {
                      game = Game.initial('Pierrot', 'SCH');
                      game.whoStart(context);
                    });
                  },
                ),
                Text('reset'),
              ],
            ),
            Column(
              children: [
                IconButton(
                    constraints: BoxConstraints(minHeight: 0.0,minWidth: 0.0),
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.all(0),
                    icon: Icon(Icons.undo),
                    onPressed: (){
                      setState(() {
                        game = previousGame;
                      });
                    }
                ),
                Text('retour'),
              ],
            ),
            ScoreContainer(
              legend: 'reverse',
              score: game.getReverse(),
            ),

          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            RotatedBox(
              quarterTurns: 2,
              child: ScoreContainer(
                legend: 'Score',
                score: game.getScorePlayer1(),
              ),
            ),
            game.displayWinnerPlayer1(),

            ScoreContainer(
              legend: 'Score',
              score: game.getScorePlayer1(),
            ),
          ],
        ),

        Row(
          children: <Widget> [
            Expanded(
              child: ReusableThumbDown(
                clic: (){
                  if (game.getTurnPlayer1()){
                    setState(() {
                      previousGame = getGame();
                      game.playTurnPlayer1(false);
                    });
                    game.setTurnPlayer1(false);
                  }
                },
              ),
            ),
            Expanded(
              child: Image.asset('images/'+game.getCapsPlayer1().toString()+'.png'),
            ),
            Expanded(
              child: ReusableThumbUp(
                clic: (){
                  if (game.getTurnPlayer1()){
                    setState(() {
                      previousGame = getGame();
                      game.playTurnPlayer1(true);
                    });
                    game.setTurnPlayer1(false);
                  }
                },
              ),
            ),
          ],
        ),
        displayName(game.getPlayer1()),
      ],
    );
  }
}