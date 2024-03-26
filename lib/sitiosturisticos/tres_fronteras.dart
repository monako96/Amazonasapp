// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

class TresFronteras extends StatelessWidget {
  const TresFronteras({super.key});

  Future<void> _launchGoogleMaps() async {
    // Coordenadas del Parque Santander en Leticia.
    const double latitude = -4.21933;
    const double longitude = -69.935817;
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
        title: const Text('Tres Fronteras'),
        backgroundColor: Color.fromARGB(255, 0, 59, 31),
        iconTheme: IconThemeData(
          color: Colors.white, // Cambia el color de la flecha de devolver aquí si es necesario
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
              context,
              title: "Tres Fronteras",
              content:
              'Este punto de encuentro de los tres países \n(Colombia, Perú, y Brasil) es único. Los visitantes pueden disfrutar de las vistas, la cultura y la gastronomía de las tres naciones casi simultáneamente.\n',
              imagePaths: [
                "assets/AmazonasPh/TresFronteras/2.jpg",
                "assets/AmazonasPh/TresFronteras/3.jpg",
                "assets/AmazonasPh/TresFronteras/4.jpg",
                "assets/AmazonasPh/TresFronteras/5.jpg",
                "assets/AmazonasPh/TresFronteras/7.jpg",
                "assets/AmazonasPh/TresFronteras/8.jpg",
                "assets/AmazonasPh/TresFronteras/9.jpg",
              ],
            ),
            informativeSection(
              context,
              title: "Actividades",
              content:
              'Este lugar único ofrece a los visitantes una variedad de actividades culturales, naturales, y recreativas, permitiendo experimentar la diversidad de la región amazónica desde un solo punto. Estas son algunas actividades que se pueden realizar en y alrededor del Tours Tres Fronteras :'
                  '\n\n 1. Visita a los Monumentos de Tres Fronteras'
                  '\n\n 2. Exploración de las Tres Culturas'
                  '\n\n 3. Paseos en Bote por el Río Amazonas'
                  '\n\n 4. Observación de la Fauna y Flora'
                  '\n\n 5. Compras en Mercados Locales'
                  '\n\n 6. Gastronomía Regional'
                  '\n\n 7. Actividades Recreativas en el Río \n',
              imagePaths: [
                "assets/AmazonasPh/TresFronteras/1.jpg",
                "assets/paisajes/indigenas.jpg",
                "assets/paisajes/mono.jpg",
                "assets/AmazonasPh/TresFronteras/10.jpg",
                "assets/AmazonasPh/TresFronteras/11.jpg",
                "assets/AmazonasPh/TresFronteras/12.jpg",
                'assets/AmazonasPh/TresFronteras/14.jpg',
              ],
            ),
            informativeSection(
              context,
              title: "Ubicación",
              content: 'EL punto de encuentro para hacer el Tours tres frontera es por la avenida internacional en toda la frontera que divide a colombia con brasil.\n\n'
                  'Recomendación: cambiar divisas a reales brasileños (BRL) para realizar compras en Brasil y, sorprendentemente, también en Perú, cerca de las zonas fronterizas con Leticia\n',
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