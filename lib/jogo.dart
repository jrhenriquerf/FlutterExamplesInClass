import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flame/gestures.dart';
import 'package:flame/game.dart';
import 'package:flutter_examples/components/Bullet.dart';
import 'package:flutter_examples/components/Dragon.dart';
import 'package:flutter_examples/components/SpaceShip.dart';

class GameWrapper extends StatelessWidget {
  final MyGame game;
  GameWrapper(this.game);
  @override
  Widget build(BuildContext context) {
    return game.widget;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var game = MyGame();
  Flame.images.loadAll(['spaceship.png', 'dragon.png', 'bullet.png']);
  runApp(MaterialApp(
      home: Scaffold(
    appBar: AppBar(title: Text("space game")),
    body: Container(
      decoration: new BoxDecoration(
          image: new DecorationImage(
        image: new AssetImage("assets/images/backgroundSpace.jpg"),
        fit: BoxFit.cover,
      )),
      child: GameWrapper(game),
    ),
  )));
}

class MyGame extends BaseGame with TapDetector {
  var spaceship = new Spaceship();
  double creationDragonTimer = 0.0;
  List<Dragon> dragonList;

  MyGame() {
    dragonList = <Dragon>[];
    add(spaceship);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
  }

  @override
  void update(double t) {
    creationDragonTimer += t;
    if (creationDragonTimer >= 0.5) {
      creationDragonTimer = 0.0;
      var dragon = new Dragon();
      dragonList.add(dragon);
      add(dragon);
    }

    super.update(t);
  }

  @override
  void onTapDown(TapDownDetails details) {
    print(
        "Player tap down on ${details.globalPosition.dx} - ${details.globalPosition.dy} => " +
            details.globalPosition.runtimeType.toString());
    spaceship.direction = details.globalPosition;
    addBullet(details.globalPosition);
  }

  @override
  void onTapUp(TapUpDetails details) {
    print(
        "Player tap down on ${details.globalPosition.dx} - ${details.globalPosition.dy}");
  }

  void addBullet(Offset position) {
    Bullet bullet = new Bullet(position, dragonList);
    add(bullet);
  }
}
