// turismo.dart
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

class ActividadesScreen extends StatelessWidget {
  const ActividadesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> actividades = [
      {
        "nombre": "Navegación por el Río Amazonas",
        "imagen": "assets/paisajes/rio.jpg",
        "descripcion": "Explora la majestuosidad del río Amazonas en un recorrido en bote que te llevará por paisajes inolvidables y encuentros cercanos con la vida silvestre.",
      },
      {
        "nombre": "Avistamiento de Fauna y Flora",
        "imagen": "assets/paisajes/rio.jpg",
        "descripcion": "Descubre la increíble biodiversidad del Amazonas. Observa especies exóticas de aves, mamíferos, reptiles y una impresionante variedad de plantas.",
      },
      {
        "nombre": "Visita a Comunidades Indígenas",
        "imagen": "assets/paisajes/rio.jpg",
        "descripcion": "Conoce el modo de vida de las comunidades indígenas amazónicas. Aprende sobre sus tradiciones, cultura y relación con la naturaleza.",
      },
      {
        "nombre": "Caminatas por la Selva",
        "imagen": "assets/paisajes/rio.jpg",
        "descripcion": "Aventúrate en caminatas guiadas por la selva amazónica. Explora senderos naturales y descubre los secretos que esconde este impresionante ecosistema.",
      },
      // Añade más actividades aquí según necesites
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Actividades en Leticia, Amazonas'),
        backgroundColor: Color.fromARGB(255, 0, 59, 31),
          iconTheme: IconThemeData(
            color: Colors
                .white,
          )
      ),
      body: ListView.builder(
        itemCount: actividades.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0), // Bordes redondeados para la imagen
                  child: Image.asset(
                    actividades[index]["imagen"],
                    width: double.infinity, // Hace que la imagen se expanda para ocupar todo el ancho disponible
                    height: 200, // Altura fija para todas las imágenes
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        actividades[index]["nombre"],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(actividades[index]["descripcion"]),
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
