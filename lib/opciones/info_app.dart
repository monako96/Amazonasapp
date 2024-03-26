// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Más'),
        backgroundColor: Color.fromARGB(255, 0, 59, 31),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView(
              children: [
                ExpansionTile(
                  leading: Icon(Icons.contact_mail),
                  title: Text('Información de contacto'),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Puedes contactarnos a través de:"),
                          Text("Email: gregorio.cubeo@uniminuto.edu.co"),
                          Text("Teléfono: +57 3202240985"),
                          // Añade más información de contacto si es necesario
                        ],
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  leading: Icon(Icons.info_outline),
                  title: Text('Acerca de la app'),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Versión de la app: 1.0.0\n"),
                          Text("Desarrollado por: Gregorio cubeo, Julian porras\n"
                              "lugar:Villavicencio-Metas\n"
                              "Universidad Minuto de Dios"),
                          // Añade más detalles acerca de la app
                        ],
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  leading: Icon(Icons.image),
                  title: Text('Créditos de las Imágenes'),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Todas las imágenes utilizadas en [Nombre de la Aplicación] son propiedad de sus respectivos dueños y se utilizan bajo permiso. Los créditos de las imágenes son los siguientes:\n\n"
                                "- Imágenes proporcionadas por Camilofilm Studio. Todos los derechos reservados.\n"
                                "- Imágenes proporcionadas por Jangada Tours. Todos los derechos reservados.\n\n"
                                "El uso de estas imágenes sin el consentimiento expreso de los propietarios está estrictamente prohibido.",
                            textAlign: TextAlign.justify,
                          ),
                          // Añade más detalles o créditos de imágenes si es necesario
                        ],
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  leading: Icon(Icons.privacy_tip),
                  title: Text('Política y privacidad'),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Introducción\n\n"
                                "En AMCOL TOURS, respetamos tu privacidad y estamos comprometidos con proteger la información personal que nos proporcionas. Esta política explica cómo usamos y protegemos tus datos al utilizar nuestra aplicación móvil.\n\n"
                                "Recopilación de Datos\n\n"
                                "Solo recopilamos tu dirección de correo electrónico y nombre de usuario al iniciar sesión con Gmail para publicar comentarios en nuestra aplicación. No recopilamos más información personal que la estrictamente necesaria para este propósito.\n\n"
                                "Uso de Datos\n\n"
                                "Utilizamos tu información para:\n"
                                "- Permitirte publicar comentarios en la aplicación.\n"
                                "- Contactarte con actualizaciones importantes de la aplicación o respuestas a tus comentarios, si es necesario.\n\n"
                                "Compartir Datos\n\n"
                                "No compartimos tu información personal con terceros, excepto para cumplir con leyes aplicables o proteger nuestros derechos.\n\n"
                                "Seguridad\n\n"
                                "Tomamos medidas para proteger tu información contra acceso no autorizado, alteración o destrucción.\n\n"
                                "Cambios a Esta Política\n\n"
                                "Podemos actualizar nuestra Política de Privacidad ocasionalmente. Te recomendamos revisar esta página periódicamente para cualquier cambio.\n\n"
                                "Contacto\n\n"
                                "Si tienes preguntas sobre esta política, contáctanos en gregorio.cubeo@uniminuto.edu.co. o al 3202240985 ",
                            textAlign: TextAlign.justify,
                          ),
                          // Añade más detalles acerca de la app si es necesario
                        ],
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
          // Logos en la parte inferior
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/amcol.png'),
                ),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/logoamazonas.png'),
                ),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/uniminuto.jpg'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
