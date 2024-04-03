// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:appamazonas/experiencia/registro_user.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';




class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Más'),
        backgroundColor: const Color.fromARGB(255, 0, 59, 31),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView(
              children: [
                ExpansionTile(
                  leading: const Icon(Icons.contact_mail),
                  title: const Text('Información de contacto'),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Puedes contactarnos a través de:"),
                          const Text("Email: gregorio.cubeo@uniminuto.edu.co"),
                          const Text("Teléfono: +57 3202240985\n"),
                          // Botón de WhatsApp
                          ElevatedButton.icon(
                            icon: const Icon(Icons.chat, color: Colors.green),
                            label: const Text('Contactar por WhatsApp', style: TextStyle(color: Colors.black)), // Color del texto
                            onPressed: () {
                              // Capturamos el context en una variable local antes del gap asíncrono.
                              final scaffoldMessenger = ScaffoldMessenger.of(context);

                              final whatsappUrl = Uri.parse("https://wa.me/573202240985?text=Hola%2C%20me%20gustaría%20saber%20más%20información%sobre%la%App%de%Turismo.");
                              canLaunchUrl(whatsappUrl).then((canLaunch) {
                                if (canLaunch) {
                                  launchUrl(whatsappUrl);
                                } else {
                                  scaffoldMessenger.showSnackBar(
                                    const SnackBar(
                                      content: Text('No se pudo abrir WhatsApp'),
                                    ),
                                  );
                                }
                              });
                            },
                          ),
                          const SizedBox(height: 16),
                      ElevatedButton.icon(
                        icon: const Icon(Icons.app_registration, color: Colors.green),
                        label: const Text('Registrarse para más información', style: TextStyle(color: Colors.black)), // Color del texto
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) => RegisterScreen()), // Asegúrate de que RegisterScreen esté importado
                          );
                        },
                      ),
                        ],
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  leading: const Icon(Icons.info_outline),
                  title: const Text('Acerca de la app'),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Versión de la app: 1.0.0\n"),
                          Text("Desarrollado por: Gregorio Cubeo, Julian Porras\n"
                              "Lugar: Villavicencio-Metas\n"
                              "Universidad Minuto de Dios"),
                        ],
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  leading: const Icon(Icons.image),
                  title: const Text('Créditos de las Imágenes'),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Todas las imágenes utilizadas en [Nombre de la Aplicación] son propiedad de sus respectivos dueños y se utilizan bajo permiso. Los créditos de las imágenes son los siguientes:\n\n"
                                "- Imágenes proporcionadas por Camilofilm Studio. Todos los derechos reservados.\n"
                                "- Imágenes proporcionadas por Jangada Tours. Todos los derechos reservados.\n\n"
                                "El uso de estas imágenes sin el consentimiento expreso de los propietarios está estrictamente prohibido.",
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  leading: const Icon(Icons.privacy_tip),
                  title: const Text('Política y privacidad'),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
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
                                "Si tienes preguntas sobre esta política, contáctanos.",
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
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