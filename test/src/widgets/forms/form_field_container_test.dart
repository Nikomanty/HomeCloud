import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_cloud/src/core/constants/styles.dart';
import 'package:home_cloud/src/widgets/forms/form_field_container.dart';

void main() {
  testWidgets("Tests form input field widget", (widgetTester) async {
    await widgetTester.pumpWidget(
      const MaterialApp(
        home: FormFieldContainer(
            fieldIcon: Icons.person, child: Text("Test content")),
      ),
    );

    final decoratedBoxFinder = find.byType(DecoratedBox);
    expect(decoratedBoxFinder, findsOneWidget);

    DecoratedBox decoratedBox = widgetTester.widget(decoratedBoxFinder);
    var decoration = decoratedBox.decoration as BoxDecoration;
    expect(decoration.borderRadius, Styles.smallRoundedCorner);

    expect(find.byIcon(Icons.person), findsOneWidget);
    expect(find.byType(Text), findsOneWidget);
  });
}
