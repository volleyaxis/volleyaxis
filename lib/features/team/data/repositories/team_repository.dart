import 'package:volleyaxis/features/team/data/models/team.dart';

class TeamRepository {
  TeamRepository._();

  static final TeamRepository instance = TeamRepository._();

  final List<Team> _teams = [];

  List<Team> getTeams() {
    return List.unmodifiable(_teams);
  }

  void addTeam(Team team) {
    _teams.add(team);
  }

  void removeTeam(String id) {
    _teams.removeWhere((team) => team.id == id);
  }

  void clear() {
    _teams.clear();
  }
}
