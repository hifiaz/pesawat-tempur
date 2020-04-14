import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:perang_pesawat/map.dart';
import 'package:perang_pesawat/ship.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  bool showGameOver = false;

  @override
  Widget build(BuildContext context) {
    return BonfireWidget(
      // background: BackgroundColorGame(Colors.white),
      joystick: Joystick(
        pathSpriteBackgroundDirectional: 'joystick_background.png',
        pathSpriteKnobDirectional: 'joystick_knob.png',
        sizeDirectional: 100,
        actions: [
          JoystickAction(
            actionId: 1,
            pathSprite: 'joystick_atack_range.png',
            pathSpritePressed: 'joystick_atack_range_selected.png',
            size: 50,
            margin: EdgeInsets.only(bottom: 50)
          )
        ],
      ),
      map: PesawatMap.map(),
      player: Ship(
        initPosition: Position(5 * 32.0, 10 * 32.0),
      ),
    );
  }
}
