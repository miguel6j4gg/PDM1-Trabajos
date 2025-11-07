// Proyecto: flutter1
// Pantalla de perfil con imagen, nombre, descripción e información de contacto.

import 'package:flutter/material.dart';
import 'vista_editar_perfil.dart'; // 👈 NUEVO IMPORT

class VistaPerfil extends StatefulWidget {
  const VistaPerfil({super.key});

  @override
  State<VistaPerfil> createState() => _VistaPerfilState();
}

class _VistaPerfilState extends State<VistaPerfil> {
  String _nombre = 'Miguel Andres Flavio Ocharan Coaquira'; // valor inicial

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
            Text(
              _nombre,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              'Estudiante de Ingeniería de Software | Amante de creación de videos | Crear páginas web.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const Divider(height: 40, thickness: 1),
            _infoContacto(Icons.email, 'mocharanc@ulasalle.edu.pe'),
            _infoContacto(Icons.phone_android, '+51 927 018 468'),
            _infoContacto(Icons.location_on, 'Arequipa, Perú'),
            const SizedBox(height: 28),
            ElevatedButton.icon(
              onPressed: _editarPerfil, // 👈 acción de editar
              icon: const Icon(Icons.edit),
              label: const Text('Editar perfil'),
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

  /// Lógica para abrir la pantalla de edición y recibir el nuevo nombre
  Future<void> _editarPerfil() async {
    final nuevoNombre = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const VistaEditarPerfil()),
    );

    if (nuevoNombre != null && nuevoNombre.isNotEmpty) {
      setState(() {
        _nombre = nuevoNombre;
      });
    }
  }

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
