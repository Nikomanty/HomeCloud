import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_cloud/widgets/error/centered_error_text.dart';

void main() {
  String errorMessage = "This is an error!";

  Widget createWidgetUnderTestWithErrorMessage() {
    return MaterialApp(
      title: 'News App',
      home: CenteredErrorText(errorMessage: errorMessage),
    );
  }

  Widget createWidgetUnderTestWithoutErrorMessage() {
    return const MaterialApp(
      title: 'News App',
      home: CenteredErrorText(),
    );
  }

  testWidgets(
    "Error message should be same as errorMessage",
    (widgetTester) async {
      await widgetTester.pumpWidget(createWidgetUnderTestWithErrorMessage());

      final textFinder = find.byType(Text);
      Text text = widgetTester.widget(textFinder);

      expect(textFinder, findsOneWidget);
      expect(text.data, errorMessage);
    },
  );

  testWidgets(
    """Error message should be not found 
    when message is null""",
    (widgetTester) async {
      await widgetTester.pumpWidget(createWidgetUnderTestWithoutErrorMessage());

      final textFinder = find.byType(Text);
      Text text = widgetTester.widget(textFinder);

      expect(textFinder, findsOneWidget);
      expect(text.data, "No error message found.");
    },
  );
}
