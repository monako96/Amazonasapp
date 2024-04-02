// turismo.dart
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
// turismo.dart
import 'package:appamazonas/sitiosturisticos/parque_loros.dart';
import 'package:appamazonas/sitiosturisticos/puerto_narino.dart';
import 'package:appamazonas/sitiosturisticos/reserva_tanimboca.dart';
import 'package:appamazonas/sitiosturisticos/tres_fronteras.dart';
import 'package:flutter/material.dart';
//import 'package:appamazonas/turismo/gastronomia.dart';

import 'comunidad_macedonia.dart';
import 'isla_micos.dart';
import 'lago_tarapoto.dart';
import 'mundo_amazonico.dart';

class SitiosTuris extends StatelessWidget {
  const SitiosTuris({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sitios Turisticos Leticia',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 0, 59, 31),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        padding: const EdgeInsets.all(10),
        children: <Widget>[
          _buildGridItem(context, 'assets/AmazonasPh/portadas/loros.png',
              'Parque de los Loros', Parqueloros()),
          _buildGridItem(context, 'assets/AmazonasPh/TresFronteras/6.png',
              'Tres Fronteras', TresFronteras()),
          _buildGridItem(context, 'assets/AmazonasPh/portadas/tarapoto.png',
              'Lago Tarapoto', LagoTarapoto()),
          _buildGridItem(
              context, 'assets/AmazonasPh/portadas/mundoamazonico.png',
              'Parque Ecológico Mundo Amazónico', MundoAmazonico()),
          _buildGridItem(context, 'assets/AmazonasPh/portadas/macedonia.png',
              'Comunidad Indigena Macedonia', ComunidadMacedonia()),
          _buildGridItem(context, 'assets/AmazonasPh/portadas/tanimboca.png',
              'Reserva Natural Tanimboca', ReservaTanimboca()),
          _buildGridItem(context, 'assets/AmazonasPh/portadas/islamicos.png',
              'Isla de los Micos', IslaMicos()),
          _buildGridItem(context, 'assets/AmazonasPh/portadas/puertonarino.png',
              'Puerto Nariño', PuertoNarino()),
        ],
      ),
    );
  }

  Widget _buildGridItem(BuildContext context, String imagePath, String title,
      Widget destinationScreen) {
    return GestureDetector(
      onTap: () =>
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destinationScreen),
          ),
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                 // fontWeight: FontWeight.bold, // Hace el texto en negrita
                  fontSize: 16, // Cambia el tamaño del texto a 18
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//cambiar iconos de la app