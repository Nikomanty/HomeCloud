import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_cloud/src/core/constants/shared_strings.dart';
import 'package:home_cloud/src/widgets/dialog/dialog_action_button_row.dart';

void main() {
  Widget createWidgetUnderTest() {
    return MaterialApp(
      title: 'News App',
      home: DialogActionButtonRow(
          confirmAction: Completer<void>().complete,
          confirmButtonTitle: "Confirm"),
    );
  }

  testWidgets(
    "Tests dialog button row content",
    (widgetTester) async {
      await widgetTester.pumpWidget(createWidgetUnderTest());

      final cancelTextButtonFinder = find.byKey(const Key("cancel_button"));
      final confirmTextButtonFinder = find.byKey(const Key("confirm_button"));

      expect(cancelTextButtonFinder, findsOneWidget);
      expect(confirmTextButtonFinder, findsOneWidget);

      expect(find.text(SharedStrings.cancelString), findsOneWidget);
      expect(find.text("Confirm"), findsOneWidget);
    },
  );
}
