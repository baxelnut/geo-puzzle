import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geopuzzle/levels/level4.dart';
import 'package:geopuzzle/my_button.dart';

void main() {
  testWidgets('Check if number is added correctly on button tap',
      (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: Stage0()));

    // Find a button with a certain number and tap it
    await tester.tap(find.widgetWithText(MyButton, '1'));
    await tester.pump();

    // Check if the number is added to userAnswer correctly
    expect(find.text('1'), findsOneWidget);
  });

  testWidgets('Check if user input is cleared on "C" button tap',
      (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: Stage0()));

    // Tap '1', '2', and 'C' buttons
    await tester.tap(find.widgetWithText(MyButton, '1'));
    await tester.pump();
    await tester.tap(find.widgetWithText(MyButton, '2'));
    await tester.pump();
    await tester.tap(find.widgetWithText(MyButton, 'C'));
    await tester.pump();

    // Check if userAnswer is cleared
    expect(find.text('12'), findsNothing);
  });

  // Add more test cases for other scenarios...
}
