// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'dart:async';
import 'navigation_bar.dart';

class BienvenidScreen extends StatefulWidget {
  const BienvenidScreen({super.key});

  @override
  BienvenidScreenState createState() => BienvenidScreenState();
}

class BienvenidScreenState extends State<BienvenidScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      // Navega al NavigationScreen después de la pantalla de bienvenida
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const NavigationScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/images/amazonas.gif', // Asegúrate de que la ruta de la imagen sea correcta
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
          ),

        ],
      ),
    );
  }
}
