import 'package:flutter/material.dart';

class UserListScreen extends StatelessWidget {
  final String email;

  const UserListScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido: $email'),
      ),
      body: const Center(
        child: Text(
          'Aquí va tu CRUD de usuarios',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
