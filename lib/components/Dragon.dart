import 'dart:math';
import 'package:flame/components/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const ComponentSize = 60.0;
const SPEED = 150.0;

class Dragon extends SpriteComponent {
  Random random = new Random();
  bool remove = false;
  Dragon() : super.square(ComponentSize, 'dragon.png');

  @override
  void update(double t) {
    super.update(t);
    this.y += t * SPEED;
  }

  @override
  bool destroy() {
    if (this.y > 600) {
      return true;
    }
    return remove;
  }

  @override
  void resize(Size size) {
    var positionX = random.nextDouble();
    print(positionX);
    this.x = positionX * 300;
  }
}
