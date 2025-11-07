// Proyecto: flutter1
// Widget personalizado para representar un hobby con ícono y texto.

import 'package:flutter/material.dart';

class ItemHobby extends StatelessWidget {
  final IconData icono;
  final String texto;

  const ItemHobby({
    super.key,
    required this.icono,
    required this.texto,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icono, color: Colors.teal, size: 28),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                texto,
                style: const TextStyle(fontSize: 17),
              ),
            ),
          ],
        ),
      ),
    );
  }
}