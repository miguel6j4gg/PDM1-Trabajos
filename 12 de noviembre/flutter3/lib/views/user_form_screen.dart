import 'package:flutter/material.dart';
import '../models/user.dart';

// Pantalla para agregar o editar un usuario
class UserFormScreen extends StatefulWidget {
  final User? usuario;  // Usuario a editar (null si es nuevo)
  final int? indice;    // Índice del usuario en la lista

  const UserFormScreen({super.key, this.usuario, this.indice});

  @override
  State<UserFormScreen> createState() => _UserFormScreenState();
}

class _UserFormScreenState extends State<UserFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _nombre;
  late String _correo;
  late int _edad;
  String _genero = 'Masculino';
  bool _activo = true;

  final _correoRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');

  @override
  void initState() {
    super.initState();
    // Si se recibe un usuario, se cargan sus datos
    if (widget.usuario != null) {
      _nombre = widget.usuario!.nombre;
      _genero = widget.usuario!.genero;
      _edad = widget.usuario!.edad;
      _correo = widget.usuario!.correo;
      _activo = widget.usuario!.activo;
    } else {
      _nombre = '';
      _correo = '';
      _edad = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.usuario == null ? 'Agregar Usuario' : 'Editar Usuario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Campo: Nombre
                TextFormField(
                  initialValue: _nombre,
                  decoration: const InputDecoration(labelText: 'Nombre'),
                  validator: (value) =>
                  value == null || value.isEmpty ? 'Ingrese un nombre válido' : null,
                  onSaved: (value) => _nombre = value!,
                ),
                const SizedBox(height: 16),

                // Campo: Edad
                TextFormField(
                  initialValue: _edad == 0 ? '' : _edad.toString(),
                  decoration: const InputDecoration(labelText: 'Edad'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Ingrese una edad';
                    final edad = int.tryParse(value);
                    if (edad == null || edad <= 0) return 'Edad inválida';
                    return null;
                  },
                  onSaved: (value) => _edad = int.parse(value!),
                ),
                const SizedBox(height: 16),

                // Campo: Correo
                TextFormField(
                  initialValue: _correo,
                  decoration: const InputDecoration(labelText: 'Correo electrónico'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Ingrese un correo';
                    if (!_correoRegex.hasMatch(value)) return 'Formato de correo inválido';
                    return null;
                  },
                  onSaved: (value) => _correo = value!,
                ),
                const SizedBox(height: 20),

                // Selección de género
                const Text('Género', style: TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                        title: const Text('Masculino'),
                        value: 'Masculino',
                        groupValue: _genero,
                        onChanged: (value) => setState(() => _genero = value!),
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        title: const Text('Femenino'),
                        value: 'Femenino',
                        groupValue: _genero,
                        onChanged: (value) => setState(() => _genero = value!),
                      ),
                    ),
                  ],
                ),

                // Switch de estado activo
                SwitchListTile(
                  title: const Text('Activo'),
                  value: _activo,
                  onChanged: (value) => setState(() => _activo = value),
                ),
                const SizedBox(height: 30),

                // Botón guardar o actualizar
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      final user = User(
                        nombre: _nombre,
                        genero: _genero,
                        edad: _edad,
                        correo: _correo,
                        activo: _activo,
                      );
                      Navigator.pop(context, user);
                    }
                  },
                  child: Text(widget.usuario == null ? 'Guardar' : 'Actualizar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
