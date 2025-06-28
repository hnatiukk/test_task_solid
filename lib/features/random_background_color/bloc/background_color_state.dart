import 'package:flutter/material.dart';

/// State of background color bloc
class BackgroundColorState {
  /// Stores current background color
  final Color color;

  static const int _maxChannelValue = 255;
  static const int _channelMask = 0xff;
  static const int _hexRadix = 16;
  static const int _channelHexLength = 2;

  /// Returns HEX value as [String]
  String get hex {
    final r = _channelValueToString(color.r);
    final g = _channelValueToString(color.g);
    final b = _channelValueToString(color.b);

    return '#${r.toUpperCase()}${g.toUpperCase()}${b.toUpperCase()}';
  }

  /// Creates new state value
  ///
  /// [color] - object of [Color]
  BackgroundColorState(this.color);

  /// Recreates the logic of deprecated [Color] getters
  /// (red, green, blue) but returns result as a [String]
  String _channelValueToString(double value) {
    return ((value * _maxChannelValue).round() & _channelMask)
        .toRadixString(_hexRadix)
        .padLeft(_channelHexLength, '0');
  }
}
