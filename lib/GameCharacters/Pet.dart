import 'dart:math';

import 'package:flutter/material.dart';

class Pet extends StatelessWidget {

  String PetDirection;
  int PetSpriteCount;

  Pet({super.key,required this.PetDirection,required this.PetSpriteCount});

  @override
  Widget build(BuildContext context) {
    if (PetDirection == "Right") {

    return Transform(transform: Matrix4.rotationY(pi),alignment: Alignment.bottomCenter,child: Container(width: 50,height: 50,alignment: Alignment.bottomCenter,child: Image.asset("Images/Brown Teddy/Brown Teddy Moves/Brown Teddy Moves " + PetSpriteCount.toString() + ".png"),),);

    } else {

    return Container(width: 50,height: 50,alignment: Alignment.bottomCenter,child: Image.asset("Images/Brown Teddy/Brown Teddy Moves/Brown Teddy Moves " + PetSpriteCount.toString() + ".png"),);

    }
  }
}