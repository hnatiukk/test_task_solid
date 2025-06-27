import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_solid/features/random_background_color/bloc/background_color_event.dart';
import 'package:test_task_solid/features/random_background_color/bloc/background_color_state.dart';

/// Bloc related to background color changes
class BackgroundColorBloc
    extends Bloc<BackgroundColorEvent, BackgroundColorState> {
  /// Creates [BackgroundColorBloc],
  /// initial state value is white color
  BackgroundColorBloc() : super(BackgroundColorState(Colors.white)) {
    on<SetRandomBackgroundColor>(
      (event, emit) => emit(BackgroundColorState(_generateRandomColor())),
    );
  }

  // I also was thinking about variant
  // where color is picking randomly from defined color list
  Color _generateRandomColor() {
    // Alpha is always max, no need to random this property
    const int alpha = 255;

    // Generating new RGB values from 0 to 255
    final Random random = Random();
    final int red = random.nextInt(256);
    final int green = random.nextInt(256);
    final int blue = random.nextInt(256);

    return Color.fromARGB(alpha, red, green, blue);
  }
}
