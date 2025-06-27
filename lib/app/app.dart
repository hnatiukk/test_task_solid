import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_solid/features/random_background_color/bloc/background_color_bloc.dart';
import 'package:test_task_solid/features/random_background_color/view/random_background_color_screen.dart';

/// Main app widget
class App extends StatelessWidget {
  /// Creates [App] widget
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test task',
      theme: ThemeData(useMaterial3: true),
      home: BlocProvider(
        create: (_) => BackgroundColorBloc(),
        child: const RandomBackgroundColorScreen(),
      ),
    );
  }
}
