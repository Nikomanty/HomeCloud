import 'package:json_annotation/json_annotation.dart';

class NullabeleDateTimeConverter implements JsonConverter<DateTime?, int?> {
  const NullabeleDateTimeConverter();

  @override
  DateTime? fromJson(int? json) {
    return json != null ? DateTime.fromMillisecondsSinceEpoch(json) : null;
  }

  @override
  int? toJson(DateTime? object) {
    return object?.millisecondsSinceEpoch;
  }
}
