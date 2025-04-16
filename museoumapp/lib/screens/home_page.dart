import 'package:flutter/material.dart';

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
              // Perfil y menú
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.menu, size: 28),
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/ismaelCastillo.jpg'), // Imagen de perfil
                    radius: 20,
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Título
              const Text(
                'Bienvenido al Museo Virtual UM',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              // Buscador
              TextField(
                decoration: InputDecoration(
                  hintText: 'Buscar',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Categorías
              const Text(
  'Categorías',
  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
),
const SizedBox(height: 12),
SizedBox(
  height: 180,
  child: ListView(
    scrollDirection: Axis.horizontal,
    children: [
      _buildCategoryCard(
        imagePath: 'assets/ismaelCastillo.jpg',
        title: 'Personajes',
        onTap: () {},
      ),
      const SizedBox(width: 12),
      _buildCategoryCard(
        imagePath: 'assets/Dormi3.jpg',
        title: 'Edificios',
        onTap: () {},
      ),
      const SizedBox(width: 12),
      _buildCategoryCard(
        imagePath: 'assets/Objeto1.jpg',
        title: 'Objetos',
        onTap: () {},
      ),
      const SizedBox(width: 12),
      _buildCategoryCard(
        imagePath: 'assets/historia1.jpg', 
        title: 'Historia',
        onTap: () {},
      ),
    ],
  ),
),
const SizedBox(height: 24),

              // Blog
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
              'https://i.ibb.co/C3BmpH8g/museo.jpg',
              'Descubre cómo funcionan los legados en el Museo Universitario',
            ),
            _buildBlogItem(
              'Proyectos Educativos',
              'https://i.ibb.co/4nd9phdK/museo2.jpg',
              'Iniciativas que promueven el aprendizaje a través del arte y la cultura.',
            ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard({required String imagePath, required String title, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
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

  Widget _buildBlogItem(String title, String imageUrl, String description) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 24.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 220,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, progress) {
                if (progress == null) return child;
                return Center(child: CircularProgressIndicator());
              },
              errorBuilder: (context, error, stackTrace) {
                return Center(child: Icon(Icons.error, color: Colors.red));
              },
            ),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            const Icon(Icons.bookmark, color: Colors.indigo, size: 22),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          description,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[700],
            height: 1.4,
          ),
        ),
      ],
    ),
  );
}


}
