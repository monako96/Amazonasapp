// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
//import 'package:appamazonas/inicio/home_screen.dart';
//import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class UserFeedbackScreen extends StatefulWidget {
  const UserFeedbackScreen({super.key});

  @override
  State<UserFeedbackScreen> createState() => _UserFeedbackScreenState();
}

class _UserFeedbackScreenState extends State<UserFeedbackScreen> {
  double _rating = 3;
  final TextEditingController _commentController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool hasReviewed = false;

  @override
  void initState() {
    super.initState();
    _checkIfUserHasReviewed();
  }

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await _auth.signInWithCredential(credential);
      _checkIfUserHasReviewed();
    }
  }

  Future<void> _checkIfUserHasReviewed() async {
    final user = _auth.currentUser;
    if (user != null) {
      final querySnapshot = await _firestore
          .collection('feedback')
          .where('userEmail', isEqualTo: user.email)
          .get();
      setState(() {
        hasReviewed = querySnapshot.docs.isNotEmpty;
      });
    }
  }

  Future<void> _sendFeedback() async {
    final user = _auth.currentUser;
    if (user != null && _commentController.text.isNotEmpty) {
      final querySnapshot = await _firestore
          .collection('feedback')
          .where('userEmail', isEqualTo: user.email)
          .get();
      if (querySnapshot.docs.isEmpty) {
        await _firestore.collection('feedback').add({
          'userId': user.uid,
          'userName': user.displayName ?? 'Anonymous',
          'userEmail': user.email ?? '',
          'userImage': user.photoURL ?? '',
          'rating': _rating,
          'comment': _commentController.text,
          'timestamp': FieldValue.serverTimestamp(),
        });
        _showThankYouDialog(_commentController.text);
        _commentController.clear();
        setState(() {
          hasReviewed = true;
        });
      } else {
        _showAlreadyReviewedDialog();
      }
    }
  }

  void _showThankYouDialog(String comment) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Gracias por tu Comentario'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Calificación: $_rating\nComentario: $comment'),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showAlreadyReviewedDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: const Text('Ya has enviado un comentario.'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  Future<void> _signOut() async {
    await _auth.signOut();
    final GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut(); // Cerrar sesión de Google

    setState(() {
      hasReviewed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Califica tu experiencia',
            style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 0, 59, 31),
      ),
        body: GestureDetector(
            onTap: () {
              // Oculta el teclado cuando se toca cualquier parte de la pantalla fuera de los campos de texto
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  const Text(
                  'Tu opinión es importante para nosotros',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
            const SizedBox(height: 20),
            RatingBar.builder(
              initialRating: _rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) =>
              const Icon(Icons.star, color: Colors.amber),
              onRatingUpdate: (rating) {
                setState(() {
                  _rating = rating;
                });
              },
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _commentController,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: "Escribe tu comentario aquí...",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (_auth.currentUser == null) {
                  await signInWithGoogle();
                }
                _sendFeedback();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 0, 59, 31),
                foregroundColor: Colors.white,
              ),
              child: const Text('Enviar'),
            ),
            if (_auth.currentUser != null)
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ElevatedButton(
                  onPressed: _signOut,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Cerrar sesión'),
                ),
              ),
            const SizedBox(height: 20),
            const Text(
              'Comentarios de Usuarios',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection('feedback').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  final docs = snapshot.data?.docs;
                  if (docs != null && docs.isNotEmpty) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: docs.map((doc) {
                        final userName = doc['userName'];
                        final userImage = doc['userImage'];
                        final rating = doc['rating'];
                        final comment = doc['comment'];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(userImage),
                                      radius: 16,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      '$userName',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                RatingBarIndicator(
                                  rating: rating.toDouble(),
                                  itemBuilder: (context, index) => const Icon(
                                      Icons.star,
                                      color: Colors.amber),
                                  itemCount: 5,
                                  itemSize: 20.0,
                                  direction: Axis.horizontal,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  comment,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  } else {
                    return const Text('No hay comentarios disponibles.');
                  }
                }
              },
            ),
          ],
        ),
            ),
      ),
    );
  }
}
