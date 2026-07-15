enum PlayerPosition { setter, outsideHitter, opposite, middleBlocker, libero }

extension PlayerPositionExtension on PlayerPosition {
  String get label {
    switch (this) {
      case PlayerPosition.setter:
        return 'Setter';

      case PlayerPosition.outsideHitter:
        return 'Outside Hitter';

      case PlayerPosition.opposite:
        return 'Opposite';

      case PlayerPosition.middleBlocker:
        return 'Middle Blocker';

      case PlayerPosition.libero:
        return 'Libero';
    }
  }
}
