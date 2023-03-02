import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_cloud/src/widgets/buttons/app_bar_action_button.dart';

void main() {
  testWidgets("Tests AppBarActionButton title and void callback",
      (widgetTester) async {
    final voidCallCompleter = Completer<void>();
    await widgetTester.pumpWidget(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: [
            AppBarActionButton(
              action: voidCallCompleter.complete,
              title: "Test button",
            ),
          ],
        ),
      ),
    ));

    final elevatedButtonFinder = find.byType(ElevatedButton);
    final buttonTitleFinder = find.byType(Text);

    expect(elevatedButtonFinder, findsOneWidget);
    expect(buttonTitleFinder, findsOneWidget);

    Text buttonTitle = widgetTester.firstWidget<Text>(buttonTitleFinder);
    expect(buttonTitle.data, "Test button");

    await widgetTester.tap(elevatedButtonFinder);
    await widgetTester.pump();
    expect(voidCallCompleter.isCompleted, isTrue);
  });
}
