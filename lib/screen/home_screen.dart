import 'package:flutter/material.dart';

import 'on_boarding_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //I want to reduce this app bar height
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: AppBar(
          backgroundColor: Color.fromARGB(255, 0, 93, 105),
          elevation: 0,
          centerTitle: true,
          foregroundColor: Colors.white,
          title: const Text('Ozonteck',style: TextStyle(letterSpacing: 2),),
          actions: [
            IconButton(
              icon: const Icon(Icons.payment),
              onPressed: (){},
            ),
            IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, OnBoardingScreen.id);
              }, 
              icon: Icon(Icons.logout)
            )
          ],
        ),
      ),
    );
  }
}