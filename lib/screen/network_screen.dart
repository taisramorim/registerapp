import 'package:flutter/material.dart';

class NetworkScreen extends StatelessWidget {
  const NetworkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: Text('Network Screen',style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),),),
      ),
    );
  }
}