// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class AventurasSelvaScreen extends StatelessWidget {
  const AventurasSelvaScreen({super.key});

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
                  'assets/paisajes/cultura.jpg',
                  fit: BoxFit.cover,
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                ),
                const Text(
                  'Bienvenidos al Amazonas',
                  style: TextStyle(
                    fontSize:  25,
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
              title: "Aventuras en la Selva de Leticia",
              content:
              'Sumérgete en el corazón del Amazonas y vive experiencias inolvidables en la selva de Leticia. '
                  'Desde la inmensidad de su biodiversidad hasta la riqueza cultural de sus comunidades indígenas, '
                  'cada aventura te espera con historias únicas por descubrir.\n',
              imagePaths: [
                "assets/AmazonasPh/aventurasenlaselva/serpiente.jpg",
                "assets/AmazonasPh/aventurasenlaselva/rana.jpg",
                "assets/AmazonasPh/aventurasenlaselva/cocodrillo.jpg",
                'assets/AmazonasPh/Rio/2.jpg',
                'assets/AmazonasPh/aves/20.jpg',
                'assets/AmazonasPh/puertonarino/23.jpg',
                'assets/AmazonasPh/aves/11.jpg',
                'assets/AmazonasPh/aventurasenlaselva/19.jpg',
              ],
            ),
            informativeSection(
              context,
              title: "Actividades",
              content:
              'Las aventuras en la selva de Leticia, Amazonas, ofrecen experiencias únicas para los amantes de la naturaleza y la adrenalina. Aquí tienes algunas actividades de aventura que no te puedes perder:'
                  '\n\n 1. Caminatas por la selva'
                  '\n\n 2. Canopy y Tirolinas'
                  '\n\n 3. Kayak y Canotaje'
                  '\n\n 4. Pesca de Pirañas'
                  '\n\n 5. Visitas a Comunidades Indígenas'
                  '\n\n 6. Noches en la Selva'
                  '\n\n 7. Observación de Vida Silvestre  \n',
              imagePaths: [

                'assets/AmazonasPh/aves/12.jpg',
                'assets/AmazonasPh/aves/30.jpg',
                'assets/AmazonasPh/aves/31.jpg',
                'assets/AmazonasPh/aves/28.jpg',
                'assets/AmazonasPh/aves/18.jpg',
                'assets/AmazonasPh/aves/13.jpg',
                'assets/AmazonasPh/aves/8.jpg',

              ],
            ),
            // Repite _buildExpansionTile para otras secciones como sea necesario
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