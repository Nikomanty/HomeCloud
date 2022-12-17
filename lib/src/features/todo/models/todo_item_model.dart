import 'package:cloud_firestore/cloud_firestore.dart';

class TodoItemModel {
  final String title;
  final String? weekDay;
  final bool checked;
  final String documentId;

  TodoItemModel({
    required this.title,
    this.weekDay,
    required this.checked,
    required this.documentId,
  });

  factory TodoItemModel.fromJson(DocumentSnapshot document) {
    return TodoItemModel(
      title: document['title'],
      weekDay: document['weekDay'],
      checked: document['checked'],
      documentId: document.id,
    );
  }
}