import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_cloud/src/widgets/dialog/open_dialog_icon_button.dart';

void main() {
  Widget itemEditButton = MaterialApp(
      home: Scaffold(
    body: OpenDialogIconButton(
        icon: Icons.edit_outlined, dialogContent: Container()),
  ));

  testWidgets("Tests edit button for dialog open", (widgetTester) async {
    await widgetTester.pumpWidget(itemEditButton);
    final editButtonFinder = find.byType(InkWell);
    await widgetTester.tap(editButtonFinder);
    await widgetTester.pump();
    expect(find.byType(AlertDialog), findsOneWidget);
  });
}
