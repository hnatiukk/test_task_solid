import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_task_solid/features/random_background_color/bloc/background_color_bloc.dart';
import 'package:test_task_solid/features/random_background_color/bloc/background_color_event.dart';
import 'package:test_task_solid/features/random_background_color/bloc/background_color_state.dart';

void main() {
  group('BackgroundColorBloc', () {
    test('initial color should be Colors.white', () {
      final bloc = BackgroundColorBloc();
      expect(bloc.state.color, Colors.white);
    });

    // Possibly can fail if the new random value
    // is the same as the initial,
    // but the chance is 1 / 16777216
    blocTest<BackgroundColorBloc, BackgroundColorState>(
      'emits a new random color when SetRandomBackgroundColor is added',
      build: BackgroundColorBloc.new,
      act: (bloc) => bloc.add(SetRandomBackgroundColor()),
      expect: () => [
        isA<BackgroundColorState>().having(
          (s) => s.color,
          'color',
          isNot(Colors.white),
        ),
      ],
    );
  });
}
