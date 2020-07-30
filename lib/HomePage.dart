import 'package:flutter/material.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  AssetImage cross= AssetImage('images/cross.png');
  AssetImage circle= AssetImage('images/circle.png');
  AssetImage edit= AssetImage('images/edit.png');

  bool iscross= true;
  String message;
  List<String>gamestate;

  //the initial state of the game is there
  void initState() {
    super.initState();
    setState(() {
      this.gamestate= ['empty', 'empty', 'empty', 'empty', 'empty', 'empty', 'empty', 'empty', 'empty'];
      this.message= '';
    });
  }

  //After playing a game the grid is reset back to what it was at the begining
  resetGame(){
    setState(() {
      this.gamestate= ['empty', 'empty', 'empty', 'empty', 'empty', 'empty', 'empty', 'empty', 'empty'];
      this.message= '';
    });
  }

  //get image method
  AssetImage getImage(String value){
    switch(value){
      case ('empty'):
        return edit;
        break;
      case ('cross'):
        return cross;
        break;
      case ('circle'):
        return circle;
        break;
    }
  }

  //the logic for the game which is being played is here
  playGame(int index){
    if(this.gamestate[index]=='empty'){
      setState(() {
        if (this.iscross)
          this.gamestate[index] = 'cross';
        else
          this.gamestate[index] = 'circle';
      });
          }
          this.iscross= !this.iscross;
          this.checkwin();
  }


  //Logic for winning the game is here
  void checkwin() {
    if ((gamestate[0] != 'empty') && (gamestate[0] == gamestate[1]) &&
        (gamestate[1] == gamestate[2])) {
      setState(() {
        Timer(Duration(seconds: 1), () {
          resetGame();
        });
        this.message = '${this.gamestate[2]} wins';
      });
    }
    else if ((gamestate[3] != 'empty') && (gamestate[3] == gamestate[4]) &&
        (gamestate[4] == gamestate[5])) {
      setState(() {
        Timer(Duration(seconds: 1), () {
          resetGame();
        });
        this.message = '${this.gamestate[3]} wins';
      });
    }
    else if ((gamestate[6] != 'empty') && (gamestate[6] == gamestate[7]) &&
        (gamestate[7] == gamestate[8])) {
      setState(() {
        Timer(Duration(seconds: 1), () {
          resetGame();
        });
        this.message = '${this.gamestate[6]} wins';
      });
    }
    else if ((gamestate[0] != 'empty') && (gamestate[0] == gamestate[3]) &&
        (gamestate[3] == gamestate[6])) {
      setState(() {
        Timer(Duration(seconds: 1), () {
          resetGame();
        });
        this.message = '${this.gamestate[0]} wins';
      });
    }
    else if ((gamestate[1] != 'empty') && (gamestate[1] == gamestate[4]) &&
        (gamestate[4] == gamestate[7])) {
      setState(() {
        Timer(Duration(seconds: 1), () {
          resetGame();
        });
        this.message = '${this.gamestate[1]} wins';
      });
    }
    else if ((gamestate[2] != 'empty') && (gamestate[2] == gamestate[5]) &&
        (gamestate[5] == gamestate[8])) {
      setState(() {
        Timer(Duration(seconds: 1), () {
          resetGame();
        });
        this.message = '${this.gamestate[2]} wins';
      });
    }
    else if ((gamestate[0] != 'empty') && (gamestate[0] == gamestate[4]) &&
        (gamestate[4] == gamestate[8])) {
      setState(() {
        Timer(Duration(seconds: 1), () {
          resetGame();
        });
        this.message = '${this.gamestate[0]} wins';
      });
    }
    else if ((gamestate[2] != 'empty') && (gamestate[2] == gamestate[4]) &&
        (gamestate[4] == gamestate[6])) {
      setState(() {
        Timer(Duration(seconds: 1), () {
          resetGame();
        });
        this.message = '${this.gamestate[2]} wins';
      });
    }
    else if (!gamestate.contains('empty')) {
      this.message = 'Game Draw';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        centerTitle: true,
        title: Text('TIC TAC TOE'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(20.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                ),
                itemCount: this.gamestate.length,
                itemBuilder: (context,i) => SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: MaterialButton(
                    onPressed: (){
                      this.playGame(i);
                    },
                    child: Image(
                      image: this.getImage(this.gamestate[i]),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 75.0),
              child: Text(
                this.message,
                style: TextStyle(
                  fontSize: 25.0,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            MaterialButton(
              splashColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
              child: Text('Reset Game', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
              color: Colors.yellow,
              onPressed: (){
                this.resetGame();
              },
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Text('NOTE: This game has to be played by two people', style: TextStyle(fontSize: 15.0, color: Colors.white)),
            ),
          ],
        ),
    );
  }
}
