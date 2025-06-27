import 'package:flutter/material.dart';

/// State of background color bloc
class BackgroundColorState {
  /// Stores current background color
  final Color color;

  /// Returns HEX value as [String]
  String get hex {
    final r = _channelValueToString(color.r);
    final g = _channelValueToString(color.g);
    final b = _channelValueToString(color.b);
    return '#${r.toUpperCase()}${g.toUpperCase()}${b.toUpperCase()}';
  }

  /// Recreates the logic of deprecated [Color] getters
  /// (red, green, blue) but returns result as a [String]
  String _channelValueToString(double value) {
    return ((value * 255.0).round() & 0xff).toRadixString(16).padLeft(2, '0');
  }

  /// Creates new state value
  ///
  /// [color] - object of [Color]
  BackgroundColorState(this.color);
}
