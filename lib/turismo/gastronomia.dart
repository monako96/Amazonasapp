// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class GastronomiaAmazonas extends StatelessWidget {
  const GastronomiaAmazonas({super.key});

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
        title: const Text('Gastronomia Amazonica'),
        backgroundColor: Color.fromARGB(255, 0, 59, 31),
        iconTheme: IconThemeData(
          color: Colors
              .white, // Cambia el color de la flecha de devolver aquí si es necesario
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
                  'assets/AmazonasPh/aves/34.jpg',
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
              title: "Gastronomia Amazonica",
              content:
                  'La gastronomía amazónica es un reflejo de la rica biodiversidad de la selva y las tradiciones culturales de sus pueblos indígenas y comunidades locales. Esta cocina se caracteriza por el uso de ingredientes frescos, exóticos y a menudo únicos de la región, ofreciendo sabores que no se encuentran en ninguna otra parte del mundo. \n',
              imagePaths: [
                "assets/AmazonasPh/aves/32.jpg",
                "assets/AmazonasPh/aves/33.jpg",
                "assets/AmazonasPh/aves/34.jpg",
              ],
            ),
            informativeSection(
              context,
              title: "Platos principales",
              content:
              'En Leticia, Amazonas, la gastronomía refleja la rica biodiversidad de la selva y la fusión de culturas indígenas, colombianas, brasileñas y peruanas. Aquí te presento algunos de los platos principales que puedes degustar en Leticia, ofreciendo una muestra de la rica paleta de sabores amazónicos:\n\n'
                  ' 1. Pescados de Río'
                  ' 2. chicharrón de pirarucú\n\n'
                  ' 3. beiju\n\n'
                  ' 3. Tacacho\n\n'
                  ' 4. beiju\n\n'
                  ' 5. Mojojoi\n\n'


                  'La Isla de los Micos se encuentra aproximadamente a 30 minutos en bote desde Leticia, dependiendo de las condiciones del río y del tipo de embarcación.\n',
              imagePaths: [
                "assets/AmazonasPh/aves/35.jpg",
                "assets/AmazonasPh/aves/36.jpg",
                "assets/AmazonasPh/aves/26.jpg",
              ],
            ),
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
