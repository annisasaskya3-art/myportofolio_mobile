import 'package:flutter/material.dart';
import '../widgets/left_drawer.dart';
import '../widgets/project_card.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Portfolio'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      drawer: const LeftDrawer(),

      body: const SingleChildScrollView(
        child: Column(
          children: [
            ProjectCard(),
          ],
        ),
      ),
    );
  }
}