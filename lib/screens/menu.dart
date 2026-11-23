import 'package:material_ui/material_ui.dart';
import '../widgets/experience_card.dart';
import '../widgets/left_drawer.dart';
import '../widgets/project_card.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Portfolio'),
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
      ),
      drawer: const LeftDrawer(),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            ProjectCard(),
            ExperienceCard(),
          ],
        ),
      ),
    );
  }
}