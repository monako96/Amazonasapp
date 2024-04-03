// terminos_y_condiciones_screen.dart
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class TerminosYCondicionesScreen extends StatelessWidget {
  const TerminosYCondicionesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Términos y Condiciones'),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          '''Términos y Condiciones de Registro y Uso de Datos

Bienvenido a AMCOL TOURS. Al registrarte en nuestra aplicación y proporcionarnos tus datos personales, aceptas los siguientes términos y condiciones. Te pedimos que los leas detenidamente.

1. Aceptación de los Términos

Al enviar tus datos personales a través de nuestro formulario de registro, confirmas que has leído, entendido y aceptado estos términos y condiciones, así como nuestra Política de Privacidad.

2. Recopilación de Datos

Nos comprometemos a recopilar únicamente los datos necesarios para ofrecerte nuestros servicios. Esto incluye, pero no se limita a, tu nombre, apellido, correo electrónico, número de teléfono, ciudad y departamento.

3. Uso de los Datos

Utilizaremos tus datos para:

Enviarte información relevante sobre actualizaciones de nuestra aplicación y noticias sobre nuestros servicios.
Mejorar tu experiencia de usuario personalizando nuestro contenido según tus intereses.
Comunicarnos contigo para fines de atención al cliente o para proporcionarte información que consideremos de tu interés.

4. Protección de Datos

AMCOL TOURS se compromete a proteger tus datos personales. Implementamos medidas técnicas y organizativas para prevenir el acceso no autorizado, la pérdida, el mal uso o la alteración de tu información personal.

5. Compartir Datos

No compartiremos tus datos personales con terceros sin tu consentimiento explícito, excepto en los casos requeridos por ley o para proteger nuestros derechos.

6. Derechos del Usuario

Tienes derecho a acceder, corregir, eliminar o limitar el uso de tus datos personales. Si deseas ejercer alguno de estos derechos, por favor contáctanos utilizando la información provista en nuestra aplicación.

7. Modificaciones a los Términos

Nos reservamos el derecho de modificar estos términos y condiciones en cualquier momento. Cualquier cambio será efectivo inmediatamente después de su publicación en la aplicación. Tu uso continuado de nuestro servicio constituirá tu aceptación de tales cambios.

8. Ley Aplicable

Estos términos se regirán e interpretarán de acuerdo con las leyes del país/jurisdicción en el que AMCOL TOURS tiene su sede principal, sin dar efecto a ningún principio de conflictos de ley.

Contacto

Si tienes alguna pregunta sobre estos términos, por favor contáctanos a través de nuestra aplicación o en la dirección de correo electrónico proporcionada.

Al enviarnos tus datos personales, confirmas que aceptas estos términos y condiciones.''',
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
