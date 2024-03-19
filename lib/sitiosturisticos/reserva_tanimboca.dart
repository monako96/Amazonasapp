// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

class ReservaTanimboca extends StatelessWidget {
  const ReservaTanimboca({super.key});

  Future<void> _launchGoogleMaps() async {
    // Coordenadas del Parque Santander en Leticia.
    const double latitude = -4.2078895;
    const double longitude = -69.9446021;
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
        title: const Text('Reserva Natural Tanimboca'),
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
              title: "Reserva Natural Tanimboca",
              content:
                'se encuentra en las afueras de Leticia, Amazonas, Colombia, y es un destino destacado para quienes buscan aventuras en la selva amazónica. Ofrece una variedad de actividades enfocadas en la apreciación de la naturaleza y la aventura, en un entorno que promueve la conservación y el respeto por el ecosistema amazónico.\n',
              imagePaths: [
                "assets/paisajes/indigenas.jpg",
                "assets/paisajes/cultura.jpg",
                "assets/paisajes/mono.jpg",
              ],
            ),
            informativeSection(
              title: "Actividades",
              content:
                        'Los tours a Tanimboca incluyen aventuras de canopy, recorridos nocturnos para observación de fauna, y alojamiento en cabañas ubicadas en los árboles para aquellos que buscan una experiencia más prolongada y única en la selva.\n'
                  '\n\n 1. Canopy'
                  '\n\n 2. Senderismo Guiado'
                  '\n\n 3. Observación de Fauna Nocturna'
                  '\n\n 4. Alojamiento en Cabañas en los Árboles'
                  '\n\n 5. Kayak y Navegación en Ríos \n',
              imagePaths: [
                "assets/paisajes/cultura.jpg",
                "assets/paisajes/indigenas.jpg",
                "assets/paisajes/mono.jpg",
              ],
            ),
            informativeSection(
              title: "Ubicación y Recomendación",
              content: 'Visitar la Reserva Natural Tanimboca ofrece una oportunidad excepcional de conectarse con la naturaleza y aprender sobre la importancia de la conservación del Amazonas, todo mientras disfrutas de emocionantes actividades al aire libre..\n\n'
               'Preparación: Lleva ropa cómoda y adecuada para la humedad y el calor de la selva. Incluye botas de trekking o zapatos cerrados, repelente de insectos, protector solar y una botella de agua reutilizable.\n\n'
                'Salud: Asegúrate de estar al día con las vacunas recomendadas para viajar al Amazonas y consulta con tu médico sobre la prevención de la malaria y otras enfermedades tropicales.\n',
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
