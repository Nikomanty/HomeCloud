import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:home_cloud/features/todo/models/todo.dart';

class TodoService {
  final FirebaseFirestore _database = FirebaseFirestore.instance;
  static const String collectionPath = "todo-items";

  Future<List<Todo>> fetchData() async {
    QuerySnapshot<Map<String, dynamic>> todoData =
        await _database.collection(collectionPath).get();
    return todoData.docs.map((documentSnapshot) {
      return Todo.fromMap(documentSnapshot.id, documentSnapshot.data());
    }).toList();
  }

  Future<void> createData(
    String? documentID,
    Map<String, dynamic> newDocumentObject,
  ) async {
    await _database
        .collection(collectionPath)
        .doc(documentID)
        .set(newDocumentObject);
  }

  Future<void> deleteData(String? documentId) async {
    await _database.collection(collectionPath).doc(documentId).delete();
  }
}
