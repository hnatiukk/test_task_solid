import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_solid/core/utils/snack_bar_util.dart';
import 'package:test_task_solid/features/random_background_color/bloc/background_color_bloc.dart';
import 'package:test_task_solid/features/random_background_color/bloc/background_color_event.dart';
import 'package:test_task_solid/features/random_background_color/bloc/background_color_state.dart';
import 'package:test_task_solid/features/random_background_color/widgets/text_block.dart';

/// Main screen of the app,
/// changes background color and displays info at the center
class RandomBackgroundColorScreen extends StatelessWidget {
  /// Creates [RandomBackgroundColorScreen] widget
  const RandomBackgroundColorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<BackgroundColorBloc, BackgroundColorState>(
          builder: (context, state) {
            return GestureDetector(
              onTap: () => _setRandomBackgroundColor(context),
              onLongPress: () =>
                  _copyBackgroundColorHexToClipboard(context, state.hex),
              child: AnimatedContainer(
                color: state.color,
                duration: const Duration(milliseconds: 200),
                child: const Center(child: TextBlock()),
              ),
            );
          },
        ),
      ),
    );
  }

  /// Set random background color callback
  void _setRandomBackgroundColor(BuildContext context) {
    context.read<BackgroundColorBloc>().add(SetRandomBackgroundColor());
  }

  /// Copy hex to clipboard callback
  void _copyBackgroundColorHexToClipboard(BuildContext context, String hex) {
    Clipboard.setData(ClipboardData(text: hex));
    SnackBarUtil.showMessage(context, 'Hex copied');
  }
}
