// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HotelesScreen extends StatelessWidget {
  const HotelesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> hoteles = [
      {
        "nombre": "Hotel Amazonas Real",
        "imagen": "assets/AmazonasPh/aventurasenlaselva/10.jpg",
        "descripcion": "Disfruta de la comodidad y la vista al río Amazonas.",
        "telefono": "+57 123 456 7890",
        "direccion": "Leticia - Amazonas",
      },
      {
        "nombre": "Decameron Decalodge Ticuna",
        "imagen": "assets/AmazonasPh/puertonarino/20.jpg",
        "descripcion": "Experiencia única en el corazón de la selva amazónica.",
        "telefono": "+57 098 765 4321",
        "direccion": "Leticia - Amazonas",
      },
      {
        "nombre": "Hotel Selva Mágica",
        "imagen": "assets/AmazonasPh/aventurasenlaselva/10.jpg",
        "descripcion": "Un refugio mágico en medio de la naturaleza.",
        "telefono": "+57 321 654 9870",
        "direccion": "Leticia - Amazonas",
      },
      {
        "nombre": "Eco Hotel El Paraíso",
        "imagen": "assets/AmazonasPh/puertonarino/20.jpg",
        "descripcion": "Conecta con la naturaleza en un ambiente ecológico.",
        "telefono": "+57 654 321 0987",
        "direccion": "Leticia - Amazonas",
      },
      // Añadir más hoteles aquí

    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hoteles en Leticia'),
        backgroundColor: const Color.fromARGB(255, 0, 59, 31),
        iconTheme: IconThemeData(
          color: Colors.white
        ),
      ),
      body: ListView.builder(
        itemCount: hoteles.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0), // Baja la posición de la imagen
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset(
                      hoteles[index]["imagen"],
                      width: 120, // Ajusta este valor para cambiar el ancho de la imagen
                      height: 100, // Ajusta este valor para cambiar la altura de la imagen
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          hoteles[index]["nombre"],
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        Text(hoteles[index]["descripcion"]),
                        const SizedBox(height: 8),
                        Text('📞 ${hoteles[index]["telefono"]}'),
                        Text('📍 ${hoteles[index]["direccion"]}'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
