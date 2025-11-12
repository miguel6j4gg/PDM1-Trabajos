// Proyecto: flutter1
// Widget personalizado para representar un hobby con ícono y texto.

import 'package:flutter/material.dart';

// Clase que representa a un usuario.
class User {
  String nombre;   // Nombre del usuario
  String genero;   // Género del usuario
  int edad;        // Edad del usuario
  String correo;   // Correo electrónico
  bool activo;     // Estado del usuario

  // Constructor con parámetros requeridos
  User({
    required this.nombre,
    required this.genero,
    required this.edad,
    required this.correo,
    required this.activo,
  });
}

