// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class RioAmazonas extends StatelessWidget {
  const RioAmazonas({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rio Amazonas'),
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
              title: "Leticia - Amazonas",
              content:
                  'Leticia es la capital del departamento de Amazonas en Colombia, '
                  'ubicada en la triple frontera entre Colombia, Perú y Brasil. '
                  'Es conocida por ser una puerta de entrada al Amazonas, '
                  'ofreciendo una gran variedad de actividades ecoturísticas, '
                  'avistamiento de fauna y flora, y la oportunidad de experimentar '
                  'las culturas indígenas locales.',
              imagePaths: [
                "assets/paisajes/indigenas.jpg",
                "assets/paisajes/cultura.jpg",
                "assets/paisajes/mono.jpg",
              ],
            ),
            informativeSection(
              title: "Historia y Cultura",
              content:
                  "Explora la rica historia de Leticia y la diversidad cultural de sus pueblos indígenas. Descubre tradiciones ancestrales y la armonía con la naturaleza.",
              imagePaths: [
                "assets/paisajes/cultura.jpg",
                "assets/paisajes/indigenas.jpg",
                "assets/paisajes/mono.jpg",
              ],
            ),
            informativeSection(
              title: "Biodiversidad",
              content:
                  "Admira la impresionante biodiversidad del Amazonas. Desde avistamiento de aves hasta encuentros cercanos con la fauna silvestre, Leticia es un paraíso para los amantes de la naturaleza.",
              imagePaths: [
                "assets/paisajes/mono.jpg",
                "assets/paisajes/pesca.jpg",
                "assets/paisajes/rio.jpg",
              ],
            ),
            informativeSection(
              title: "Actividades Turísticas",
              content:
                  "Desde caminatas ecológicas hasta cruceros por el río Amazonas, Leticia ofrece una amplia gama de actividades turísticas para aventureros y familias.",
              imagePaths: [
                "assets/paisajes/rio.jpg",
                "assets/paisajes/pesca.jpg",
                "assets/paisajes/indigenas.jpg",
              ],
            ),
            informativeSection(
              title: "Consejos de Viaje",
              content:
                  "Prepárate para tu viaje a Leticia con consejos útiles sobre cómo llegar, qué llevar y cómo hacer de tu estancia una experiencia inolvidable.",
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

  Widget informativeSection({
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
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            content,
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
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
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.50),
                          spreadRadius: 0.5,
                          blurRadius: 5,
                          offset: Offset(0, 10), // changes position of shadow
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(i, fit: BoxFit.cover),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
