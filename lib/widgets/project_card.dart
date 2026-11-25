import 'package:material_ui/material_ui.dart';
import 'package:myportofolio_mobile/screens/project_form.dart';
import 'package:myportofolio_mobile/screens/project_list_screen.dart';
import 'package:myportofolio_mobile/widgets/auth_guard.dart';

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
            const Icon(Icons.folder, size: 40, color: Colors.blue),

            const SizedBox(height: 12),

            const Text(
              'My Projects',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            const Text('Manage and add your portfolio projects here.'),

            const SizedBox(height: 16),

            // Tombol BARU: lihat daftar proyek dari Django
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProjectListScreen(),
                    ),
                  );
                },
                child: const Text('Lihat Proyek'),
              ),
            ),

            const SizedBox(height: 8),

            // Tombol LAMA: sekarang dicek login dulu
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  final navigator = Navigator.of(context);
                  if (!await ensureLoggedIn(context)) return;
                  navigator.push(
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
