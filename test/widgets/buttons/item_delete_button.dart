import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_cloud/src/features/todo/models/todo_model.dart';
import 'package:home_cloud/src/widgets/buttons/item_delete_button.dart';

void main() {
  List<TodoModel> modelList = [];
  Widget deleteIconButtonWidget = MaterialApp(
    home: Scaffold(body: ItemDeleteButton(deleteItem: () {
      modelList.removeAt(0);
    })),
  );

  setUp(() {
    modelList = [
      TodoModel(title: "First Todo", checked: false, documentId: "1"),
      TodoModel(title: "Second Todo", checked: false, documentId: "2"),
      TodoModel(title: "Third Todo", checked: false, documentId: "3"),
    ];
  });

  testWidgets("Tests item deletion", (widgetTester) async {
    await widgetTester.pumpWidget(deleteIconButtonWidget);
    expect(modelList.length, 3);

    final deleteButtonFinder = find.byType(IconButton);

    await widgetTester.tap(deleteButtonFinder);
    await widgetTester.pump();

    final dialogConfirmButtonFinder =
        find.byKey(const ValueKey("item_delete_confirm"));
    await widgetTester.tap(dialogConfirmButtonFinder);
    expect(modelList.length, 2);
  });

  testWidgets("Tests item deletion but it's canceled", (widgetTester) async {
    await widgetTester.pumpWidget(deleteIconButtonWidget);
    expect(modelList.length, 3);

    final deleteButtonFinder = find.byType(IconButton);

    await widgetTester.tap(deleteButtonFinder);
    await widgetTester.pump();

    final dialogCancelButtonFinder =
        find.byKey(const ValueKey("item_delete_cancel"));
    await widgetTester.tap(dialogCancelButtonFinder);
    expect(modelList.length, 3);
  });
}
