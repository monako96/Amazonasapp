// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class AventurasSelvaScreen extends StatelessWidget {
  const AventurasSelvaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aventuras en la Selva de Leticia'),
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
              context,
              title: "Aventuras en la Selva de Leticia",
              content:
              'Sumérgete en el corazón del Amazonas y vive experiencias inolvidables en la selva de Leticia. '
                  'Desde la inmensidad de su biodiversidad hasta la riqueza cultural de sus comunidades indígenas, '
                  'cada aventura te espera con historias únicas por descubrir.',
              imagePaths: [
                "assets/AmazonasPh/aventurasenlaselva/serpiente.jpg",
                "assets/AmazonasPh/aventurasenlaselva/rana.jpg",
                "assets/AmazonasPh/aventurasenlaselva/cocodrillo.jpg",
              ],
            ),
            _buildExpansionTile(
              context,
              title: "Observación de Fauna Nocturna",
              content:
              "Explora senderos llenos de vida y naturaleza, descubre la flora y fauna únicas de la selva amazónica.",
              imagePaths: [
                "assets/paisajes/indigenas.jpg",
                "assets/paisajes/cultura.jpg",
                "assets/paisajes/mono.jpg",
              ],
            ),
            _buildExpansionTile(
              context,
              title: "Avistamiento de Fauna",
              content:
              "Explora senderos llenos de vida y naturaleza, descubre la flora y fauna únicas de la selva amazónica.",
              imagePaths: [
                "assets/paisajes/indigenas.jpg",
                "assets/paisajes/cultura.jpg",
                "assets/paisajes/mono.jpg",
              ],
            ),
            _buildExpansionTile(
              context,
              title: "Visitas a Comunidades Indígenas",
              content:
              "Explora senderos llenos de vida y naturaleza, descubre la flora y fauna únicas de la selva amazónica.",
              imagePaths: [
                "assets/paisajes/indigenas.jpg",
                "assets/paisajes/cultura.jpg",
                "assets/paisajes/mono.jpg",
              ],
            ),
            _buildExpansionTile(
              context,
              title: "Avistamiento de Fauna",
              content:
              "Explora senderos llenos de vida y naturaleza, descubre la flora y fauna únicas de la selva amazónica.",
              imagePaths: [
                "assets/paisajes/indigenas.jpg",
                "assets/paisajes/cultura.jpg",
                "assets/paisajes/mono.jpg",
              ],
            ),
            _buildExpansionTile(
              context,
              title: "Avistamiento de Fauna",
              content:
              "Explora senderos llenos de vida y naturaleza, descubre la flora y fauna únicas de la selva amazónica.",
              imagePaths: [
                "assets/paisajes/indigenas.jpg",
                "assets/paisajes/cultura.jpg",
                "assets/paisajes/mono.jpg",
              ],
            ),
            // Repite _buildExpansionTile para otras secciones como sea necesario
          ],
        ),
      ),
    );
  }

  Widget informativeSection(
      BuildContext context, {
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
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            content,
            textAlign: TextAlign.justify,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 10),
          CarouselSlider(
            options: CarouselOptions(
              height: 200,
              enlargeCenterPage: true,
              autoPlay: false,
              aspectRatio: 16 / 9,
              enableInfiniteScroll: false,
              viewportFraction: 0.9,
            ),
            items: imagePaths.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return GestureDetector(
                    onTap: () => _showFullScreenImage(context, i),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin:  EdgeInsets.symmetric(horizontal: 5.0),
                      decoration:  BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.50),
                            spreadRadius: 0.5,
                            blurRadius: 5,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(i, fit: BoxFit.cover),
                      ),
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

  Widget _buildExpansionTile(
      BuildContext context, {
        required String title,
        required String content,
        required List<String> imagePaths,
      }) {
    return ExpansionTile(
      title: Text(title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                content,
                textAlign: TextAlign.justify,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              CarouselSlider(
                options: CarouselOptions(
                  height: 200,
                  enlargeCenterPage: true,
                  autoPlay: false,
                  aspectRatio: 16 / 9,
                  enableInfiniteScroll: false,
                  viewportFraction: 0.9,
                ),
                items: imagePaths.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return GestureDetector(
                        onTap: () => _showFullScreenImage(context, i),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin:  EdgeInsets.symmetric(horizontal: 5.0),
                          decoration:  BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.50),
                                spreadRadius: 0.5,
                                blurRadius: 5,
                                offset: Offset(0, 10),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(i, fit: BoxFit.cover),
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
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
}