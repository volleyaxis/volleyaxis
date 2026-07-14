class Team {
  final String id;
  final String name;
  final String coach;
  final String ageCategory;
  final String gender;
  final DateTime createdAt;

  const Team({
    required this.id,
    required this.name,
    required this.coach,
    required this.ageCategory,
    required this.gender,
    required this.createdAt,
  });
}
