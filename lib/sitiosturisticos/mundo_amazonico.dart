// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

class MundoAmazonico extends StatelessWidget {
  const MundoAmazonico({super.key});

  Future<void> _launchGoogleMaps() async {
    // URL proporcionada para la ubicación específica en Google Maps
    final Uri googleMapsUrl = Uri.parse("https://www.google.com/maps/place/Parque+Mundo+Amaz%C3%B3nico/@-4.1466996,-69.9333659,17z/data=!3m1!4b1!4m6!3m5!1s0x91f2f63e1b455625:0x5e7e23275c8b804!8m2!3d-4.146705!4d-69.930791!16s%2Fg%2F1tdk67gk?entry=ttu");

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
        title: const Text('Parque Mundo Amazónico'),
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
                  'assets/AmazonasPh/aventurasenlaselva/1.jpg',
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
              title: "Parque Ecológico Mundo Amazónico",
              content:
              'es un destino educativo y recreativo situado cerca de Leticia, en la región amazónica de Colombia. Este parque ofrece a los visitantes la oportunidad de aprender sobre la rica biodiversidad del Amazonas, sus ecosistemas, y la importancia de la conservación ambiental a través de experiencias interactivas y didácticas. \n',
              imagePaths: [
                'assets/AmazonasPh/aventurasenlaselva/18.jpg',
                "assets/AmazonasPh/aventurasenlaselva/14.jpg",
                "assets/AmazonasPh/aventurasenlaselva/17.jpg",
                'assets/AmazonasPh/Rio/5.jpg',
              ],
            ),
            informativeSection(
              context,
              title: "Actividades",
              content:
                  '1. Recorridos Educativos'
                  '\n\n 2. Jardín Botánico'
                  '\n\n 3. Acuario de Peces Amazónicos'
                  '\n\n 4. Mariposario'
                  '\n\n 5. Talleres y Charlas Educativas \n\n',

              imagePaths: [
                "assets/AmazonasPh/aventurasenlaselva/7.jpg",
                "assets/AmazonasPh/aventurasenlaselva/1.jpg",
                "assets/AmazonasPh/aves/22.jpg",
              ],
            ),
            informativeSection(
              context,
              title: 'Ubicación y Recomendación',
              content:
              'Preparación: Dado el clima húmedo y tropical del Amazonas, se recomienda llevar ropa ligera y cómoda, protector solar, repelente de insectos, y una botella de agua reutilizable. También es aconsejable usar calzado adecuado para caminar por senderos naturales. \n\n'
              'El Parque Ecológico Mundo Amazónico no solo es un lugar para el ocio y la educación, sino también un espacio que promueve la conciencia sobre la importancia de proteger uno de los ecosistemas más vitales y diversos del planeta. Visitar este parque es una experiencia enriquecedora que ofrece valiosas lecciones sobre el medio ambiente, la biodiversidad, y la sostenibilidad.\n',
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