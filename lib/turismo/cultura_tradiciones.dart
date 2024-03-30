// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CulturaTradiciones extends StatelessWidget {
  const CulturaTradiciones({super.key});

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
        title: const Text('Cultura y Tradiciones'),
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
                  "assets/paisajes/indigenas.jpg",
                  fit: BoxFit.cover,
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                ),
                const Text(
                  'CULTURA AMAZONICAS',
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
              title: 'Cultura y Tradicion',
              content:
                  'Leticia es una ciudad multicultural, enriquecida por la unión de diversas culturas y '
                  'tradiciones debido a su ubicación en la triple frontera con Brasil y Perú. su gastronomía '
                  'fusiona sabores de la triple frontera, se celebran festivales donde comparten diversas '
                  'culturas tanto tradicionales como locales.',
              imagePaths: [
                'assets/AmazonasPh/TresFronteras/19.jpg',
                'assets/AmazonasPh/TresFronteras/2.jpg',
                'assets/AmazonasPh/TresFronteras/21.jpg',
                'assets/AmazonasPh/TresFronteras/20.jpg',
                'assets/AmazonasPh/TresFronteras/8.jpg',
                'assets/AmazonasPh/TresFronteras/16.jpg',
                'assets/AmazonasPh/TresFronteras/12.jpg',

              ],
            ),
            informativeSection(
              context,
              title: "Cultura Indígena",
              content:
                  "Leticia destaca por su sorprendente diversidad étnica, reflejada en sus tradicionales bailes, ricos dialectos y una gastronomía única. Entre los dialectos más hablados se encuentran el Tikuna, Huitoto y Cocama. Sus bailes culturales, como el Yurupary, el Baile de Muñeco y el Baile de Chontaduro. En su gastronomía tenemos la fariña, el casabe, el tucupi, pescados y el mojojoy, destacando la riqueza culinaria de la región.",
              imagePaths: [
                "assets/paisajes/cultura.jpg",
                "assets/paisajes/indigenas.jpg",
                "assets/AmazonasPh/aventurasenlaselva/20.jpg",
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