// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:appamazonas/experiencia/terminos_condiciones.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  String _nombre = '';
  String _apellido = '';
  String _correo = '';
  String _telefono = '';
  String _ciudad = '';
  String _departamento = '';
  bool _aceptaTerminos = false;

  Future<void> enviarDatos() async {
    if (_aceptaTerminos) {
      await FirebaseFirestore.instance.collection('usuarios').add({
        'nombre': _nombre,
        'apellido': _apellido,
        'correo': _correo,
        'telefono': _telefono,
        'ciudad': _ciudad,
        'departamento': _departamento,
        // Añade más campos según necesites
      }).then((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Datos enviados correctamente')),
        );
        _formKey.currentState?.reset();
        setState(() {
          _aceptaTerminos = false;
        });
      }).catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al enviar datos: $error')),
        );
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Debes aceptar los términos y condiciones para continuar')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
      // Oculta el teclado al tocar fuera de los campos de texto
      FocusScope.of(context).unfocus();
    },
    child: Scaffold(
      appBar: AppBar(
        title: const Text('Registro para Recibir Informacion'),
        iconTheme: IconThemeData(color: Colors.white),

    ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nombre'),
                onSaved: (value) => _nombre = value!,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, introduce tu nombre';
                  }
                  return null; // Retorna null si el dato es válido
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Apellidos'),
                onSaved: (value) => _apellido = value!,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, introduce tu apellido';

                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Correo'),
                onSaved: (value) => _correo = value!,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, introduce tu correo';
                  } else if (!value.contains('@')) {
                    return 'Por favor, introduce un correo válido';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Teléfono'),
                onSaved: (value) => _telefono = value!,
                keyboardType: TextInputType.phone, // Muestra el teclado numérico
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, introduce tu teléfono';
                  } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                    return 'Por favor, introduce un número válido';
                  }
                  // Añade aquí otras validaciones si necesitas, como la longitud del número
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Ciudad'),
                onSaved: (value) => _ciudad = value!,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, introduce tu ciudad';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Departamento'),
                onSaved: (value) => _departamento = value!,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, introduce tu departamento';
                  }
                  return null;
                },
              ),
              Row(
                children: [
                  Checkbox(
                    value: _aceptaTerminos,
                    onChanged: (bool? value) {
                      setState(() {
                        _aceptaTerminos = value!;
                      });
                    },
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        // Navegar a la pantalla de Términos y Condiciones
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const TerminosYCondicionesScreen()),
                        );
                      },
                      child: const Text(
                        'Acepto los términos y condiciones',
                        style: TextStyle(decoration: TextDecoration.underline,color: Colors.red),
                      ),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Todos los campos han pasado la validación
                    _formKey.currentState!.save();
                    enviarDatos();

                  }
                },
                child: const Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    ),
    );
  }
}
