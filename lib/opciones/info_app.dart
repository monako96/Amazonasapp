// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Más'),
        backgroundColor: Color.fromARGB(255, 0, 59, 31),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView(
              children: [
                ExpansionTile(
                  leading: Icon(Icons.contact_mail),
                  title: Text('Información de contacto'),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Puedes contactarnos a través de:"),
                          Text("Email: contacto@example.com"),
                          Text("Teléfono: +123 456 7890"),
                          // Añade más información de contacto si es necesario
                        ],
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  leading: Icon(Icons.info_outline),
                  title: Text('Acerca de la app'),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Versión de la app: 1.0.0"),
                          Text("Desarrollado por: Tu Nombre o Empresa"),
                          // Añade más detalles acerca de la app
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Logos en la parte inferior
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/paisajes/choza.jpg'),
                ),
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/paisajes/cultura.jpg'),
                ),
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/paisajes/indigenas.jpg'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
