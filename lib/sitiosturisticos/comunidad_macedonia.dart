// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

class ComunidadMacedonia extends StatelessWidget {
  const ComunidadMacedonia({super.key});

  Future<void> _launchGoogleMaps() async {
    // Coordenadas del Parque Santander en Leticia.
    const double latitude = -3.8874185;
    const double longitude = -70.1996757;
    // Intenta abrir en la aplicación Google Maps.
    final Uri googleMapsSchemeUrl = Uri.parse("geo:$latitude,$longitude");
    final Uri googleMapsWebUrl  =  Uri.parse("https://www.google.com/maps/search/?api=1&query=$latitude,$longitude");

    if (await canLaunchUrl(googleMapsSchemeUrl)) {
      await launchUrl(googleMapsSchemeUrl);
    } else if (await canLaunchUrl(googleMapsWebUrl)) {
      // Si no se puede abrir en la app, intenta abrir en el navegador.
      await canLaunchUrl(googleMapsWebUrl );
    } else {
      throw 'No se pudo abrir el mapa.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comunidad Macedonia'),
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
              title: "Comunidad Indigena Macedonia",
              content:
                  'es un importante destino cultural y ecológico situado en la región amazónica de Colombia, cerca de Leticia. Esta comunidad pertenece principalmente al grupo étnico Tikuna, uno de los pueblos indígenas más grandes de la Amazonía. Visitar Macedonia permite a los viajeros adentrarse en las tradiciones y el modo de vida de los pueblos originarios de la Amazonía, ofreciendo una perspectiva única sobre la interacción entre el ser humano y la naturaleza en este entorno biodiverso.\n',

              imagePaths: [
                "assets/paisajes/indigenas.jpg",
                "assets/paisajes/cultura.jpg",
                "assets/paisajes/mono.jpg",
              ],
            ),
            informativeSection(
              title: "Actividades",
              content:
                   'Para llegar a Macedonia desde Leticia, los visitantes generalmente toman un viaje en bote por el río Amazonas, lo cual es una experiencia en sí misma, ofreciendo vistas impresionantes de la selva y la oportunidad de observar la vida a lo largo del río.\n'
                  '\n\n 1. Recorridos Culturales'
                  '\n\n 2. Talleres de Artesanía'
                  '\n\n 3. Visitas a Plantaciones Tradicionales'
                  '\n\n 4. Intercambio Lingüístico y Educativo\n',
              imagePaths: [
                "assets/paisajes/cultura.jpg",
                "assets/paisajes/indigenas.jpg",
                "assets/paisajes/mono.jpg",
              ],
            ),
            informativeSection(
              title: 'Ubicación y Recomendación',
              content:
                  'Visitar la Comunidad Indígena de Macedonia no solo es una oportunidad para aprender sobre la cultura Tikuna, sino también para reflexionar sobre la importancia de la conservación ambiental y el respeto a las culturas indígenas. Esta experiencia ofrece una perspectiva invaluable sobre la vida en la Amazonía y el valioso conocimiento que los pueblos indígenas tienen sobre la biodiversidad y la sostenibilidad.\n\n'
              ' La región amazónica es caliente y húmeda, por lo que es recomendable llevar ropa ligera y transpirable, protector solar, repelente de insectos y agua potable para mantenerte hidratado durante tu visita.',
              imagePaths: [],
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
          const SizedBox(height: 10),
          Text(
            content,
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 16),
          ),
          if (title == "Ubicación y Recomendación") // Condición para añadir el botón solo en la sección "Cómo llegar"
    Center(
      child: ElevatedButton(
              onPressed: _launchGoogleMaps,
              child: const Text('Abrir en Google Maps'),
            ),
    ),
          const SizedBox(height: 10),
          CarouselSlider(
            options: CarouselOptions(
              height: 200,
              enlargeCenterPage: true,
              autoPlay: false,
              aspectRatio: 16 / 9,
              enableInfiniteScroll: false,
              viewportFraction: 0.8,
            ),
            items: imagePaths.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.50),
                          spreadRadius: 0.5,
                          blurRadius: 5,
                          offset: const Offset(0, 10), // changes position of shadow
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
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
