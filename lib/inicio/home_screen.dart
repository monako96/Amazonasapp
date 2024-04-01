// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:appamazonas/opciones/eventos_leticia.dart';
import 'package:appamazonas/opciones/hoteles_leticia.dart';
import 'package:appamazonas/turismo/artesanias.dart';
import 'package:appamazonas/turismo/rioamazonas.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:appamazonas/turismo/descubre_leticia_screen.dart';
import 'package:appamazonas/turismo/aventura_selva.dart';
import 'package:appamazonas/turismo/cultura_tradiciones.dart';
import 'package:appamazonas/turismo/gastronomia.dart';
import '../sitiosturisticos/sitios_turisticos.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leticia - Amazonas'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            WelcomeBanner(),
            SizedBox(height: 16),
            CategoriesSection(),
            FeaturedCarousel(),
            SizedBox(height: 20),
            CategoryGrid(),
          ],
        ),
      ),
    );
  }
}

class WelcomeBanner extends StatelessWidget {
  const WelcomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          'assets/paisajes/victoria.jpg',
          fit: BoxFit.cover,
          height: 150,
          width: MediaQuery.of(context).size.width,
        ),
        const Text(
          '\nBienvenidos al Amazonas',
          style: TextStyle(
            fontSize: 30,
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
    );
  }
}

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CategoryItem(
            imagePath: 'assets/AmazonasPh/portadas/t.png',
            title: 'Turismo',
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SitiosTuris())),
          ),
          CategoryItem(
            imagePath: 'assets/AmazonasPh/portadas/c.png',
            title: 'Cultura',
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CulturaTradiciones())),
          ),
          CategoryItem(
            imagePath: 'assets/AmazonasPh/portadas/e.png',
            title: 'Eventos',
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const EventosScreen())),
          ),
          CategoryItem(
            imagePath: 'assets/AmazonasPh/portadas/h.png',
            title: 'Hoteles',
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HotelesScreen())),
          ),
         // CategoryItem(
           // imagePath: 'assets/AmazonasPh/portadas/a.png',
          //  title: 'Actividades',
          //  onTap: () => Navigator.push(context,
//MaterialPageRoute(builder: (context) => const ActividadesScreen())),
//),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback onTap;

  const CategoryItem({
    super.key,
    required this.imagePath,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Usa MediaQuery para determinar el tamaño del dispositivo
    double screenWidth = MediaQuery.of(context).size.width;
    // Ajusta el tamaño y el espaciado de los elementos basándote en el tamaño de la pantalla
    double itemWidth = screenWidth / 4; // Ajusta este valor según necesites
    double avatarRadius = screenWidth < 600 ? 30 : 40; // Ejemplo de ajuste para tablets y móviles

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: itemWidth,
        padding: const EdgeInsets.symmetric(horizontal: 8), // Considera ajustar esto dinámicamente si es necesario
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: avatarRadius,
              backgroundImage: AssetImage(imagePath),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                //fontWeight: FontWeight.bold, // Aplica negrita al texto
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FeaturedCarousel extends StatelessWidget {
  const FeaturedCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(height: 180, autoPlay: true),
      items: [
        'assets/AmazonasPh/TresFronteras/10.jpg',
        'assets/AmazonasPh/TresFronteras/11.jpg',
        'assets/AmazonasPh/TresFronteras/9.jpg',
        'assets/AmazonasPh/TresFronteras/8.jpg',
        'assets/AmazonasPh/TresFronteras/7.jpg',

      ].map((imagePath) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Image.asset(imagePath, fit: BoxFit.cover),
            );
          },
        );
      }).toList(),
    );
  }
}

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {
        "image": "assets/AmazonasPh/ParqueLoros/8.jpg",
        "title": "Descubre Leticia",
        "onTap": () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const DescubreLeticiaScreen())),
      },
      {
        "image": "assets/paisajes/cultura.jpg",
        "title": "Aventuras en la Selva",
        "onTap": () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const AventurasSelvaScreen())),
      },
      {
        "image": "assets/paisajes/indigenas.jpg",
        "title": "Cultura y Tradiciones",
        "onTap": () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const CulturaTradiciones())),
      },
      {
        "image": "assets/AmazonasPh/aves/34.jpg",
        "title": "Gastronomía Amazónica",
        "onTap": () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const GastronomiaAmazonas())),
      },
      {
        "image": "assets/AmazonasPh/TresFronteras/1.jpg",
        "title": "Tours por el Río Amazonas",
        "onTap": () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const RioAmazonas())),
      },

      {
        "image": 'assets/AmazonasPh/artesanias/13.jpg',
        "title": "Artesanías Locales",
        "onTap": () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ArtesaniaAmazonas())),
      },

      // Añade aquí más categorías si es necesario
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.05,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: categories[index]["onTap"],
          child: Column(
            children: <Widget>[
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1.0, // Asegura que la imagen sea cuadrada
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(15.0), // Bordes redondeados aquí
                    child: Image.asset(categories[index]["image"]!,
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Text(categories[index]["title"]!),
            ],
          ),
        );
      },
    );
  }
}
