import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_solid/core/utils/random_color_generator.dart';
import 'package:test_task_solid/features/random_background_color/bloc/background_color_event.dart';
import 'package:test_task_solid/features/random_background_color/bloc/background_color_state.dart';

/// Bloc related to background color changes
class BackgroundColorBloc
    extends Bloc<BackgroundColorEvent, BackgroundColorState> {
  /// Creates [BackgroundColorBloc],
  /// initial state value is white color
  BackgroundColorBloc() : super(BackgroundColorState(Colors.white)) {
    on<SetRandomBackgroundColor>(
      (_, emit) => emit(
        BackgroundColorState(RandomColorGenerator.generateRandomColor()),
      ),
    );
  }
}
