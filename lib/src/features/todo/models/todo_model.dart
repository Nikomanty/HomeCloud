import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  final String title;
  final String? weekDay;
  final bool checked;
  final String documentId;

  TodoModel({
    required this.title,
    this.weekDay,
    required this.checked,
    required this.documentId,
  });

  factory TodoModel.fromJson(DocumentSnapshot document) {
    return TodoModel(
      title: document['title'] as String,
      weekDay: document['weekDay'] as String,
      checked: document['checked'] as bool,
      documentId: document.id,
    );
  }
}