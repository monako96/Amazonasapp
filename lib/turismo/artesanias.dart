// turismo.dart
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
// turismo.dart
import 'package:flutter/material.dart';

class ArtesaniaAmazonas extends StatelessWidget {
  const ArtesaniaAmazonas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Artesanías',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 59, 31),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        padding: const EdgeInsets.all(10),
        children: <Widget>[
          _buildGridItem(context, 'assets/AmazonasPh/artesanias/10.jpg'),
          _buildGridItem(context, 'assets/AmazonasPh/artesanias/2.jpg'),
          _buildGridItem(context, 'assets/AmazonasPh/artesanias/3.jpg'),
          _buildGridItem(context, 'assets/AmazonasPh/artesanias/4.jpg'),
          _buildGridItem(context, 'assets/AmazonasPh/artesanias/5.jpg'),
          _buildGridItem(context, 'assets/AmazonasPh/artesanias/6.jpg'),
          _buildGridItem(context, 'assets/AmazonasPh/artesanias/7.jpg'),
          _buildGridItem(context, 'assets/AmazonasPh/artesanias/8.jpg'),
        ],
      ),
    );
  }

  Widget _buildGridItem(BuildContext context, String imagePath) {
    return GestureDetector(
      onTap: () => _showFullScreenImage(context, imagePath),
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: AspectRatio(
                aspectRatio: 1.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0), // Ajusta el radio aquí
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              // Añade cualquier otro widget aquí dentro del Padding si lo necesitas
            ),
          ],
        ),
      ),
    );
  }


  void _showFullScreenImage(BuildContext context, String imagePath) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          backgroundColor: Colors.black,
          body: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Center(
              child: InteractiveViewer(
                panEnabled: false, // Prevent panning
                boundaryMargin: const EdgeInsets.all(100),
                minScale: 0.5,
                maxScale: 2,
                child: Image.asset(imagePath),
              ),
            ),
          ),
        ),
      ),
    );
  }
}