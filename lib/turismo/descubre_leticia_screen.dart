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
                  'assets/AmazonasPh/ParqueLoros/8.jpg',
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
                'assets/AmazonasPh/TresFronteras/2.jpg',
                'assets/AmazonasPh/aventurasenlaselva/3.jpg',
                "assets/paisajes/indigenas.jpg",
                'assets/AmazonasPh/aventurasenlaselva/1.jpg',
                'assets/AmazonasPh/aventurasenlaselva/2.jpg',

              ],
            ),
            informativeSection(
              context,
              title: "Información General",
              content:
                 'Ubicación: Leticia se encuentra en la triple frontera entre Colombia, Brasil y Perú, a orillas del río Amazonas.\n\n'
                ' Población: Aproximadamente 54,927habitantes.\n\n'
                'Clima: Tropical húmedo, con temperaturas promedio que varían entre 26°C y 30°C durante todo el año. La estación lluviosa es de diciembre a mayo, mientras que los meses más secos van de junio a noviembre.\n',

            ),
            informativeSection(
              context,
              title: "Cómo Llegar",
              content:
                'Leticia es accesible principalmente por aire, con vuelos directos desde Bogotá al Aeropuerto Internacional Alfredo Vásquez Cobo. Debido a su ubicación geográfica, Leticia no tiene conexiones terrestres con el resto de Colombia, lo que hace que el transporte aéreo sea la principal vía de acceso.\n\n',
              imagePaths: [
                "assets/AmazonasPh/TresFronteras/17.jpg",
                "assets/AmazonasPh/TresFronteras/18.jpg",
                "assets/AmazonasPh/TresFronteras/14.jpg",
                'assets/AmazonasPh/TresFronteras/4.jpg',
              ],
            ),
            informativeSection(
              context,
              title: "Recomendaciones para Visitantes",
              content:
                'Preparación: Dada su ubicación en la selva tropical, es esencial venir preparado con repelente de insectos, ropa ligera y adecuada para el clima húmedo, y protección solar.\n\n'
              'Vacunas: Se recomienda estar vacunado contra la fiebre amarilla antes de visitar Leticia, así como tener precauciones contra la malaria.\n\n'
              'Respeto por la Cultura y la Naturaleza: Al visitar comunidades indígenas y reservas naturales, es crucial mostrar respeto por las tradiciones locales y la biodiversidad. Sigue las normas de sostenibilidad y conservación.\n',

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