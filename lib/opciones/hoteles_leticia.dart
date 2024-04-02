// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
      // Añade más hoteles aquí
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hoteles en Leticia'),
        backgroundColor: const Color.fromARGB(255, 0, 59, 31),
        iconTheme:IconThemeData(
          color: Colors.white
        )
      ),
      body: ListView.builder(
        itemCount: hoteles.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset(
                          hoteles[index]["imagen"],
                          width: 120,
                          height: 100,
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 90),                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.chat, color: Colors.green),
                    label: const Text('Contactar por WhatsApp', style: TextStyle(color: Colors.black,fontSize: 12,)), // Color del texto
                    onPressed: () {
                      final scaffoldMessenger = ScaffoldMessenger.of(context);

                      final whatsappUrl = Uri.parse("https://wa.me/${hoteles[index]["telefono"]?.replaceAll(' ', '').replaceAll('+', '')}?text=Hola%2C%20me%20gustaría%20saber%20más%20información.");
                      canLaunchUrl(whatsappUrl).then((canLaunch) {
                        if (canLaunch) {
                          launchUrl(whatsappUrl);
                        } else {
                          scaffoldMessenger.showSnackBar(
                            const SnackBar(
                              content: Text('No se pudo abrir WhatsApp'),
                            ),
                          );
                        }
                      });
                    },
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