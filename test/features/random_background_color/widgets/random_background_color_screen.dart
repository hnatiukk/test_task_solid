import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_task_solid/features/random_background_color/bloc/background_color_bloc.dart';
import 'package:test_task_solid/features/random_background_color/view/random_background_color_screen.dart';

void main() {
  testWidgets('Initial color is white', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider(
          create: (_) => BackgroundColorBloc(),
          child: const RandomBackgroundColorScreen(),
        ),
      ),
    );

    final animatedContainer = tester.widget<AnimatedContainer>(
      find.byType(AnimatedContainer),
    );

    final Decoration? decoration = animatedContainer.decoration;
    if (decoration == null) fail('Container has no initial color');

    final color = (decoration as BoxDecoration).color;
    expect(color, Colors.white);
  });

  testWidgets('Tap triggers color change', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider(
          create: (_) => BackgroundColorBloc(),
          child: const RandomBackgroundColorScreen(),
        ),
      ),
    );

    final Decoration? decorationBefore = tester
        .widget<AnimatedContainer>(find.byType(AnimatedContainer))
        .decoration;
    if (decorationBefore == null) fail('Container has no color before tap');

    final colorBefore = (decorationBefore as BoxDecoration).color;

    await tester.tap(find.byType(GestureDetector));
    await tester.pump(
      const Duration(milliseconds: 250), // waiting for animation to end
    );

    final Decoration? decorationAfter = tester
        .widget<AnimatedContainer>(find.byType(AnimatedContainer))
        .decoration;
    if (decorationAfter == null) fail('Container has no color after tap');

    final colorAfter = (decorationAfter as BoxDecoration).color;

    expect(colorBefore, isNot(colorAfter));
  });

  testWidgets('Long press shows snack bar', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider(
          create: (_) => BackgroundColorBloc(),
          child: const RandomBackgroundColorScreen(),
        ),
      ),
    );

    await tester.longPress(find.byType(GestureDetector));
    await tester.pump();

    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text('Hex copied'), findsOneWidget);
  });

  testWidgets('TextBlock displays correct HEX', (tester) async {
    final bloc = BackgroundColorBloc();
    final String expectedHex = bloc.state.hex;

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider.value(
          value: bloc,
          child: const RandomBackgroundColorScreen(),
        ),
      ),
    );

    expect(find.text('Current color HEX is: $expectedHex'), findsOneWidget);
  });

  testWidgets('TextBlock displays correct HEX after tap', (tester) async {
    final bloc = BackgroundColorBloc();

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider.value(
          value: bloc,
          child: const RandomBackgroundColorScreen(),
        ),
      ),
    );

    await tester.tap(find.byType(GestureDetector));
    await tester.pump();

    expect(
      find.text('Current color HEX is: ${bloc.state.hex}'),
      findsOneWidget,
    );
  });
}
