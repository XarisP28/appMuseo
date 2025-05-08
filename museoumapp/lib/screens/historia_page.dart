import 'package:flutter/material.dart';

class HistoriaPage extends StatefulWidget {
  const HistoriaPage({super.key});

  @override
  State<HistoriaPage> createState() => _HistoriaPageState();
}

class _HistoriaPageState extends State<HistoriaPage> {
  List<Map<String, String>> acontecimientos = [
    {
      'titulo': 'Ceremonia Docencia',
      'imagen': 'https://i.ibb.co/k2XnsW6f/ceremonia-Docencia.jpg',
      'descripcion':
          'Reconocimiento a docentes destacados por su labor académica, promoviendo la excelencia educativa en la universidad. El evento tuvo lugar en la Iglesia Universitaria en 2018'
    },
    {
      'titulo': 'Aniversario No. 82 de la Universidad',
      'imagen': 'https://i.ibb.co/qYkjWrsk/aniversario82.jpg',
      'descripcion':
          'Se celebró el 82 aniversario de la universidad con actividades culturales, conferencias magistrales y entrega de reconocimientos a exalumnos destacados. El evento tuvo lugar en el Auditorio de Música en 2022'
    },
    {
      'titulo': 'Visita autoridades',
      'imagen': 'https://i.ibb.co/GQd49xxL/visita-autoridades.jpg',
      'descripcion':
          'Directivos estatales y municipales recorrieron las instalaciones para conocer los nuevos laboratorios de investigación inaugurados este año. El evento tuvo lugar en la Sala Charles Taylor en 2024'
    },
    {
      'titulo': 'Visita Hope Channel a la Facultad de Comunicación',
      'imagen': 'https://i.ibb.co/1jR8sgy/visita-Hopechanel.jpg',
      'descripcion':
          'Representantes de Hope Channel visitaron la Facultad de Comunicación para establecer colaboraciones en producción audiovisual y medios educativos. El evento tuvo lugar en la Iglesia Universitaria en 2021'
    },
    {
      'titulo': 'Entrega de Beca Regional Centrícola',
      'imagen': 'https://i.ibb.co/1tWcxy0X/beca-Regional.jpg',
      'descripcion':
          'Se otorgaron 10 becas a estudiantes de alto rendimiento provenientes de municipios aledaños, como parte del programa de apoyo regional. El evento tuvo lugar en Rectoría en 2017'
    },
    {
      'titulo': 'Firma Convenio con Gobierno NL',
      'imagen': 'https://i.ibb.co/wFygH2K7/firma-Convenio.jpg',
      'descripcion':
          'Se firmó un acuerdo de colaboración con el Gobierno de Nuevo León para proyectos conjuntos en temas de medio ambiente, salud y desarrollo social. El evento tuvo lugar en El Palacio Principal en 2015'
    }
  ];

  String query = '';

  // Función de análisis léxico para extraer lugar y año
  Map<String, String> extraerLugarYAnio(String descripcion) {
    final lugarRegex = RegExp(r'en (.*?) en \d{4}');
    final anioRegex = RegExp(r'en (\d{4})');

    final lugarMatch = lugarRegex.firstMatch(descripcion);
    final anioMatch = anioRegex.firstMatch(descripcion);

    final lugar = lugarMatch != null ? lugarMatch.group(1)!.trim() : 'Desconocido';
    final anio = anioMatch != null ? anioMatch.group(1)! : 'Desconocido';

    return {'lugar': lugar, 'anio': anio};
  }

  @override
  Widget build(BuildContext context) {
    var acontecimientosFiltrados = acontecimientos.where((acontecimiento) {
      return acontecimiento['titulo']!.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Historia / Acontecimientos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Buscar acontecimiento',
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
            Expanded(
              child: GridView.builder(
                itemCount: acontecimientosFiltrados.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  var acontecimiento = acontecimientosFiltrados[index];
                  return GestureDetector(
                    onTap: () {
                      final metadatos = extraerLugarYAnio(acontecimiento['descripcion']!);
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
                                      acontecimiento['imagen']!,
                                      height: 200,
                                      width: 200,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    acontecimiento['titulo']!,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    acontecimiento['descripcion']!,
                                    textAlign: TextAlign.justify,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  const SizedBox(height: 8),
                                  infoText('Lugar del evento:', metadatos['lugar']!),
                                  infoText('Año:', metadatos['anio']!),
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
                            acontecimiento['imagen']!,
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          acontecimiento['titulo']!,
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
