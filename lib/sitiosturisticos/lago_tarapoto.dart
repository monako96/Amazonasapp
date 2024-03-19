// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

class LagoTarapoto extends StatelessWidget {
  const LagoTarapoto({super.key});

  Future<void> _launchGoogleMaps() async {
    // Coordenadas del Parque Santander en Leticia.
    const double latitude = -4.2126354;
    const double longitude = -69.9429974;
// Intenta abrir en la aplicación Google Maps.
    final Uri googleMapsSchemeUrl = Uri.parse("geo:$latitude,$longitude");
    final Uri googleMapsWebUrl = Uri.parse("https://www.google.com/maps/search/?api=1&query=$latitude,$longitude");

    if (await canLaunchUrl(googleMapsSchemeUrl)) {
      await launchUrl(googleMapsSchemeUrl);
    } else if (await canLaunchUrl(googleMapsWebUrl)) {
      // Si no se puede abrir en la app, intenta abrir en el navegador.
      await canLaunchUrl(googleMapsWebUrl );
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
        title: const Text('Tres Fronteras'),
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
              title: "Lago Torapoto",
              content:
              'El Lago Tarapoto es una maravilla natural ubicada cerca de Puerto Nariño, en la región amazónica de Colombia. Este lago es famoso por su biodiversidad, especialmente por ser el hábitat de los delfines rosados y grises, y por su rica vegetación acuática y terrestre. La visita al Lago Tarapoto ofrece una experiencia única de ecoturismo y aventura, permitiendo a los visitantes conectar de cerca con la naturaleza virgen del Amazonas.\n',
              imagePaths: [
                "assets/paisajes/indigenas.jpg",
                "assets/paisajes/cultura.jpg",
                "assets/paisajes/mono.jpg",
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
                "assets/paisajes/cultura.jpg",
                "assets/paisajes/indigenas.jpg",
                "assets/paisajes/mono.jpg",
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
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text('Abrir en Google Maps'),
                ),
              ),
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