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
          _buildGridItem(context, 'assets/paisajes/mono.jpg', 'Sitio Turístico 1'),
          _buildGridItem(context, 'assets/paisajes/brasil.jpg', 'Sitio Turístico 2'),
          _buildGridItem(context, 'assets/paisajes/choza.jpg', 'Sitio Turístico 3'),
          _buildGridItem(context, 'assets/paisajes/cultura.jpg', 'Sitio Turístico 4'),
          _buildGridItem(context, 'assets/paisajes/indigenas.jpg', 'Sitio Turístico 5'),
          _buildGridItem(context, 'assets/paisajes/pesca.jpg', 'Sitio Turístico 6'),
          _buildGridItem(context, 'assets/paisajes/rio.jpg', 'Sitio Turístico 7'),
          _buildGridItem(context, 'assets/paisajes/cultura.jpg', 'Sitio Turístico 8'),
        ],
      ),
    );
  }

  Widget _buildGridItem(BuildContext context, String imagePath, String title) {
    return GestureDetector(
      onTap: () => _showFullScreenImage(context, imagePath),
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: AspectRatio(
                aspectRatio: 1.0,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
              ),
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