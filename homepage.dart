import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> displayXO = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  bool _oTurn = true; //The first player is O

  void _checkWinner() {
    if (displayXO[0] == displayXO[1] &&
        displayXO[0] == displayXO[2] &&
        displayXO[0] != '') {
      _winDialog(displayXO[0]);
    } else if (displayXO[3] == displayXO[4] &&
        displayXO[3] == displayXO[5] &&
        displayXO[3] != '') {
      _winDialog(displayXO[3]);
    } else if (displayXO[6] == displayXO[7] &&
        displayXO[6] == displayXO[8] &&
        displayXO[6] != '') {
      _winDialog(displayXO[6]);
    } else if (displayXO[0] == displayXO[3] &&
        displayXO[0] == displayXO[6] &&
        displayXO[0] != '') {
      _winDialog(displayXO[0]);
    } else if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != '') {
      _winDialog(displayXO[1]);
    } else if (displayXO[2] == displayXO[5] &&
        displayXO[2] == displayXO[8] &&
        displayXO[2] != '') {
      _winDialog(displayXO[2]);
    } else if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != '') {
      _winDialog(displayXO[0]);
    } else if (displayXO[2] == displayXO[4] &&
        displayXO[2] == displayXO[6] &&
        displayXO[2] != '') {
      _winDialog(displayXO[2]);
    } else if (filledBoxes == 9) {
      _showDrawDialog();
    }
  }

  void _winDialog(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'WINNER IS PLAYER $winner!',
              textAlign: TextAlign.center,
              style: myNewFont,
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  'Play Again?',
                  style: myNewFont,
                ),
                onPressed: () {
                  setState(() {
                    for (int i = 0; i < 9; i++) {
                      displayXO[i] = '';
                    }
                  });
                  filledBoxes = 0;
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
    if (winner == 'O') {
      oScore += 1;
    } else if (winner == 'X') {
      xScore += 1;
    }
  }

  void _showDrawDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'IT\'S A DRAW!',
              textAlign: TextAlign.center,
              style: myNewFont,
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  'Play Again?',
                  style: myNewFont,
                ),
                onPressed: () {
                  setState(() {
                    for (int i = 0; i < 9; i++) {
                      displayXO[i] = '';
                    }
                    filledBoxes = 0;
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  int oScore = 0;
  int xScore = 0;

  int filledBoxes = 0;

  static var myNewFont = GoogleFonts.pressStart2P(
    textStyle: TextStyle(
      color: Colors.black,
      letterSpacing: 3,
    ),
  );
  static var myNewFontWhite = GoogleFonts.pressStart2P(
    textStyle: TextStyle(
      color: Colors.white,
      letterSpacing: 3,
      fontSize: 15,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Center(
                child: SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text('Player O', style: myNewFontWhite),
                          Text(oScore.toString(), style: myNewFontWhite),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text('Player X', style: myNewFontWhite),
                          Text(xScore.toString(), style: myNewFontWhite),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_oTurn == true && displayXO[index] == '') {
                          displayXO[index] = 'O';
                          filledBoxes += 1;
                        } else if (!_oTurn == true && displayXO[index] == '') {
                          displayXO[index] = 'X';
                          filledBoxes += 1;
                        }
                        _oTurn = !_oTurn;
                        _checkWinner();
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey[700],
                        ),
                      ),
                      child: Center(
                        child: Text(
                          displayXO[index],
                          style: myNewFontWhite.copyWith(
                            fontSize: 40.0,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Expanded(
            child: Container(
              child: Text(
                'TIC TAC TOE',
                style: myNewFontWhite,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
