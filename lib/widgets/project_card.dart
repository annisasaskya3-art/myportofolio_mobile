import 'package:material_ui/material_ui.dart';
import '../screens/project_form.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.folder,
              size: 40,
              color: Colors.blue,
            ),

            const SizedBox(height: 12),

            const Text(
              'My Projects',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Manage and add your portfolio projects here.',
            ),

            const SizedBox(height: 16),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProjectFormPage(),
                    ),
                  );
                },
                child: const Text('Tambah Proyek'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}