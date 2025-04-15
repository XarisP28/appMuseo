import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:museoumapp/main.dart';

void main() {
  testWidgets('Verifica que la página de inicio muestre el título y los botones', (WidgetTester tester) async {
    // Carga la app
    await tester.pumpWidget(const MuseoApp());

    // Verifica que el texto del título esté presente
    expect(find.text('Bienvenidos al Museo Universitario'), findsOneWidget);

    // Verifica que los botones estén
    expect(find.text('Exposiciones'), findsOneWidget);
    expect(find.text('Horario'), findsOneWidget);
    expect(find.text('Ubicación'), findsOneWidget);
    expect(find.text('Contacto'), findsOneWidget);
  });
}
