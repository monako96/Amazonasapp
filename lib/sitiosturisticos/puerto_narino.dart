// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

class PuertoNarino extends StatelessWidget {
  const PuertoNarino({super.key});

  Future<void> _launchGoogleMaps() async {
    // URL proporcionada para la ubicación específica en Google Maps
    final Uri googleMapsUrl = Uri.parse("https://www.google.com/maps/place/Puerto+Narino,+Puerto+Nari%C3%B1o,+Amazonas/@-3.7900846,-70.359175,17z/data=!3m1!4b1!4m6!3m5!1s0x91f20bccc846966b:0x3392e96a72f11550!8m2!3d-3.7888675!4d-70.3556424!16zL20vMDYzc25k?entry=ttu");

    if (await canLaunchUrl(googleMapsUrl)) {
      await launchUrl(googleMapsUrl);
    } else {
      throw 'No se pudo abrir el mapa.';
    }
  }

  void _showFullScreenImage(BuildContext context, String imagePath) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          body: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Center(
              child: InteractiveViewer(
                panEnabled: false, // Prevent panning
                boundaryMargin: EdgeInsets.all(100),
                minScale: 0.5,
                maxScale: 2,
                child: Image.asset(imagePath),
              ),
            ),
          ),
          backgroundColor: Colors.black,
        ),
      ),
    );
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
                  'assets/AmazonasPh/puertonarino/27.jpg',
                  fit: BoxFit.cover,
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                ),
                const Text(
                  'Bienvenidos al Amazonas',
                  style: TextStyle(
                    fontSize: 30,
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
              context,
              title: "Puerto Nariño",
              content:
                  'Puerto Nariño se encuentra ubicado a orillas del río Loretoyacu, un afluente del Amazonas. Es reconocido por su arquitectura colorida y su estilo de vida enfocado en la armonía con la naturaleza. El municipio es un ejemplo de sostenibilidad, con iniciativas de manejo de residuos y proyectos de conservación de la flora y fauna locales. Los visitantes pueden disfrutar de caminatas por senderos ecológicos, avistamiento de aves, y la observación de la rica biodiversidad del área. Además, es posible visitar comunidades indígenas cercanas, donde se puede aprender sobre sus tradiciones y formas de vida.\n',
              imagePaths: [
                'assets/AmazonasPh/puertonarino/17.jpg',
                'assets/AmazonasPh/puertonarino/26.jpg',
                'assets/AmazonasPh/puertonarino/14.jpg',
                'assets/AmazonasPh/puertonarino/3.jpg',
                'assets/AmazonasPh/puertonarino/20.jpg',
              ],
            ),
            informativeSection(
              context,
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
                'assets/AmazonasPh/puertonarino/8.jpg',
                'assets/AmazonasPh/puertonarino/4.jpg',
                'assets/AmazonasPh/puertonarino/19.jpg',
                'assets/AmazonasPh/puertonarino/20.jpg',
                'assets/AmazonasPh/puertonarino/11.jpg',
                'assets/AmazonasPh/aves/21.jpg',
              ],
            ),
            informativeSection(
              context,
              title: "Ubicación y Recomendación",
              content: 'Puerto Nariño es un destino ideal para aquellos interesados en el ecoturismo y en experiencias que promuevan la conciencia ambiental y cultural. \n'
              '\n\n Recomendaciones: llevar ropa adecuada, Protección contra Insectos, Vacunas, Botiquín de Primeros Auxilios\n',
              imagePaths: [],
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 10.0, bottom: 20.0),
                child: ElevatedButton(
                  onPressed: _launchGoogleMaps,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 0, 59, 31), // Color de fondo
                    foregroundColor: Colors.white, // Color de las letras
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: const Text('Abrir en Google Maps'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget informativeSection(BuildContext context, {
    required String title,
    required String content,
    List<String> imagePaths = const [],
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
          if (imagePaths.isNotEmpty)
            CarouselSlider(
              options: CarouselOptions(
                height: 200,
                enlargeCenterPage: true,
                autoPlay: false,
                aspectRatio: 16 / 9,
                enableInfiniteScroll: false,
                viewportFraction: 0.8,
              ),
              items: imagePaths.map((imagePath) {
                return Builder(
                  builder: (BuildContext context) {
                    return GestureDetector(
                      onTap: () => _showFullScreenImage(context, imagePath),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.50),
                              spreadRadius: 0.5,
                              blurRadius: 5,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(imagePath, fit: BoxFit.cover),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
        ],
      ),
    );
  }
}