import 'dart:math';

import 'package:flutter/material.dart';

class Boy extends StatelessWidget {

  String BoyDirection;
  int BoySpriteCount;
  bool IsAttacking;

  Boy({super.key,required this.IsAttacking,required this.BoySpriteCount,required this.BoyDirection});

  @override
  Widget build(BuildContext context) {

    if (IsAttacking && BoyDirection == "Right") {

    return Transform(transform: Matrix4.rotationY(pi),alignment: Alignment.bottomCenter,child: Container(width: 100,height: 100,alignment: Alignment.bottomCenter,child: Image.asset("Images/Main Character/Main Character Attacks/Main Character Attacks 1.png"),),);

    } else if (IsAttacking && BoyDirection == "Left") {

    return Container(width: 100,height: 100,alignment: Alignment.bottomCenter,child: Image.asset("Images/Main Character/Main Character Attacks/Main Character Attacks 1.png" ),);

    } 
    if (BoyDirection == "Right") {

    return Transform(transform: Matrix4.rotationY(pi),alignment: Alignment.bottomCenter,child: Container(width: 100,height: 100,alignment: Alignment.bottomCenter,child: Image.asset("Images/Main Character/Main Character Moves/Main Character Moves " + BoySpriteCount.toString() + ".png"),),);

    } else {

    return Container(width: 100,height: 100,alignment: Alignment.bottomCenter,child: Image.asset("Images/Main Character/Main Character Moves/Main Character Moves " + BoySpriteCount.toString() + ".png"),);

    }

  }
}