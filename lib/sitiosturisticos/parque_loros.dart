// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

class Parqueloros extends StatelessWidget {
  const Parqueloros({super.key});

  Future<void> _launchGoogleMaps() async {
    // URL proporcionada para la ubicación específica en Google Maps
    final Uri googleMapsUrl = Uri.parse("https://www.google.com/maps/place/Parque+Santander/@-4.2119555,-69.9428655,18.5z/data=!4m6!3m5!1s0x91f2f14d89ec42f7:0x44779675c54374b6!8m2!3d-4.2126354!4d-69.9429974!16s%2Fg%2F1vwlq5qq?entry=ttu");

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
        title: const Text('Parque de los loros'),
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
                  'assets/AmazonasPh/ParqueLoros/1.jpg',
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
              title: "Parque de los loros",
              content:
              'Ubicado en el centro de Leticia o también llamado parque Santander, este parque es un punto de encuentro tanto para locales como para turistas. Al atardecer, se convierte en un espectáculo natural cuando cientos de loros llegan para pasar la noche.\n',
              imagePaths: [
                "assets/AmazonasPh/ParqueLoros/2.jpg",
                "assets/AmazonasPh/ParqueLoros/3.jpg",
                "assets/AmazonasPh/ParqueLoros/4.jpg",
                "assets/AmazonasPh/ParqueLoros/5.jpg",
                "assets/AmazonasPh/ParqueLoros/6.jpg",
              ],
            ),
            informativeSection(
              context,
              title: "Actividades",
              content:
              'Aunque a primera vista pueda parecer un parque urbano común, ofrece una serie de actividades y experiencias únicas que lo convierten en un punto de interés especial para quienes visitan la región amazónica de Colombia.'
                  '\n\n 1. Observación de Loros al Atardecer'
                  '\n\n 2. Caminatas y Relajación'
                  '\n\n 3. Interacción con la Comunidad Local'
                  '\n\n 4. Compras de Artesanías'
                  '\n\n 5. Disfrutar de la Gastronomía Local'
                  '\n\n 6. Eventos Culturales y Festivales'
                  '\n\n 7. Fotografía \n',
              imagePaths: [
                "assets/AmazonasPh/ParqueLoros/7.jpg",
                "assets/AmazonasPh/ParqueLoros/8.jpg",
                "assets/AmazonasPh/ParqueLoros/9.jpg",
                "assets/AmazonasPh/ParqueLoros/1.jpg",

              ],
            ),
            informativeSection(
              context,
              title: "Ubicación",
              content: 'El parque de los loros queda en toda la parte centrar de Leticia amazonas, al frente de la iglesia central',
              imagePaths: [], // Si no hay imágenes para esta sección, deja la lista vacía
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