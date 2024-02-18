import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child:Text("Error",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,wordSpacing: 5),));
  }
}