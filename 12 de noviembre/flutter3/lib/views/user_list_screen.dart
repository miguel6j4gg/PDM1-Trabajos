import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/user_view_model.dart';
import '../models/user.dart';
import 'user_form_screen.dart';

// Pantalla que muestra la lista de usuarios
class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<UserViewModel>(); // Obtiene el ViewModel

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Usuarios'),
        actions: [
          // Filtro para mostrar solo usuarios activos
          Row(
            children: [
              const Text('Activos'),
              Switch(
                value: viewModel.mostrarSoloActivos,
                onChanged: (value) => viewModel.cambiarFiltro(value),
              ),
              const SizedBox(width: 10),
            ],
          ),
        ],
      ),

      // Si no hay usuarios, muestra un mensaje
      body: viewModel.usuarios.isEmpty
          ? const Center(child: Text('No hay usuarios registrados'))
      // Si hay usuarios, los muestra en una lista
          : ListView.builder(
        itemCount: viewModel.usuarios.length,
        itemBuilder: (context, index) {
          final user = viewModel.usuarios[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              title: Text(user.nombre,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(
                '${user.genero} | ${user.edad} años\n${user.correo}\nEstado: ${user.activo ? 'Activo' : 'Inactivo'}',
              ),
              isThreeLine: true,
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Botón para editar usuario
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () async {
                      final actualizado = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => UserFormScreen(
                            usuario: user,
                            indice: index,
                          ),
                        ),
                      );
                      if (actualizado != null && actualizado is User) {
                        viewModel.editarUsuario(index, actualizado);
                      }
                    },
                  ),
                  // Botón para eliminar usuario
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => viewModel.eliminarUsuario(index),
                  ),
                ],
              ),
            ),
          );
        },
      ),

      // Botón flotante para agregar un nuevo usuario
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final nuevoUsuario = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const UserFormScreen()),
          );
          if (nuevoUsuario != null && nuevoUsuario is User) {
            viewModel.agregarUsuario(nuevoUsuario);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
