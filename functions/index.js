/**
 * Import function triggers from their respective submodules:
 *
 * const {onCall} = require("firebase-functions/v2/https");
 * const {onDocumentWritten} = require("firebase-functions/v2/firestore");
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

// const {onRequest} = require("firebase-functions/v2/https");
// const logger = require("firebase-functions/logger");

// Create and deploy your first functions
// https://firebase.google.com/docs/functions/get-started

// exports.helloWorld = onRequest((request, response) => {
//   logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });

const functions = require("firebase-functions");
const admin = require("firebase-admin");
const nodemailer = require("nodemailer");

admin.initializeApp();

// Configura aquí tu correo SMTP
const transporter = nodemailer.createTransport({
  host: "smtp.example.com", // SMTP Host
  port: 587, // Puerto SMTP
  secure: false, // true para 465, false para otros puertos
  auth: { // Autenticación
    user: "tu@correo.com", // Tu correo
    pass: "tucontraseña", // Tu contraseña
  },
});

exports.sendWelcomeEmail = functions.firestore.document("usuarios/{userId}")
    .onCreate((snap, context) => {
      const newUser = snap.data();

      const mailOptions = {
        from: "\"AMCOL TOURS\" <tu@correo.com>",
        to: newUser.correo,
        subject: "Bienvenido a AMCOL TOURS",
        text: `Hola ${newUser.nombre},\n\n` +
              `Gracias por registrarte en AMCOL TOURS. Estamos emocionados ` +
              `de tenerte con nosotros y esperamos que disfrutes de nuestra ` +
              `app y de las futuras actualizaciones que te enviaremos.\n\n` +
              `Saludos,\nEl equipo de AMCOL TOURS`,
      };

      return transporter.sendMail(mailOptions, (error, info) => {
        if (error) {
          return console.log(error);
        }
        console.log("Mail sent: %s", info.messageId);
      });
    });
