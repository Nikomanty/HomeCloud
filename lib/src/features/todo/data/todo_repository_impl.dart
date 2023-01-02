import 'package:home_cloud/src/features/todo/data/todo_service.dart';
import 'package:home_cloud/src/features/todo/models/todo_item_model.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoService _service = TodoService();

  @override
  Future<List<TodoItemModel>> fetchData() {
    return _service.fetchData();
  }
}

abstract class TodoRepository {
  Future<List<TodoItemModel>> fetchData();
}
