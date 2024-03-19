// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class RegistroUsuario extends StatefulWidget {
  const RegistroUsuario({super.key});

  @override
  RegistroUsuarioState createState() => RegistroUsuarioState();
}

class RegistroUsuarioState extends State<RegistroUsuario> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(24),
            height: MediaQuery.of(context).size.height,
            color: const Color.fromARGB(255, 255, 255, 255),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _header(context),
                _inputFields(context),
                _signupButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _header(context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/logoamcol.png',
          width: 200,
          height: 200,
        ),
        Text(
          "Registro de Usuario",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Text("Crea tu cuenta"),
      ],
    );
  }

  _inputFields(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _usernameController,
          decoration: InputDecoration(
            hintText: "Email",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: const Icon(
              Icons.person,
              color: Color(0xFF00BF63),
            ),
          ),
        ),
        const SizedBox(height: 10),

        // Password input
        TextField(
          controller: _passwordController,
          decoration: InputDecoration(
            hintText: "Password",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: const Icon(
              Icons.vpn_key,
              color: Color(0xFF00BF63),
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
              child: Icon(
                _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: const Color(0xFF00BF63),
              ),
            ),
          ),
          obscureText:
              !_isPasswordVisible, // Controla la visibilidad de la contraseña
        ),

        const SizedBox(height: 10),
      ],
    );
  }

  _signupButton(context) {
    return ElevatedButton(
      onPressed: () {
        // Agrega la lógica para procesar el registro de usuario aquí
      },
      style: ElevatedButton.styleFrom(
        shape: StadiumBorder(),
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.height *
              0.07, // Ajusta la altura según tu preferencia
        ),
        backgroundColor: const Color(0xFF00BF63),
      ),
      child: const Text(
        "Registrarse",
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}
