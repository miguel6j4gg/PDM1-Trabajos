// Proyecto: flutter1
// Pantalla de perfil con imagen, nombre, descripción e información de contacto.

import 'package:flutter/material.dart';

class VistaPerfil extends StatelessWidget {
  const VistaPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Perfil'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/hobbies'),
            icon: const Icon(Icons.favorite),
            tooltip: 'Ir a hobbies',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage('https://i.pravatar.cc/250'),
            ),
            const SizedBox(height: 18),
            const Text(
              'Miguel Andres Flavio Ocharan Coaquira ',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Estudiante de Ingeniería de Software | Amante de creacion de videos | Crear paginas webs .',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const Divider(height: 40, thickness: 1),
            _infoContacto(Icons.email, 'mocharanc@ulasalle.edu.pe'),
            _infoContacto(Icons.phone_android, '+51 927 018 468'),
            _infoContacto(Icons.location_on, 'Arequipa, Perú'),
            const SizedBox(height: 28),
            ElevatedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Regresar al inicio'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding:
                const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Widget auxiliar para mostrar íconos de contacto.
  static Widget _infoContacto(IconData icon, String texto) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.teal),
          const SizedBox(width: 10),
          Text(texto, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}