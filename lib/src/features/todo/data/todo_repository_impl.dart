import 'package:home_cloud/src/features/todo/data/todo_service.dart';
import 'package:home_cloud/src/features/todo/models/todo_model.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoService _service = TodoService();

  @override
  Future<List<TodoModel>> fetchData() {
    return _service.fetchData();
  }

  @override
  Future<void> createData(
    String? documentId,
    Map<String, dynamic> newDocumentObject,
  ) {
    return _service.createData(documentId, newDocumentObject);
  }

  @override
  Future<void> deleteData(String documentId) {
    return _service.deleteData(documentId);
  }
}

abstract class TodoRepository {
  Future<List<TodoModel>> fetchData();

  Future<void> createData(
    String? documentId,
    Map<String, dynamic> newDocumentObject,
  );

  Future<void> deleteData(String documentId);
}
