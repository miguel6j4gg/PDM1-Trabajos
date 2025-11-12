// Proyecto: flutter1
// Pantalla con la lista de hobbies personales.

import 'package:flutter/material.dart';
import 'componentes/item_hobby.dart';

class VistaHobbies extends StatelessWidget {
  const VistaHobbies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Hobbies'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: const [
          ItemHobby(icono: Icons.directions_walk, texto: 'Caminar sin tiempo determinado'),
          ItemHobby(icono: Icons.music_note, texto: 'Escuchar hip hop(Rapero favorito: MF DOOM)'),
          ItemHobby(icono: Icons.sports_esports, texto: 'Jugar League Of Legends'),
          ItemHobby(icono: Icons.video_camera_back, texto: 'Hacer videos por entretenimiento'),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pop(context),
        backgroundColor: Colors.teal,
        icon: const Icon(Icons.arrow_back),
        label: const Text('Volver'),
      ),
    );
  }
}