import 'package:flutter/material.dart';

class ObjetosPage extends StatefulWidget {
  const ObjetosPage({super.key});

  @override
  State<ObjetosPage> createState() => _ObjetosPageState();
}

class _ObjetosPageState extends State<ObjetosPage> {
  List<Map<String, String>> objetos = [
  {
    'nombre': 'Teléfono Ericsson Modelo 1958',
    'imagen': 'https://i.ibb.co/6cTNKV43/telefono.jpg',
    'uso': 'Primer línea telefónica de la universidad',
    'departamento': 'Oficina de Rectoría',
    'fechaAdquisicion': '20/08/1958'
  },
  {
    'nombre': 'Proyector de Filminas Kodak Carousel',
    'imagen': 'https://i.ibb.co/Y4rrbxr8/proyector.jpg',
    'uso': 'Proyecciones de diapositivas educativas',
    'departamento': 'Aula Magna',
    'fechaAdquisicion': '05/05/1972'
  },
  {
    'nombre': 'Máquina de Escribir Olivetti Studio 44',
    'imagen': 'https://i.ibb.co/zTWydB4g/maquina-Escribir.jpg',
    'uso': 'Elaboración de documentos y oficios',
    'departamento': 'Secretaría Académica',
    'fechaAdquisicion': '18/09/1965'
  },
  {
    'nombre': 'Cámara Polaroid',
    'imagen': 'https://i.ibb.co/6c2y44C0/camara.jpg',
    'uso': 'Registro fotográfico de eventos institucionales',
    'departamento': 'Archivo Histórico',
    'fechaAdquisicion': '12/11/1979'
  },
  {
    'nombre': 'Calculadora ',
    'imagen': 'https://i.ibb.co/CSDytzY/calculadora.jpg',
    'uso': 'Cálculos en laboratorios de ingeniería',
    'departamento': 'Facultad de Ingeniería',
    'fechaAdquisicion': '28/03/1983'
  },
  {
    'nombre': 'Radio Transmisor Hallicrafters S-38',
    'imagen': 'https://i.ibb.co/xTrLR9P/radio.jpg',
    'uso': 'Primeras transmisiones de radio universitarias',
    'departamento': 'Facultad de Comunicación',
    'fechaAdquisicion': '14/02/1960'
  },
  {
    'nombre': 'Globo Terráqueo Replogle Classic',
    'imagen': 'https://i.ibb.co/mVqFxkJf/globoTer.jpg',
    'uso': 'Clases de geografía y cartografía',
    'departamento': 'Facultad de Ciencias Sociales',
    'fechaAdquisicion': '09/06/1955'
  },
  {
    'nombre': 'Proyector de Cine Bell & Howell 8mm',
    'imagen': 'https://i.ibb.co/Z6cBx63z/proyector-Peli.jpg',
    'uso': 'Proyección de películas educativas',
    'departamento': 'Centro Cultural Universitario',
    'fechaAdquisicion': '03/04/1970'
  },
  {
    'nombre': 'Primera Placa Conmemorativa Fundacional',
    'imagen': 'https://i.ibb.co/rGJ9Ys6T/placa.jpg',
    'uso': 'Colocada en la inauguración de la universidad',
    'departamento': 'Rectoría',
    'fechaAdquisicion': '01/09/1950'
  }
];

  String query = '';

  @override
  Widget build(BuildContext context) {
    var objetosFiltrados = objetos.where((objeto) {
      return objeto['nombre']!.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Objetos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Buscar objeto',
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
                itemCount: objetosFiltrados.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  var objeto = objetosFiltrados[index];
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
                                      objeto['imagen']!,
                                      height: 200,
                                      width: 200,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    objeto['nombre']!,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  infoText('Uso:', objeto['uso']!),
                                  infoText('Departamento:', objeto['departamento']!),
                                  infoText('Fecha de adquisición:', objeto['fechaAdquisicion']!),
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
                            objeto['imagen']!,
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          objeto['nombre']!,
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
