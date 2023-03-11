class TodoModel {
  final String? documentId;
  final String title;
  final String weekDay;
  final bool checked;

  TodoModel({
    required this.title,
    required this.weekDay,
    required this.checked,
    this.documentId,
  });

  TodoModel.fromMap(String? docId, Map<String, dynamic> document)
      : documentId = docId,
        title = document['title'] as String,
        weekDay = document['weekDay'] as String,
        checked = document['checked'] as bool;

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'weekDay': weekDay,
      'checked': checked,
    };
  }
}
