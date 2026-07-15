import 'package:volleyaxis/core/enums/dominant_hand.dart';
import 'package:volleyaxis/core/enums/player_position.dart';

class Player {
  final String id;
  final String teamId;

  final String firstName;
  final String lastName;

  final int jerseyNumber;

  final PlayerPosition position;

  final DominantHand dominantHand;

  final int birthYear;

  final int heightCm;

  final bool isCaptain;

  final bool isLibero;

  final bool isActive;

  final DateTime createdAt;

  const Player({
    required this.id,
    required this.teamId,
    required this.firstName,
    required this.lastName,
    required this.jerseyNumber,
    required this.position,
    required this.dominantHand,
    required this.birthYear,
    required this.heightCm,
    required this.isCaptain,
    required this.isLibero,
    required this.isActive,
    required this.createdAt,
  });

  String get fullName => '$firstName $lastName';
}
