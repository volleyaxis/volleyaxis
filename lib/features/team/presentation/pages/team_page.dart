import 'package:flutter/material.dart';
import 'package:volleyaxis/features/team/presentation/pages/create_team_page.dart';

class TeamPage extends StatelessWidget {
  const TeamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Teams')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CreateTeamPage()),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.groups, size: 80, color: Colors.grey),
            SizedBox(height: 20),
            Text(
              'No Teams Yet',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Tap the + button to create your first team.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
