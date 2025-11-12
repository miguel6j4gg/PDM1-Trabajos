// Proyecto: flutter1
// Archivo de pruebas automáticas para verificar el correcto funcionamiento de la interfaz.
// Las pruebas confirman que los textos y botones principales existen en la pantalla de inicio.

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter1/main.dart';

void main() {
  group('Pruebas básicas de la aplicación flutter1', () {
    testWidgets('Carga la pantalla de inicio correctamente',
            (WidgetTester tester) async {
          // Cargar la aplicación principal
          await tester.pumpWidget(const MyApp());

          // Verifica que aparezca el texto principal de bienvenida
          expect(find.text('¡Bienvenido a mi aplicación personal!'), findsOneWidget);

          // Verifica que el botón "Ver mi perfil" esté presente
          expect(find.text('Ver mi perfil'), findsOneWidget);
        });

    testWidgets('El botón "Ver mi perfil" existe y es funcional (navegación)',
            (WidgetTester tester) async {
          await tester.pumpWidget(const MyApp());

          // Buscar el botón
          final botonPerfil = find.text('Ver mi perfil');
          expect(botonPerfil, findsOneWidget);

          // Simular clic en el botón
          await tester.tap(botonPerfil);
          await tester.pumpAndSettle();

          // Verificar que la pantalla cambió a "Mi Perfil"
          expect(find.text('Mi Perfil'), findsOneWidget);
        });
  });
}