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
      'imagen': 'https://i.ibb.co/b5pLgcsB/5bdd8f4d-14be-4c21-b9a5-2e135a9d90cb.jpg'
    },
    {
      'nombre': 'Lorem Ipsum',
      'imagen': 'https://via.placeholder.com/150'
    },
    // Agrega más personajes aquí
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
                      // Aquí puedes navegar a la pantalla de detalles
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
}
