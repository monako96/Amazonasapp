// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

class LagoTarapoto extends StatelessWidget {
  const LagoTarapoto({super.key});

  Future<void> _launchGoogleMaps() async {
    // URL proporcionada para la ubicación específica en Google Maps
    final Uri googleMapsUrl = Uri.parse("https://www.google.com/maps/place/Lago+Tarapoto/@-3.8029918,-70.4239169,17z/data=!3m1!4b1!4m6!3m5!1s0x91f20a85bb3ff979:0x40f5c78ef7bf8261!8m2!3d-3.8029972!4d-70.421342!16s%2Fg%2F11dzt3svjy?entry=ttu");

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
        title: const Text('Lago Tarapoto'),
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
                  'assets/AmazonasPh/puertonarino/22.jpg',
                  fit: BoxFit.cover,
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                ),
                const Text(
                  'Bienvenidos al Amazonas',
                  style: TextStyle(
                    fontSize: 25,
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
              title: "Lago Torapoto",
              content:
              'El Lago Tarapoto es una maravilla natural ubicada cerca de Puerto Nariño, en la región amazónica de Colombia. Este lago es famoso por su biodiversidad, especialmente por ser el hábitat de los delfines rosados y grises, y por su rica vegetación acuática y terrestre. La visita al Lago Tarapoto ofrece una experiencia única de ecoturismo y aventura, permitiendo a los visitantes conectar de cerca con la naturaleza virgen del Amazonas.\n',
              imagePaths: [
                "assets/AmazonasPh/Rio/3.jpg",
                "assets/AmazonasPh/Rio/4.jpg",
                "assets/AmazonasPh/aves/31.jpg",
                "assets/AmazonasPh/Rio/7.jpg",
                "assets/AmazonasPh/puertonarino/12.jpg",

              ],
            ),
            informativeSection(
              context,
              title: "Actividades",
              content:
              'Los tours al Lago Tarapoto suelen partir desde Leticia o directamente desde Puerto Nariño. Estos pueden variar en duración, desde excursiones de medio día hasta aventuras de varios días que incluyen estancias en casas cercanos al lago. Los tours generalmente incluyen,'
                  '\n\n 1. Transporte en bote'
                  '\n\n 2. Avistamiento de delfines'
                  '\n\n 3. Pesca artesanal'
                  '\n\n 4. Caminatas ecológicas'
                  '\n\n 5. Visitas a comunidades indígenas:'
                  '\n\n 6. Kayak y canotaje: \n',
              imagePaths: [
                "assets/AmazonasPh/Rio/9.jpg",
                "assets/AmazonasPh/puertonarino/18.jpg",
                "assets/AmazonasPh/puertonarino/19.jpg",
                "assets/AmazonasPh/Rio/8.jpg",

              ],
            ),
            informativeSection(
              context,
              title: "Ubicación y Recomendación",
              content:
              'Recomendaciones para los Visitantes '
                  'Respeto por la naturaleza: Es crucial seguir las instrucciones de los guías y respetar las normas de conservación para minimizar el impacto en el ecosistema \n\n '
                  'Preparación: Llevar ropa adecuada para el clima húmedo y tropical, protector solar, repelente de insectos, y agua potable.'
                  'Documentación: Asegurarse de llevar toda la documentación necesaria, especialmente si el tour implica cruzar fronteras internacionales (por ejemplo, hacia Perú).\n',
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
      padding: const EdgeInsets.all(10),
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