import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  final function;
  final text;

  const MyButton({super.key,required this.function,required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: function,child: Container(
    width: 80,height: 60,
    decoration: BoxDecoration(
    color: Colors.grey.shade600,
    borderRadius: BorderRadius.circular(12)),
    child: Center(child: Text(text,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),),
    ),);
  }
}