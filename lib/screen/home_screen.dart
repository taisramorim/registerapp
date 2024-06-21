import 'package:flutter/material.dart';

import 'on_boarding_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String id = 'home-screen';  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.outline,
      //I want to reduce this app bar height
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          elevation: 0,
          centerTitle: true,
          foregroundColor: Colors.white,
          title: const Text('Ozonteck',style: TextStyle(letterSpacing: 2),),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, OnBoardingScreen.id);
              }, 
              icon: const Icon(Icons.logout)
            )
          ],
        ),
      ),
    );
  }
}