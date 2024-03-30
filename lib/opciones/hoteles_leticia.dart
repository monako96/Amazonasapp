// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HotelesScreen extends StatelessWidget {
  const HotelesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de hoteles actualizada con más entradas y datos completos
    final List<Map<String, dynamic>> hoteles = [
      {
        "nombre": "Hotel Amazonas Real",
        "imagen": "assets/paisajes/indigenas.jpg",
        "descripcion": "Disfruta de la comodidad y la vista al río Amazonas.",
        "telefono": "+57 123 456 7890",
        "direccion": "Calle Ficticia 123, Leticia"
      },
      {
        "nombre": "Decameron Decalodge Ticuna",
        "imagen": "assets/paisajes/indigenas.jpg",
        "descripcion": "Experiencia única en el corazón de la selva amazónica.",
        "telefono": "+57 098 765 4321",
        "direccion": "Avenida Imaginaria 456, Leticia"
      },
      {
        "nombre": "Hotel Selva Mágica",
        "imagen": "assets/paisajes/indigenas.jpg",
        "descripcion": "Un refugio mágico en medio de la naturaleza.",
        "telefono": "+57 321 654 9870",
        "direccion": "Calle de los Sueños 789, Leticia"
      },
      {
        "nombre": "Eco Hotel El Paraíso",
        "imagen": "assets/paisajes/rio.jpg",
        "descripcion": "Conecta con la naturaleza en un ambiente ecológico.",
        "telefono": "+57 654 321 0987",
        "direccion": "Vereda Paraíso 321, Leticia"
      },
      // Añade más hoteles aquí según necesites
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Hoteles en Leticia'),
        backgroundColor: Color.fromARGB(255, 0, 59, 31),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        itemCount: hoteles.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(4.0), // Bordes ligeramente redondeados
                child: SizedBox(
                  width: 80, // Ancho fijo para todas las imágenes
                  height: 200, // Altura fija para mantener la proporción
                  child: Image.asset(
                    hoteles[index]["imagen"],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text(
                hoteles[index]["nombre"],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(hoteles[index]["descripcion"]),
                  SizedBox(height: 10),
                  Text('📞 ${hoteles[index]["telefono"]}'),
                  Text('📍 ${hoteles[index]["direccion"]}'),
                ],
              ),
              // Se ha eliminado onTap
            ),
          );
        },
      ),
    );
  }
}
