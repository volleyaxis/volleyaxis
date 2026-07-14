import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:volleyaxis/features/team/data/models/team.dart';
import 'package:volleyaxis/features/team/data/repositories/team_repository.dart';

/// Repository Provider
final teamRepositoryProvider = Provider<TeamRepository>((ref) {
  return TeamRepository.instance;
});

/// Team State Provider
final teamProvider = StateNotifierProvider<TeamNotifier, List<Team>>((ref) {
  final repository = ref.watch(teamRepositoryProvider);
  return TeamNotifier(repository);
});

class TeamNotifier extends StateNotifier<List<Team>> {
  TeamNotifier(this._repository) : super(_repository.getTeams());

  final TeamRepository _repository;

  void addTeam(Team team) {
    _repository.addTeam(team);
    state = _repository.getTeams();
  }

  void removeTeam(String id) {
    _repository.removeTeam(id);
    state = _repository.getTeams();
  }

  void clearTeams() {
    _repository.clear();
    state = _repository.getTeams();
  }
}
