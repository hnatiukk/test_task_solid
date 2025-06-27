import 'dart:ui' show Color;

/// State of background color bloc
class BackgroundColorState {
  /// Stores current background color
  final Color color;

  /// Returns red channel value as [String]
  String get r => color.r.toStringAsFixed(3);

  /// Returns green channel value as [String]
  String get g => color.g.toStringAsFixed(3);

  /// Returns blue channel value as [String]
  String get b => color.b.toStringAsFixed(3);

  /// Creates new state value
  ///
  /// [color] - object of [Color]
  BackgroundColorState(this.color);
}
