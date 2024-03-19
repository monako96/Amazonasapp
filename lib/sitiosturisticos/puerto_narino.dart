// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

class PuertoNarino extends StatelessWidget {
  const PuertoNarino({super.key});

  Future<void> _launchGoogleMaps() async {
    // Coordenadas del Parque Santander en Leticia.
    const double latitude = -4.2078895;
    const double longitude = -69.9446021;
    // Intenta abrir en la aplicación Google Maps.
    final Uri googleMapsSchemeUrl = Uri.parse("geo:$latitude,$longitude");
    final Uri googleMapsWebUrl  =  Uri.parse("https://www.google.com/maps/search/?api=1&query=$latitude,$longitude");

    if (await canLaunchUrl(googleMapsSchemeUrl)) {
      await launchUrl(googleMapsSchemeUrl);
    } else if (await canLaunchUrl(googleMapsWebUrl)) {
      // Si no se puede abrir en la app, intenta abrir en el navegador.
      await canLaunchUrl(googleMapsWebUrl );
    } else {
      throw 'No se pudo abrir el mapa.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Puerto Nariño'),
        backgroundColor: Color.fromARGB(255, 0, 59, 31),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/paisajes/victoria.jpg',
                  fit: BoxFit.cover,
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                ),
                const Text(
                  'Bienvenidos al Amazonas',
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 6.0,
                        color: Color.fromARGB(150, 0, 0, 0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            informativeSection(
              title: "Puerto Nariño",
              content:
                  'Puerto Nariño se encuentra ubicado a orillas del río Loretoyacu, un afluente del Amazonas. Es reconocido por su arquitectura colorida y su estilo de vida enfocado en la armonía con la naturaleza. El municipio es un ejemplo de sostenibilidad, con iniciativas de manejo de residuos y proyectos de conservación de la flora y fauna locales. Los visitantes pueden disfrutar de caminatas por senderos ecológicos, avistamiento de aves, y la observación de la rica biodiversidad del área. Además, es posible visitar comunidades indígenas cercanas, donde se puede aprender sobre sus tradiciones y formas de vida.\n',
              imagePaths: [
                "assets/paisajes/indigenas.jpg",
                "assets/paisajes/cultura.jpg",
                "assets/paisajes/mono.jpg",
              ],
            ),
            informativeSection(
              title: "Actividades",
              content:
              'Los tours a Puerto Nariño generalmente incluyen viajes en barco desde Leticia, lo cual permite a los visitantes disfrutar de la impresionante vista del río Amazonas y sus alrededores. Una vez en Puerto Nariño, los tours a menudo exploran el pueblo a pie, dada su pequeña extensión y la falta de vehículos. Las actividades comunes incluyen:\n'
                  '\n\n 1. Visita al Mirador Naipata'
                  '\n\n 2. Tour por el Lago Tarapoto'
                  '\n\n 3. Encuentro con Comunidades Indígenas'
                  '\n\n 4. Compras de Artesanías'
                  '\n\n 5. Disfrutar de la Gastronomía Local'
                  '\n\n 6. Eventos Culturales y Festivales'
                  '\n\n 7. Observación de Fauna y Flora \n\n',
              imagePaths: [
                "assets/paisajes/cultura.jpg",
                "assets/paisajes/indigenas.jpg",
                "assets/paisajes/mono.jpg",
              ],
            ),
            informativeSection(
              title: "Ubicación y Recomendación",
              content: 'Puerto Nariño es un destino ideal para aquellos interesados en el ecoturismo y en experiencias que promuevan la conciencia ambiental y cultural. \n'
              '\n\n Recomendaciones: llevar ropa adecuada, Protección contra Insectos, Vacunas, Botiquín de Primeros Auxilios\n',
              imagePaths: [],
            ),
          ],
        ),
      ),
    );
  }

  Widget informativeSection({
    required String title,
    required String content,
    required List<String> imagePaths,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            content,
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 16),
          ),
          if (title == "Ubicación y Recomendación") // Condición para añadir el botón solo en la sección "Cómo llegar"
    Center(
      child: ElevatedButton(
              onPressed: _launchGoogleMaps,
              child: const Text('Abrir en Google Maps'),
            ),
    ),
          const SizedBox(height: 10),
          CarouselSlider(
            options: CarouselOptions(
              height: 200,
              enlargeCenterPage: true,
              autoPlay: false,
              aspectRatio: 16 / 9,
              enableInfiniteScroll: false,
              viewportFraction: 0.8,
            ),
            items: imagePaths.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.50),
                          spreadRadius: 0.5,
                          blurRadius: 5,
                          offset: const Offset(0, 10), // changes position of shadow
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(i, fit: BoxFit.cover),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
