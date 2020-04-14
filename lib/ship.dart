import 'package:bonfire/bonfire.dart';
import 'package:flame/animation.dart' as FlameAnimation;

class Ship extends Player {
  final Position initPosition;
  double attack = 25;
  double stamina = 100;
  // Timer _timerStamina;
  bool containKey = false;
  bool showObserveEnemy = false;

  Ship({this.initPosition})
      : super(
            animIdleLeft: FlameAnimation.Animation.sequenced(
              "ship.png",
              5,
              textureWidth: 16,
              textureHeight: 16,
            ),
            animIdleRight: FlameAnimation.Animation.sequenced(
              "ship.png",
              5,
              textureWidth: 16,
              textureHeight: 16,
            ),
            animRunRight: FlameAnimation.Animation.sequenced(
              "ship.png",
              5,
              textureWidth: 16,
              textureHeight: 16,
            ),
            animRunLeft: FlameAnimation.Animation.sequenced(
              "ship.png",
              5,
              textureWidth: 16,
              textureHeight: 16,
            ),
            width: 32,
            height: 32,
            initPosition: initPosition,
            life: 200,
            speed: 2.5,
            collision: Collision(width: 20, height: 16));
}
