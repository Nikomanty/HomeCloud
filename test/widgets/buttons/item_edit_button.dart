import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_cloud/src/widgets/buttons/item_edit_button.dart';

void main() {
  Widget itemEditButton = MaterialApp(
    home: Scaffold(body: ItemEditButton(dialogContent: Container()),
  ));

  testWidgets("Tests edit button for dialog open", (widgetTester) async {
    await widgetTester.pumpWidget(itemEditButton);
    final editButtonFinder = find.byType(InkWell);
    await widgetTester.tap(editButtonFinder);
    await widgetTester.pump();
    expect(find.byType(AlertDialog), findsOneWidget);
  });
}