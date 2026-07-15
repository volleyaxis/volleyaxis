import 'package:volleyaxis/features/player/data/models/player.dart';

class PlayerRepository {
  PlayerRepository._();

  static final PlayerRepository instance = PlayerRepository._();

  final List<Player> _players = [];

  List<Player> getPlayers() {
    return List.unmodifiable(_players);
  }

  List<Player> getPlayersByTeam(String teamId) {
    return _players
        .where((player) => player.teamId == teamId)
        .toList(growable: false);
  }

  void addPlayer(Player player) {
    _players.add(player);
  }

  void removePlayer(String id) {
    _players.removeWhere((player) => player.id == id);
  }

  Player? getPlayer(String id) {
    try {
      return _players.firstWhere((player) => player.id == id);
    } catch (_) {
      return null;
    }
  }

  void clear() {
    _players.clear();
  }
}
