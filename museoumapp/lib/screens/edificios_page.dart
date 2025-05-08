import 'package:flutter/material.dart';

class EdificiosPage extends StatefulWidget {
  const EdificiosPage({super.key});

  @override
  State<EdificiosPage> createState() => _EdificiosPageState();
}

class _EdificiosPageState extends State<EdificiosPage> {
  List<Map<String, String>> edificios = [
  {
    'nombre': 'Auditorio Universitario',
    'imagen': 'https://i.ibb.co/CpCW8Wwh/auditorio.jpg',
    'funcion': 'Eventos académicos y culturales',
    'departamento': 'Extensión Universitaria',
    'fechaConstruccion': '1975'
  },
  {
    'nombre': 'Vicerectoria académica',
    'imagen': 'https://i.ibb.co/bRYdCwtM/vicerrectoria.jpg',
    'funcion': 'Administración académica',
    'departamento': 'Vicerectoría Académica',
    'fechaConstruccion': '2010'
  },
  {
    'nombre': 'Biblioteca Central',
    'imagen': 'https://i.ibb.co/KjCxHfbn/biblioteca.jpg',
    'funcion': 'Centro de Recursos Académicos',
    'departamento': 'Biblioteca',
    'fechaConstruccion': '1970'
  },
  {
    'nombre': 'Rectoría',
    'imagen': 'https://i.ibb.co/4gPckvxM/rectoria.jpg',
    'funcion': 'Administración general de la universidad',
    'departamento': 'Rectoría',
    'fechaConstruccion': '1985'
  },
  {
    'nombre': 'Plaza principal',
    'imagen': 'https://i.ibb.co/HLkCwZhF/plaza-Principal.jpg',
    'funcion': 'Espacio de convivencia y actos cívicos',
    'departamento': 'N/A',
    'fechaConstruccion': '1988'
  },
  {
    'nombre': 'Comedor Universitario',
    'imagen': 'https://i.ibb.co/3ypKy1Dg/comedor.jpg',
    'funcion': 'Servicio de alimentos a estudiantes y personal',
    'departamento': 'Servicios Generales',
    'fechaConstruccion': '1989'
  },
  {
    'nombre': 'Instituto de idiomas',
    'imagen': 'https://i.ibb.co/sdgh996q/inst-Idiomas.jpg',
    'funcion': 'Enseñanza de lenguas extranjeras',
    'departamento': 'Centro de Idiomas',
    'fechaConstruccion': '1991'
  },
  {
    'nombre': 'Casa Día',
    'imagen': 'https://i.ibb.co/sp5XwB7T/CASA-DIA.jpg',
    'funcion': 'Hospedaje para visitantes y profesores invitados',
    'departamento': 'Hospitalidad Universitaria',
    'fechaConstruccion': '1987'
  },
  {
    'nombre': 'Dormitorio Preparatoria 2',
    'imagen': 'https://i.ibb.co/chzpnBMW/dormi2.jpg',
    'funcion': 'Residencia para estudiantes de preparatoria',
    'departamento': 'Servicios Estudiantiles',
    'fechaConstruccion': '1990'
  },
  {
    'nombre': 'Dormitorio Universitario 3',
    'imagen': 'https://i.ibb.co/84287C6d/dormi3.jpg',
    'funcion': 'Residencia para varones universitarios',
    'departamento': 'Servicios Estudiantiles',
    'fechaConstruccion': '1992'
  },
  {
    'nombre': 'Dormitorio Universitario 4',
    'imagen': 'https://i.ibb.co/7dsck5sY/dormi4.jpg',
    'funcion': 'Residencia para señoritas universitarias',
    'departamento': 'Servicios Estudiantiles',
    'fechaConstruccion': '1992'
  },
  {
    'nombre': 'Camino a la iglesia',
    'imagen': 'https://i.ibb.co/Hfv9dWD7/camino.jpg',
    'funcion': 'Sendero peatonal hacia el templo universitario',
    'departamento': 'Áreas Verdes y Mantenimiento',
    'fechaConstruccion': '2020'
  },
];

  String query = '';

  @override
  Widget build(BuildContext context) {
    var edificiosFiltrados = edificios.where((edificio) {
      return edificio['nombre']!.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edificios'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // 🔍 Buscador
            TextField(
              decoration: InputDecoration(
                hintText: 'Buscar',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onChanged: (value) {
                setState(() {
                  query = value;
                });
              },
            ),
            const SizedBox(height: 16),
            // 🏢 Galería de edificios
            Expanded(
              child: GridView.builder(
                itemCount: edificiosFiltrados.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  var edificio = edificiosFiltrados[index];
                  return GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            contentPadding: const EdgeInsets.all(16),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            content: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      edificio['imagen']!,
                                      height: 200,
                                      width: 200,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    edificio['nombre']!,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  infoText('Función:', edificio['funcion']!),
                                  infoText('Departamento:', edificio['departamento']!),
                                  infoText('Construcción:', edificio['fechaConstruccion']!),
                                ],
                              ),
                            ),
                            actionsAlignment: MainAxisAlignment.center,
                            actions: [
                              TextButton(
                                child: const Text('Cerrar'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            edificio['imagen']!,
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          edificio['nombre']!,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget infoText(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
          children: [
            TextSpan(
              text: '$label ',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }
}
