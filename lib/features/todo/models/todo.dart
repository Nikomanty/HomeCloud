import 'package:json_annotation/json_annotation.dart';

part 'todo.g.dart';

@JsonSerializable()
class Todo {
  @JsonKey(includeFromJson: false, includeToJson: false)
  late String? documentId;
  final String title;
  final String weekDay;
  final bool checked;

  Todo({
    required this.title,
    required this.weekDay,
    required this.checked,
    this.documentId,
  });

  factory Todo.fromMap(String? docId, Map<String, dynamic> document) =>
      _$TodoFromJson(document)..documentId = docId;

  Map<String, dynamic> toMap() => _$TodoToJson(this);
}
