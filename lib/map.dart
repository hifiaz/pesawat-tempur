import 'package:bonfire/bonfire.dart';

class PesawatMap {
  static MapWorld map() {
    List<Tile> tileList = List();
    tileList.add(Tile('desert-backgorund.png', Position(35.0, 35.0),
        collision: true, size: 32));
    return MapWorld(tileList);
  }

  static List<Enemy> enemies() {
    return [
    ];
  }
}
