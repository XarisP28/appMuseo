import 'package:flutter/material.dart';

class ProyectosEducativosPage extends StatelessWidget {
  const ProyectosEducativosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Proyectos Educativos'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                'https://i.ibb.co/Sw95jzws/ced85fac-c486-4fcd-b39e-3b8623ce98ae.jpg',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Proyectos Educativos del Museo Universitario',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Educación, cultura y ciencia para todos.',
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
            ),
            const Divider(height: 30, thickness: 1.2),
            const Text(
              'Los Proyectos Educativos impulsados por el Museo Universitario buscan acercar el arte, la ciencia y la cultura a estudiantes de todas las edades mediante experiencias interactivas y talleres dinámicos.',
              style: TextStyle(fontSize: 16, height: 1.6),
            ),
            const SizedBox(height: 20),
            const Text(
              'Entre las iniciativas destacan programas de visitas guiadas, exposiciones itinerantes, laboratorios de creación artística y actividades lúdicas diseñadas para despertar la curiosidad y fomentar el pensamiento crítico.',
              style: TextStyle(fontSize: 16, height: 1.6),
            ),
            const SizedBox(height: 20),
            const Text(
              'Estos proyectos contribuyen a la formación integral de la comunidad universitaria y fortalecen los lazos con instituciones educativas de la región, promoviendo el aprendizaje desde una perspectiva interdisciplinaria y participativa.',
              style: TextStyle(fontSize: 16, height: 1.6),
            ),
            const SizedBox(height: 20),
            const Text(
              'Cada actividad propone desafiar la creatividad de los estudiantes, motivándolos a explorar el conocimiento desde la experiencia práctica y el contacto directo con el patrimonio cultural.',
              style: TextStyle(fontSize: 16, height: 1.6),
            ),
          ],
        ),
      ),
    );
  }
}
