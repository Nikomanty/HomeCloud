import 'package:flutter_test/flutter_test.dart';
import 'package:home_cloud/src/features/todo/models/todo_model.dart';

void main() {
  final Map<String, dynamic> testMap = {
    'title': "testModel",
    'weekDay': "Maanantai",
    'checked': false,
  };

  group("Tests TodoModel", () {
    test("Creating model from map should match with expected content", () {
      TodoModel createdTestModel = TodoModel.fromMap("123", testMap);
      expect(createdTestModel.title, "testModel");
      expect(createdTestModel.weekDay, "Maanantai");
      expect(createdTestModel.checked, false);
      expect(createdTestModel.documentId, "123");
    });

    test("Mapping Model to map should match sith testMap", () {
      TodoModel model = TodoModel(
        title: "testModel",
        weekDay: "Maanantai",
        checked: false,
      );

      Map<String, dynamic> mapFromModel = model.toMap();
      expect(mapFromModel, testMap);
    });
  });
}
