import 'package:flutter/material.dart';

// 👉 Importa la página de Personajes
import 'personajes_page.dart';
import 'edificios_page.dart';
import 'objetos_page.dart';
import 'historia_page.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorías'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          CategoryItem(
            title: 'Personajes',
            imageUrl: 'https://i.ibb.co/b5pLgcsB/5bdd8f4d-14be-4c21-b9a5-2e135a9d90cb.jpg',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PersonajesPage()),
              );
            },
          ),
          const SizedBox(height: 12),
          CategoryItem(
            title: 'Edificios',
            imageUrl: 'https://i.ibb.co/zhC4PN4B/6c9d5ddd-b3ab-4c43-a6f9-5c8a8060e30f.jpg',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EdificiosPage()),
              );
            },
          ),
          const SizedBox(height: 12),
          CategoryItem(
            title: 'Objetos',
            imageUrl: 'https://i.ibb.co/fd73Vr5c/fea46e1f-9629-4053-b201-fdc168665d6b.jpg',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ObjetosPage()),
              );
            },
          ),
          const SizedBox(height: 12),
          CategoryItem(
            title: 'Historia',
            imageUrl: 'https://i.ibb.co/GvjryrDn/04bff2d7-c7c3-4858-9ed8-45dd0a3c2e0f.jpg',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HistoriaPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final VoidCallback onTap;

  const CategoryItem({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 4,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Image.network(
                imageUrl,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                color: Colors.black.withOpacity(0.5),
                child: Text(
                  title,
                  style: const TextStyle(
                      color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
