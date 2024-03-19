// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

class HotelesScreen extends StatelessWidget {
  const HotelesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de hoteles para mostrar, puedes reemplazarla con tu propia data
    final List<Map<String, dynamic>> hoteles = [
      {
        "nombre": "Hotel Amazonas Real",
        "imagen": "assets/paisajes/indigenas.jpg",
        "descripcion": "Disfruta de la comodidad y la vista al río Amazonas."
      },
      {
        "nombre": "Decameron Decalodge Ticuna",
        "imagen": "assets/paisajes/indigenas.jpg",
        "descripcion": "Experiencia única en el corazón de la selva amazónica."
      },
      // Añade más hoteles aquí
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hoteles en Leticia'),
        backgroundColor: Color.fromARGB(255, 0, 59, 31),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        itemCount: hoteles.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: Image.asset(
                hoteles[index]["imagen"],
                fit: BoxFit.cover,
                width: 100,
              ),
              title: Text(hoteles[index]["nombre"],
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(hoteles[index]["descripcion"]),
              onTap: () {
                // Acción al tocar cada hotel, por ejemplo, navegar a una pantalla con más detalles
              },
            ),
          );
        },
      ),
    );
  }
}
