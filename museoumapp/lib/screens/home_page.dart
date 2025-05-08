import 'package:flutter/material.dart';
import 'blog_detail_page.dart';
import 'categories_page.dart';
import 'legados_page.dart';
import 'proyectosEducativos_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.menu, size: 28),
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/ismaelCastillo.jpg'),
                    radius: 20,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Bienvenido al Museo Virtual UM',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Categorías',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CategoriesPage()),
                      );
                    },
                    child: const Text(
                      'Ver más',
                      style: TextStyle(
                        color: Colors.indigo,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 180,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildCategoryCard(
                      context: context,
                      imagePath: 'assets/ismaelCastillo.jpg',
                      title: 'Personajes',
                    ),
                    const SizedBox(width: 12),
                    _buildCategoryCard(
                      context: context,
                      imagePath: 'assets/Dormi3.jpg',
                      title: 'Edificios',
                    ),
                    const SizedBox(width: 12),
                    _buildCategoryCard(
                      context: context,
                      imagePath: 'assets/Objeto1.jpg',
                      title: 'Objetos',
                    ),
                    const SizedBox(width: 12),
                    _buildCategoryCard(
                      context: context,
                      imagePath: 'assets/historia1.jpg',
                      title: 'Historia',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: const [
    Text('Blog', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    Text('Ver todos', style: TextStyle(color: Colors.indigo)),
  ],
),
const SizedBox(height: 12),
_buildBlogItem(
  'Legados',
  'https://i.ibb.co/Ng25np1K/7ab1ebe1-2bf4-4c6d-9109-3b7694420a7f.jpg',
  'Descubre cómo funcionan los legados en el Museo Universitario',
  context,
  LegadosPage(), 
),
_buildBlogItem(
  'Proyectos Educativos',
  'https://i.ibb.co/Sw95jzws/ced85fac-c486-4fcd-b39e-3b8623ce98ae.jpg',
  'Iniciativas que promueven el aprendizaje a través del arte y la cultura.',
  context,
  ProyectosEducativosPage(), 
),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard({
    required BuildContext context,
    required String imagePath,
    required String title,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CategoriesPage()),
        );
      },
      child: Container(
        width: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 10,
              bottom: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'Ver más',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBlogItem(String titulo, String imagen, String descripcion, BuildContext context, Widget destino) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => destino),
      );
    },
    child: Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 6, offset: const Offset(0, 3))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.network(imagen, height: 160, width: double.infinity, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(titulo, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(descripcion, style: const TextStyle(fontSize: 14, color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
}
