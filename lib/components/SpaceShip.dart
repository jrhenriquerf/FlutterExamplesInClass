import 'package:flame/components/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const ComponentSize = 60.0;
const SPEED = 150.0;

class Spaceship extends SpriteComponent {
  Offset direction;
  Spaceship() : super.square(ComponentSize, 'spaceship.png');

  @override
  void update(double t) {
    super.update(t);
    x = direction != null ? direction.dx : this.x;
    y = direction != null ? direction.dy : this.y;
  }

  @override
  bool destroy() {
    return false;
  }

  @override
  void resize(Size size) {
    this.x = size.width / 2 - ComponentSize / 2;
    this.y = size.height - ComponentSize;
  }
}
