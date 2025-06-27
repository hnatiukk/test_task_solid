import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_task_solid/features/random_background_color/bloc/background_color_bloc.dart';
import 'package:test_task_solid/features/random_background_color/widgets/text_block.dart';

void main() {
  testWidgets('TextBlock displays all required texts', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider(
          create: (_) => BackgroundColorBloc(),
          child: const Scaffold(body: TextBlock()),
        ),
      ),
    );

    expect(find.text('Hey there'), findsOneWidget);
    expect(find.textContaining('Current color HEX is:'), findsOneWidget);
    expect(find.text('Long press to copy'), findsOneWidget);
  });
}
