// Proyecto: flutter1
// Descripción: Aplicación personal en Flutter con tres pantallas estáticas (Inicio, Perfil, Hobbies).

import 'package:flutter/material.dart';
import 'vista_inicio.dart';
import 'vista_perfil.dart';
import 'vista_hobbies.dart';
import 'vista_navegacion.dart'; // 👈 AGREGA ESTA IMPORTACIÓN


void main() {
  runApp(const AplicacionPersonal());
}

/// Clase principal que define la estructura, rutas y tema de la aplicación.
class AplicacionPersonal extends StatelessWidget {
  const AplicacionPersonal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter1 - Aplicación Personal',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => const VistaNavegacion(),
        '/perfil': (context) => const VistaPerfil(),
        '/hobbies': (context) => const VistaHobbies(),
      },
    );
  }
}