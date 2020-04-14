import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:perang_pesawat/menu.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.util.setPortrait();
  await Flame.util.fullScreen();
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.orange,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: Menu(),
  ));
}
