import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_solid/core/constants/ui_constants.dart';
import 'package:test_task_solid/features/random_background_color/bloc/background_color_bloc.dart';
import 'package:test_task_solid/features/random_background_color/bloc/background_color_state.dart';

/// Widget that displays "Hey there" text,
/// info about current background  color
/// and "Long press to copy" text
class TextBlock extends StatelessWidget {
  /// Creates [TextBlock] widget
  const TextBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(defaultBorderRadius),
      ),
      padding: const EdgeInsets.all(defaultSpacing),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: defaultSpacing,
        children: [
          const Text('Hey there'),
          BlocBuilder<BackgroundColorBloc, BackgroundColorState>(
            builder: (_, state) {
              return Text('Current color HEX is: ${state.hex}');
            },
          ),
          const Text('Long press to copy'),
        ],
      ),
    );
  }
}
