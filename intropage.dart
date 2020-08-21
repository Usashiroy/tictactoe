import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'homepage.dart';
import 'package:avatar_glow/avatar_glow.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
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
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                child: Center(
                  child: Text(
                    'TIC TAC TOE',
                    textAlign: TextAlign.center,
                    style: myNewFontWhite.copyWith(
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: AvatarGlow(
                endRadius: 140.0,
                duration: Duration(seconds: 2),
                glowColor: Colors.white,
                repeat: true,
                repeatPauseDuration: Duration(seconds: 1),
                startDelay: Duration(seconds: 1),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      style: BorderStyle.none,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey[900],
                    child: Image.asset('lib/images/ttt.png',
                    fit: BoxFit.scaleDown,
                    ),
                    radius: 80.0,
                  ),

                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all( 35.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                  child: RaisedButton(
                    elevation: 10.0,
                    color: Colors.white,
                    child: Text(
                      'PLAY GAME',
                      style: myNewFont,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => HomePage()));
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
