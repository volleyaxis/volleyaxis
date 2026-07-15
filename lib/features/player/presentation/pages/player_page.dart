import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:volleyaxis/features/player/presentation/pages/create_player_page.dart';
import 'package:volleyaxis/features/player/presentation/providers/player_provider.dart';

class PlayerPage extends ConsumerWidget {
  const PlayerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final players = ref.watch(playerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Players')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CreatePlayerPage()),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: players.isEmpty
          ? const _EmptyPlayerView()
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: players.length,
              itemBuilder: (context, index) {
                final player = players[index];

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(
                        '#${player.jerseyNumber}',
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                    title: Text(player.fullName),
                    subtitle: Text(
                      '${player.position} • ${player.heightCm} cm',
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {},
                  ),
                );
              },
            ),
    );
  }
}

class _EmptyPlayerView extends StatelessWidget {
  const _EmptyPlayerView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.person_outline, size: 80, color: Colors.grey),
          SizedBox(height: 20),
          Text(
            'No Players Yet',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              'Tap the + button to add your first player.',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
