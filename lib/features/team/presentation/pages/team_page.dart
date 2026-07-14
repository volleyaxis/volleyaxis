import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:volleyaxis/features/team/presentation/pages/create_team_page.dart';
import 'package:volleyaxis/features/team/presentation/providers/team_provider.dart';

class TeamPage extends ConsumerWidget {
  const TeamPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final teams = ref.watch(teamProvider);

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
      body: teams.isEmpty
          ? const _EmptyTeamView()
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: teams.length,
              itemBuilder: (context, index) {
                final team = teams[index];

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: const CircleAvatar(child: Icon(Icons.groups)),
                    title: Text(team.name),
                    subtitle: Text(
                      '${team.coach} • ${team.ageCategory} • ${team.gender}',
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Team Details (Sprint 4)
                    },
                  ),
                );
              },
            ),
    );
  }
}

class _EmptyTeamView extends StatelessWidget {
  const _EmptyTeamView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.groups, size: 80, color: Colors.grey),
          SizedBox(height: 20),
          Text(
            'No Teams Yet',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              'Tap the + button to create your first team.',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
