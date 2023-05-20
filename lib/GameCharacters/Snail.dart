import 'dart:math';

import 'package:flutter/material.dart';

class Snail extends StatelessWidget {

  String SnailDirection;
  int SnailSpriteCount;

  Snail({super.key,required this.SnailDirection,required this.SnailSpriteCount});

  @override
  Widget build(BuildContext context) {
    if (SnailDirection == "Left") {

    return Container(width: 50,height: 50,alignment: Alignment.bottomCenter,
    child: Image.asset("Images/Blue Snail/Blue Snail Moves/Blue Snail Moves " + SnailSpriteCount.toString() + ".png"),);

    } else {

    return Transform(transform: Matrix4.rotationY(pi),alignment: Alignment.bottomCenter, 
    child: Container(width: 50,height: 50,alignment: Alignment.bottomCenter,child: Image.asset("Images/Blue Snail/Blue Snail Moves/Blue Snail Moves " + SnailSpriteCount.toString() + ".png"),),);

    }
  }
}