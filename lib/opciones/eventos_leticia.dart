// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class EventosScreen extends StatelessWidget {
  const EventosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de eventos para mostrar
    final List<Map<String, dynamic>> eventos = [
      {
        "nombre": "Festival de la Amazonía",
        "fecha": "10-15 de octubre",
        "descripcion":
            "Un evento cultural que celebra la diversidad de la selva amazónica con música, danza y gastronomía local.",
        "imagen": "assets/paisajes/indigenas.jpg",
      },
      {
        "nombre": "Carnaval Amazónico",
        "fecha": "20-22 de febrero",
        "descripcion":
            "Disfruta del carnaval más verde del mundo, con desfiles, disfraces y la alegría característica de la región.",
        "imagen": "assets/paisajes/indigenas.jpg",
      },
      {
        "nombre": "Encuentro de Tribus Indígenas",
        "fecha": "5 de septiembre",
        "descripcion":
            "Un día para aprender y compartir con las tribus indígenas, sus tradiciones, rituales y forma de vida.",
        "imagen": "assets/paisajes/indigenas.jpg",
      },
      // Añade más eventos aquí
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Eventos en Leticia'),
        backgroundColor: Color.fromARGB(255, 0, 59, 31),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        itemCount: eventos.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                Image.asset(eventos[index]["imagen"], fit: BoxFit.cover),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(eventos[index]["nombre"],
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Text(eventos[index]["fecha"],
                          style: const TextStyle(
                              fontSize: 16, fontStyle: FontStyle.italic)),
                      SizedBox(height: 10),
                      Text(eventos[index]["descripcion"]),
                    ],
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
