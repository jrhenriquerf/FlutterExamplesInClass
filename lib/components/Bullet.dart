import 'package:flame/components/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'Dragon.dart';

const ComponentSize = 30.0;
const SPEED = 150.0;

class Bullet extends SpriteComponent {
  Offset initialDirection;
  var bulletDestroy = false;
  List<Dragon> dragonList;
  Bullet(this.initialDirection, this.dragonList)
      : super.square(ComponentSize, 'bullet.png');

  @override
  void update(double t) {
    super.update(t);
    this.y -= t * SPEED;

    if (dragonList.isNotEmpty) {
      dragonList.forEach((dragon) {
        if (!dragon.remove) {
          bool remove = this.toRect().contains(dragon.toRect().bottomCenter) ||
              this.toRect().contains(dragon.toRect().bottomLeft) ||
              this.toRect().contains(dragon.toRect().bottomRight);
          if (remove) {
            dragon.remove = true;
            bulletDestroy = true;
          }
        }
      });
    }
  }

  @override
  bool destroy() {
    if (this.y < 0) {
      return true;
    }
    return bulletDestroy;
  }

  @override
  void resize(Size size) {
    this.x = this.initialDirection.dx + 15;
    this.y = this.initialDirection.dy - 55;
  }
}
