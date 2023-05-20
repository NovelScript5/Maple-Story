import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maple_story_final/GameCharacters/Boy.dart';
import 'package:maple_story_final/GameCharacters/Pet.dart';
import 'package:maple_story_final/GameCharacters/Snail.dart';
import 'package:maple_story_final/MyButton.dart';

void main() {
  
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(

    debugShowCheckedModeBanner: false,
    home: HomePage(),

    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // Game Variables
  bool HasStarted = false;

  // Timer Variables
  bool HasTimerFinished = false;
  int TimeLeft = 3;

  // Snail Variables
  double SnailPosX = 0.8;
  int SnailSpriteCount = 1;
  String SnailDirection = "Left";
  int SnailStamina = 30;
  bool SnailDied = false;

  // Boy Variables
  double BoyPosX = -0.5;
  int BoySpriteCount = 1;
  String BoyDirection = "Right";
  bool IsAttacking = false;

  // Pet Variables
  double PetPosx = -0.7;
  String PetDirection = "Right";
  int PetSpriteCount = 1;

  // Start the Game 
  void StartGame() {
    if (!HasStarted) {
    setState(() {
    HasStarted = true;
    });
    StartTimer();
    MoveSnail();
    MovePet();
    }
  }

  void StartTimer() {

  Timer.periodic(Duration(seconds: 1), (timer) {

  setState(() {
  TimeLeft -= 1;
  if (TimeLeft == 0) {

  HasTimerFinished = true;
  timer.cancel();
  }
  });
  });
  }

  void MoveSnail() {

  Timer.periodic(Duration(milliseconds: 150), (timer) {

  setState(() {

  SnailSpriteCount ++;

  if (SnailSpriteCount == 4) {

  SnailSpriteCount = 1;

  }

  if (SnailDirection == "Left") {

  SnailPosX -= 0.01;

  } else if (SnailDirection == "Right") {

  SnailPosX += 0.01;

  }

  if (SnailPosX > 0.8) {

  SnailDirection = "Left";

  } else if (SnailPosX < 0.3) {

  SnailDirection = "Right";

  }

  });
  });

  }

  void MoveLeft() {
  
  if (HasStarted && HasTimerFinished) {

  setState(() {

  BoyDirection = "Left";
  BoySpriteCount ++;
  BoyPosX -= 0.04;

  if (BoySpriteCount == 4) {

  BoySpriteCount = 1;

  }

  });

  }

  }

  void MoveRight() {

  if (HasStarted && HasTimerFinished) {

  setState(() {

  BoySpriteCount ++;
  BoyDirection = "Right";
  BoyPosX += 0.04;
  if (BoySpriteCount == 4) {

  BoySpriteCount = 1;

  }
  });

  }

  }

  void Attack() {
  Timer.periodic(Duration(milliseconds: 100), (timer) {

  setState(() {
  IsAttacking = true;
  });

  if (BoyDirection == "Right" && BoyPosX + 0.2 > SnailPosX) {

  print("Hit");
  setState(() {
  SnailStamina -= 10;
  if (SnailStamina <= 0) {

  SnailDied = true;
  RegenerateSnail();
  } 
  });

  } else {

  print("Missed");

  }
  timer.cancel();
  });

  Timer.periodic(Duration(milliseconds: 160), (timer) {

  setState(() {
  IsAttacking = false;
  });
  timer.cancel();
  });

  }

  void RegenerateSnail() {

  if (SnailDied) {

  Timer.periodic(Duration(seconds: 6), (timer) {

  setState(() {
  SnailDied = false;
  SnailPosX = 0.8;
  SnailStamina = 30;
  SnailDirection = "Left";
  SnailSpriteCount = 1;
  });
  timer.cancel();
  });

  }

  }

  void MovePet() {

  Timer.periodic(Duration(milliseconds: 150), (timer) {
  setState(() {

  PetSpriteCount ++;

  if (PetSpriteCount == 20) {

  PetSpriteCount = 1;

  }

  if ((BoyPosX - PetPosx).abs() > 0.2) {

  if (BoyDirection == "Right") {

  PetPosx = BoyPosX - 0.2;

  } else if (BoyDirection == "Left") {

  PetPosx = BoyPosX + 0.2;

  }

  }

  if (BoyPosX - PetPosx > 0) {

  PetDirection = "Right";

  } else {

  PetDirection = "Left";

  }

  });


  });

  }

  @override
  Widget build(BuildContext context) {
    return HasStarted && HasTimerFinished ? Scaffold(

    body: Column(children: [

    Expanded(flex: 3,child: Container(color: Colors.blue.shade300,child: Stack(children: [
    
    // Add Snail to the Game
    !SnailDied ? Container(alignment: Alignment(SnailPosX, 1.02), child: Snail(SnailDirection: SnailDirection, SnailSpriteCount: SnailSpriteCount))
    : Container(),
    
    // Add Boy to the Game
    Container(alignment: Alignment(BoyPosX, 1.06),child: Boy(IsAttacking: IsAttacking, BoySpriteCount: BoySpriteCount, BoyDirection: BoyDirection),),

    // Add Pet to the Game
    Container(alignment: Alignment(PetPosx,1.02),child: Pet(PetDirection: PetDirection, PetSpriteCount: PetSpriteCount),)

    ],),)),
    Expanded(child: Container(color: Colors.grey.shade400,child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    MyButton(function: MoveLeft, text: "Left"),
    SizedBox(width: 12,),
    MyButton(function: Attack, text: "Attack"),
    SizedBox(width: 12,),
    MyButton(function: MoveRight, text: "Right")

    ],),))

    ],),

    ) : GestureDetector(onTap: StartGame, child: Scaffold(

    backgroundColor: Colors.purple.shade200,
    body: 
    !HasStarted ? Column(mainAxisAlignment: MainAxisAlignment.start,
    children: [
    SizedBox(height: 200,),
    Center(child: Text("Maple Story",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white),),),
    SizedBox(height: 120,),
    Center(child: Text("Tap to Play the Game",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),),
    ],
    ) : Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Container(width: 80,height: 80, child: CircularProgressIndicator(value: 1 - TimeLeft / 3,color: Colors.grey,backgroundColor: Colors.blue.shade900,strokeWidth: 5.2,)),
    SizedBox(height: 24,),
    Text(TimeLeft.toString(),style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.blue.shade900),)],))
    
    ));
  }
}