import 'package:flutter/material.dart';
import 'screens/login.dart';
import 'screens/register_page.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const MuseoApp());
}

class MuseoApp extends StatelessWidget {
  const MuseoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Museo Universitario',
      debugShowCheckedModeBanner: false, // Para quitar la banda de debug
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      
      home: const LoginPage(), 
    );
  }
}
