// Proyecto: flutter1
// Control de navegación inferior entre las tres pantallas principales.

import 'package:flutter/material.dart';
import 'vista_inicio.dart';
import 'vista_perfil.dart';
import 'vista_hobbies.dart';

class VistaNavegacion extends StatefulWidget {
  const VistaNavegacion({super.key});

  @override
  State<VistaNavegacion> createState() => _VistaNavegacionState();
}

class _VistaNavegacionState extends State<VistaNavegacion> {
  int _indiceActual = 0;

  final List<Widget> _vistas = const [
    VistaInicio(),
    VistaPerfil(),
    VistaHobbies(),
    VistaPerfil(), 
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _vistas[_indiceActual],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceActual,
        onTap: (index) {
          setState(() {
            _indiceActual = index;
          });
        },
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Hobbies'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Usuario'), 
        ],
      ),
    );
  }
}

