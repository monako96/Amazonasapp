// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

class ReservaTanimboca extends StatelessWidget {
  const ReservaTanimboca({super.key});

  Future<void> _launchGoogleMaps() async {
    // URL proporcionada para la ubicación específica en Google Maps
    final Uri googleMapsUrl = Uri.parse("https://www.google.com/maps/place/Tanimboca/@-4.1280606,-69.9558315,17z/data=!4m6!3m5!1s0x91f258ab68d897bd:0x73e291c8205691aa!8m2!3d-4.128066!4d-69.9532566!16s%2Fg%2F11g8nwj7hj?entry=ttu");

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
        title: const Text('Reserva Natural Tanimboca'),
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
                  'assets/AmazonasPh/Rio/5.jpg',
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
              title: "Reserva Natural Tanimboca",
              content:
                'se encuentra en las afueras de Leticia, Amazonas, Colombia, y es un destino destacado para quienes buscan aventuras en la selva amazónica. Ofrece una variedad de actividades enfocadas en la apreciación de la naturaleza y la aventura, en un entorno que promueve la conservación y el respeto por el ecosistema amazónico.\n',
              imagePaths: [
                "assets/AmazonasPh/aventurasenlaselva/12.jpg",
                "assets/AmazonasPh/aventurasenlaselva/14.jpg",
                "assets/AmazonasPh/aventurasenlaselva/10.jpg",
                'assets/AmazonasPh/aventurasenlaselva/19.jpg',
                'assets/AmazonasPh/aventurasenlaselva/7.jpg',
              ],
            ),
            informativeSection(
              context,
              title: "Actividades",
              content:
                        'Los tours a Tanimboca incluyen aventuras de canopy, recorridos nocturnos para observación de fauna, y alojamiento en cabañas ubicadas en los árboles para aquellos que buscan una experiencia más prolongada y única en la selva.\n'
                  '\n\n 1. Canopy'
                  '\n\n 2. Senderismo Guiado'
                  '\n\n 3. Observación de Fauna Nocturna'
                  '\n\n 4. Alojamiento en Cabañas en los Árboles'
                  '\n\n 5. Kayak y Navegación en Ríos \n',
              imagePaths: [
                "assets/AmazonasPh/aventurasenlaselva/18.jpg",
                "assets/AmazonasPh/Rio/1.jpg",
                "assets/AmazonasPh/Rio/2.jpg",
                "assets/AmazonasPh/aventurasenlaselva/15.jpg",
              ],
            ),
            informativeSection(
              context,
              title: "Ubicación y Recomendación",
              content: 'Visitar la Reserva Natural Tanimboca ofrece una oportunidad excepcional de conectarse con la naturaleza y aprender sobre la importancia de la conservación del Amazonas, todo mientras disfrutas de emocionantes actividades al aire libre..\n\n'
               'Preparación: Lleva ropa cómoda y adecuada para la humedad y el calor de la selva. Incluye botas de trekking o zapatos cerrados, repelente de insectos, protector solar y una botella de agua reutilizable.\n\n'
                'Salud: Asegúrate de estar al día con las vacunas recomendadas para viajar al Amazonas y consulta con tu médico sobre la prevención de la malaria y otras enfermedades tropicales.\n',
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