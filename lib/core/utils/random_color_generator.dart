import 'dart:math';
import 'package:flutter/material.dart';

class RandomColorGenerator {
  static final Random _random = Random();

  static Color generateRandomColor() {
    // Alpha is always max, no need to random this property
    const int alpha = 255;

    // Generating new RGB values from 0 to 255
    final int red = _random.nextInt(256);
    final int green = _random.nextInt(256);
    final int blue = _random.nextInt(256);

    return Color.fromARGB(alpha, red, green, blue);
  }
}
