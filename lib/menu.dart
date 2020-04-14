import 'dart:async';

import 'package:bonfire/bonfire.dart';
import 'package:flame/animation.dart' as FlameAnimation;
import 'package:flame_splash_screen/flame_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:perang_pesawat/game.dart';
import 'package:url_launcher/url_launcher.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  bool showSplash = true;
  int currentPosition = 0;
  Timer _timer;
  List<Widget> sprites = [
    Flame.util.animationAsWidget(
      Position(80, 80),
      FlameAnimation.Animation.sequenced('ship.png', 5,
          textureWidth: 16.0, textureHeight: 16.0),
    ),
    Flame.util.animationAsWidget(
      Position(80, 80),
      FlameAnimation.Animation.sequenced('enemy-big.png', 2,
          textureWidth: 30.0, textureHeight: 30.0),
    ),
  ];

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      child: showSplash ? buildSplash() : buildMenu(),
    );
  }

  Widget buildMenu() {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            sprites[currentPosition],
            SizedBox(height: 50),
            Text(
              'Perang Pesawat',
              style: TextStyle(
                  color: Colors.white, fontFamily: 'Normal', fontSize: 30.0),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 150,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                color: Color.fromARGB(255, 118, 82, 78),
                child: Text(
                  'Mulai',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Normal',
                    fontSize: 17.0,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Game()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 20,
          margin: EdgeInsets.all(20.0),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Powered by ',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Normal',
                          fontSize: 12.0),
                    ),
                    InkWell(
                      onTap: () {
                        _launchURL('https://github.com/hifiaz');
                      },
                      child: Text(
                        'hifiaz',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.blue,
                          fontFamily: 'Normal',
                          fontSize: 12.0,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Build With ',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Normal',
                          fontSize: 12.0),
                    ),
                    InkWell(
                      onTap: () {
                        _launchURL(
                            'https://github.com/RafaelBarbosatec/bonfire');
                      },
                      child: Text(
                        'Bonfire',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.blue,
                          fontFamily: 'Normal',
                          fontSize: 12.0,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSplash() {
    return FlameSplashScreen(
        onFinish: (context) {
          setState(() {
            showSplash = false;
          });
          startTimer();
        },
        theme: FlameSplashTheme.white);
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        currentPosition++;
        if (currentPosition > sprites.length - 1) {
          currentPosition = 0;
        }
      });
    });
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
