// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DescubreLeticiaScreen extends StatelessWidget {
  const DescubreLeticiaScreen({super.key});

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
        title: const Text('Descubre Leticia'),
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
              title: "Leticia - Amazonas",
              content:
                  'Leticia es la capital del departamento de Amazonas en Colombia, '
                  'ubicada en la triple frontera entre Colombia, Perú y Brasil. '
                  'Es conocida por ser una puerta de entrada al Amazonas, '
                  'ofreciendo una gran variedad de actividades ecoturísticas, '
                  'avistamiento de fauna y flora, y la oportunidad de experimentar '
                  'las culturas indígenas locales. \n',
              imagePaths: [
                "assets/paisajes/indigenas.jpg",
                "assets/paisajes/cultura.jpg",
                "assets/paisajes/mono.jpg",
              ],
            ),
            informativeSection(
              context,
              title: "Historia y Cultura",
              content:
                  "Explora la rica historia de Leticia y la diversidad cultural de sus pueblos indígenas. Descubre tradiciones ancestrales y la armonía con la naturaleza.\n",
              imagePaths: [
                "assets/paisajes/cultura.jpg",
                "assets/paisajes/indigenas.jpg",
                "assets/paisajes/mono.jpg",
              ],
            ),
            informativeSection(
              context,
              title: "Biodiversidad",
              content:
                  "Admira la impresionante biodiversidad del Amazonas. Desde avistamiento de aves hasta encuentros cercanos con la fauna silvestre, Leticia es un paraíso para los amantes de la naturaleza.\n",
              imagePaths: [
                "assets/paisajes/mono.jpg",
                "assets/paisajes/pesca.jpg",
                "assets/paisajes/rio.jpg",
              ],
            ),
            informativeSection(
              context,
              title: "Actividades Turísticas",
              content:
                  "Desde caminatas ecológicas hasta cruceros por el río Amazonas, Leticia ofrece una amplia gama de actividades turísticas para aventureros y familias.\n",
              imagePaths: [
                "assets/paisajes/rio.jpg",
                "assets/paisajes/pesca.jpg",
                "assets/paisajes/indigenas.jpg",
              ],
            ),
            informativeSection(
              context,
              title: "Consejos de Viaje",
              content:
                  "Prepárate para tu viaje a Leticia con consejos útiles sobre cómo llegar, qué llevar y cómo hacer de tu estancia una experiencia inolvidable.\n",
              imagePaths: [
                "assets/paisajes/choza.jpg",
                "assets/paisajes/cultura.jpg",
                "assets/paisajes/indigenas.jpg",
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