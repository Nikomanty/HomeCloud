import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:home_cloud/src/features/todo/models/todo_item_model.dart';

class TodoService {
  final FirebaseFirestore _database = FirebaseFirestore.instance;

  Future<List<TodoItemModel>> fetchData() async {
    QuerySnapshot<Map<String, dynamic>> todoData =
        await _database.collection("todo-items").get();
    return todoData.docs
        .map((documentSnapshot) => TodoItemModel.fromJson(documentSnapshot))
        .toList();
  }
}
