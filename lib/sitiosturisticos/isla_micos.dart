// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

class IslaMicos extends StatelessWidget {
  const IslaMicos({super.key});

  Future<void> _launchGoogleMaps() async {
    // URL proporcionada para la ubicación específica en Google Maps
    final Uri googleMapsUrl = Uri.parse("https://www.google.com/maps/place/Isla+de+los+Micos/@-4.0415924,-70.1040605,17z/data=!3m1!4b1!4m6!3m5!1s0x91f266de5701d9ef:0x9bdbb054a02fabd!8m2!3d-4.0415978!4d-70.1014856!16s%2Fg%2F11bvvzrsfr?entry=ttu");

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
        title: const Text('Isla de los Micos'),
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
                  'assets/AmazonasPh/aves/13.jpg',
                  fit: BoxFit.cover,
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                ),
                const Text(
                  'Bienvenidos al Amazonas',
                  style: TextStyle(
                    fontSize: 25,
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
            const SizedBox(height: 5),
            informativeSection(
              context,
              title: "Isla de los Micos",
              content:
              'La Isla de los Micos es un destino popular entre aquellos que visitan la región amazónica cerca de Leticia, Colombia. Esta isla ofrece una experiencia única de interacción con la naturaleza y la vida silvestre, particularmente con los monos ardilla, conocidos por su curiosidad y amabilidad hacia los humanos.\n',
              imagePaths: [
                'assets/AmazonasPh/aves/23.jpg',
                'assets/AmazonasPh/aves/24.jpg',
                "assets/AmazonasPh/aves/37.jpg",
                'assets/AmazonasPh/aves/38.jpg',
                "assets/AmazonasPh/aves/8.jpg",
              ],
            ),
            informativeSection(
              context,
              title: "Actividades",
              content:
                ' Los tours generalmente comienzan temprano en la mañana y permiten a los visitantes alimentar a los monos bajo supervisión, garantizando una interacción respetuosa con la vida silvestre. También suelen incluir recorridos por los ríos cercanos\n'
                  '\n\n 1. Interacción con Monos Ardilla'
                  '\n\n 2. Observación de Fauna y Flora'
                  '\n\n 3. Fotografía de Vida Silvestre\n\n'
              'La Isla de los Micos se encuentra aproximadamente a 30 minutos en bote desde Leticia, dependiendo de las condiciones del río y del tipo de embarcación.\n',
              imagePaths: [
                "assets/AmazonasPh/aves/39.jpg",
                "assets/AmazonasPh/aves/13.jpg",
                "assets/AmazonasPh/aves/14.jpg",
                "assets/AmazonasPh/aves/17.jpg",
                "assets/AmazonasPh/aves/16.jpg",
              ],
            ),
            informativeSection(
              context,
              title: "Ubicación y Recomendación",
              content: 'Mejor Momento para Visitar: Los tours a la Isla de los Micos suelen comenzar temprano en la mañana cuando los monos están más activos y hay menos calor, lo que hace de esta parte del día el momento ideal para la visita.\n',
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
      padding: const EdgeInsets.all(16),
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
                viewportFraction: 0.8, // Usa todo el ancho del viewport
              ),
              items: imagePaths.map((imagePath) {
                return Builder(
                  builder: (BuildContext context) {
                    return GestureDetector(
                      onTap: () => _showFullScreenImage(context, imagePath),
                      child: Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        // Elimina el margen para que las imágenes ocupen todo el ancho posible
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0),
                              spreadRadius: 0,
                              blurRadius: 0,
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