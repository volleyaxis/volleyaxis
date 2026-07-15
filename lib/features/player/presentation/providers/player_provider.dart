import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:volleyaxis/features/player/data/models/player.dart';
import 'package:volleyaxis/features/player/data/repositories/player_repository.dart';

/// Repository Provider
final playerRepositoryProvider = Provider<PlayerRepository>((ref) {
  return PlayerRepository.instance;
});

/// Player State Provider
final playerProvider = StateNotifierProvider<PlayerNotifier, List<Player>>((
  ref,
) {
  final repository = ref.watch(playerRepositoryProvider);
  return PlayerNotifier(repository);
});

class PlayerNotifier extends StateNotifier<List<Player>> {
  PlayerNotifier(this._repository) : super(_repository.getPlayers());

  final PlayerRepository _repository;

  void addPlayer(Player player) {
    _repository.addPlayer(player);
    state = _repository.getPlayers();
  }

  void removePlayer(String id) {
    _repository.removePlayer(id);
    state = _repository.getPlayers();
  }

  void clearPlayers() {
    _repository.clear();
    state = _repository.getPlayers();
  }

  List<Player> playersByTeam(String teamId) {
    return _repository.getPlayersByTeam(teamId);
  }

  Player? getPlayer(String id) {
    return _repository.getPlayer(id);
  }
}
