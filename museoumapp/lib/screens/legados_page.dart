import 'package:flutter/material.dart';

class LegadosPage extends StatelessWidget {
  const LegadosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Legados'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                'https://i.ibb.co/Ng25np1K/7ab1ebe1-2bf4-4c6d-9109-3b7694420a7f.jpg',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Los Legados en el Museo Universitario',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Un testimonio vivo de la memoria institucional.',
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
            ),
            const Divider(height: 30, thickness: 1.2),
            const Text(
              'Los legados en el Museo Universitario son donaciones de objetos, documentos, fotografías y materiales históricos realizados por generaciones de estudiantes, académicos y autoridades. Cada pieza preserva un fragmento de la historia de la universidad y la cultura local.',
              style: TextStyle(fontSize: 16, height: 1.6),
            ),
            const SizedBox(height: 20),
            const Text(
              'Desde antiguos instrumentos de laboratorio hasta uniformes deportivos, estos objetos ofrecen una ventana al pasado y fomentan el orgullo institucional entre las nuevas generaciones. Además, los legados permiten construir una identidad universitaria sólida, transmitiendo valores y memorias a través de generaciones.',
              style: TextStyle(fontSize: 16, height: 1.6),
            ),
            const SizedBox(height: 20),
            const Text(
              'Cada objeto exhibido cuenta una historia que conecta a los visitantes con las raíces de su institución, permitiéndoles comprender y valorar el legado de quienes los precedieron.',
              style: TextStyle(fontSize: 16, height: 1.6),
            ),
          ],
        ),
      ),
    );
  }
}
