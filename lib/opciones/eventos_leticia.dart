// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class EventosScreen extends StatelessWidget {
  const EventosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de eventos para mostrar
    final List<Map<String, dynamic>> eventos = [
      {
        "nombre": "Festival de la Confraternidad Amazónica",
        "fecha": "15 - 20 de julio",
        "descripcion":
            "Este festival tiene lugar en la ciudad de Leticia y se realiza con el fin de dar a conocer la diversidad y similitudes de los pueblos del trapecio amazónico. Con actividades deportivas, musicales, culturales y recreativas, muestras gastronómicas, etc., los visitantes y lugareños se dan cita para disfrutar del folclor, las costumbres, tradiciones y vivencias del Amazonas.",
        "imagen": "assets/AmazonasPh/TresFronteras/21.jpg",
      },
      {
        "nombre": "Pirarucú de Oro",
        "fecha": "Noviembre",
        "descripcion":
            "Este festival se realiza generalmente a finales del mes de noviembre cada año y se ha establecido como un espacio en donde convergen las diferentes manifestaciones musicales y tradiciones de la cultura interamazónica. En el escenario convergen artistas, compositores, autores, e intérpretes de los diferentes ritmos amazónicos.",
        "imagen": "assets/AmazonasPh/TresFronteras/5.jpg",
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
