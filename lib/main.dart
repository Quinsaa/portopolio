import 'package:flutter/material.dart';
import 'package:portofolio/page/about.dart';

import 'page/profil.dart';
import 'page/home.dart';
import 'page/project.dart';
import 'page/skill.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'menu navigasi',
      home: const HomePage(),
      routes: {
        '/profil': (context) => const Profil(),
        '/skill': (context) => const skill(),
        '/project': (context) => const project(),
        '/home': (context) => const HomePage(),
        '/about': (context) => const about(),
      },
    );
  }
}