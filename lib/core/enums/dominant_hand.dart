enum DominantHand { left, right }

extension DominantHandExtension on DominantHand {
  String get label {
    switch (this) {
      case DominantHand.left:
        return 'Left';

      case DominantHand.right:
        return 'Right';
    }
  }
}
