// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:appamazonas/opciones/info_app.dart';
import 'package:appamazonas/sitiosturisticos/sitios_turisticos.dart';
import 'package:flutter/material.dart';
import 'package:appamazonas/inicio/home_screen.dart'; // Asegúrate de ajustar la ruta
import 'package:appamazonas/experiencia/expe_user.dart';

// Importa aquí el resto de tus pantallas

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  NavigationScreenState createState() => NavigationScreenState();
}

class NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    SitiosTuris(),
    UserFeedbackScreen(),
    MoreScreen(),

    // Añade aquí el resto de tus pantallas
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Explorar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star), // Cambia el icono según prefieras
            label: 'Experiencia',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'Más',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 0, 59, 31),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
