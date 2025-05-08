import 'package:flutter/material.dart';

class PersonajesPage extends StatefulWidget {
  const PersonajesPage({super.key});

  @override
  State<PersonajesPage> createState() => _PersonajesPageState();
}

class _PersonajesPageState extends State<PersonajesPage> {
  List<Map<String, String>> personajes = [
    {
      'nombre': 'Ismael Castillo',
      'imagen': 'https://i.ibb.co/b5pLgcsB/5bdd8f4d-14be-4c21-b9a5-2e135a9d90cb.jpg',
      'funcion': 'Rector de la Universidad de Montemorelos',
      'departamento': 'Rectoría',
      'fechaIngreso': '12/08/1989'
    },
    {
      'nombre': 'Daniel Gutierrez',
      'imagen': 'https://i.ibb.co/p9Cp1fb/daniel-gutierrez.jpg',
      'funcion': 'Director de la Facultad de Ingeniería y Tecnología',
      'departamento': 'Facultad de Ingeniería y Tecnología',
      'fechaIngreso': '03/03/2008'
    },
    {
      'nombre': 'Sheny Pet',
      'imagen': 'https://i.ibb.co/fzPQ1Kct/shenyPet.jpg',
      'funcion': 'Docente de la Facultad de Ingeniería y Tecnología',
      'departamento': 'Facultad de Ingeniería y Tecnología',
      'fechaIngreso': '18/09/2010'
    },
    {
      'nombre': 'Abimael Lozano',
      'imagen': 'https://i.ibb.co/mCQPNMT6/Abimael-Lozano.jpg',
      'funcion': 'Director del Departamento de Misiones',
      'departamento': 'Misiones',
      'fechaIngreso': '25/01/2007'
    },
    {
      'nombre': 'Adriana Castillo',
      'imagen': 'https://i.ibb.co/gbmX6Y0Y/adriana-Castillo.jpg',
      'funcion': 'Docente de la Facultad de Educación y Escuela Normal',
      'departamento': 'Facultad de Educación',
      'fechaIngreso': '10/05/2011'
    },
    {
      'nombre': 'Amalia Hernández',
      'imagen': 'https://i.ibb.co/0yNF77zN/Amalia-Hern.jpg',
      'funcion': 'Coordinadora del Departamento de Residencias',
      'departamento': 'Residencias',
      'fechaIngreso': '08/11/2006'
    },
    {
      'nombre': 'Carlos Mora',
      'imagen': 'https://i.ibb.co/jkJfpdNq/Carlos-Mora.jpg',
      'funcion': 'Docente de la Facultad de Teología',
      'departamento': 'Facultad de Teología',
      'fechaIngreso': '20/07/2009'
    },
    {
      'nombre': 'Germán Gallegos',
      'imagen': 'https://i.ibb.co/TqcHvL35/Germ-n-Gallegos.jpg',
      'funcion': 'Ingeniero del Departamento de Sistemas',
      'departamento': 'Sistemas',
      'fechaIngreso': '15/04/2012'
    },
    {
      'nombre': 'Carlos Hernández',
      'imagen': 'https://i.ibb.co/sBQ2snf/carlos-Hernandez.jpg',
      'funcion': 'Docente de la Facultad de Teología',
      'departamento': 'Facultad de Teología',
      'fechaIngreso': '22/02/2010'
    },
    {
      'nombre': 'José Mendoza',
      'imagen': 'https://i.ibb.co/gZC4CmXR/Jose-Mendoza.jpg',
      'funcion': 'Docente de la Facultad de Ingeniería y Tecnología',
      'departamento': 'Facultad de Ingeniería y Tecnología',
      'fechaIngreso': '03/06/2011'
    },
    {
      'nombre': 'Julio Prieto',
      'imagen': 'https://i.ibb.co/fYK0SGLh/julio-Prieto.jpg',
      'funcion': 'Desarrollador de Aplicaciones Web',
      'departamento': 'Departamento de Sistemas',
      'fechaIngreso': '01/12/2009'
    },
    {
      'nombre': 'Cecilia Castillo',
      'imagen': 'https://i.ibb.co/ynXWZKJ1/cecilia-Castillo.jpg',
      'funcion': 'Directora del Departamento de Sistemas',
      'departamento': 'Sistemas',
      'fechaIngreso': '17/09/2005'
    }
  ];

  String query = '';

  @override
  Widget build(BuildContext context) {
    var personajesFiltrados = personajes.where((personaje) {
      return personaje['nombre']!.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Personajes'),
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
            // 🖼️ Galería de personajes
            Expanded(
              child: GridView.builder(
                itemCount: personajesFiltrados.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  var personaje = personajesFiltrados[index];
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
            crossAxisAlignment: CrossAxisAlignment.center, // Centrar contenido
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  personaje['imagen']!,
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                personaje['nombre']!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              infoText('Función:', personaje['funcion']!),
              infoText('Departamento:', personaje['departamento']!),
              infoText('Fecha de ingreso:', personaje['fechaIngreso']!),
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
                            personaje['imagen']!,
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          personaje['nombre']!,
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
