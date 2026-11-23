import 'package:flutter/material.dart';
import '../screens/experience_form.dart';

/// Kartu aksi di halaman utama untuk membuka form pengalaman.
class ExperienceCard extends StatelessWidget {
  const ExperienceCard({super.key});

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Card(
      elevation: 3,
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.work, size: 40, color: primary),
            const SizedBox(height: 12),
            const Text(
              'Pengalaman Saya',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('Catat magang, organisasi, dan kepanitiaanmu.'),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ExperienceFormPage(),
                    ),
                  );
                },
                child: const Text('Tambah Pengalaman'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}