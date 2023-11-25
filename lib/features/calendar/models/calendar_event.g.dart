// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CalendarEvent _$CalendarEventFromJson(Map<String, dynamic> json) =>
    CalendarEvent(
      eventOwner: json['eventOwner'] as String?,
      eventTitle: json['eventTitle'] as String,
      eventDate: const DateTimeConverter().fromJson(json['eventDate'] as int),
      documentId: json['documentId'] as String?,
      eventColor: const ColorConverter().fromJson(json['eventColor'] as int),
      eventDescription: json['eventDescription'] as String?,
      eventTime: const NullabeleDateTimeConverter()
          .fromJson(json['eventTime'] as int?),
    );

Map<String, dynamic> _$CalendarEventToJson(CalendarEvent instance) =>
    <String, dynamic>{
      'documentId': instance.documentId,
      'eventOwner': instance.eventOwner,
      'eventTitle': instance.eventTitle,
      'eventDescription': instance.eventDescription,
      'eventColor': const ColorConverter().toJson(instance.eventColor),
      'eventTime':
          const NullabeleDateTimeConverter().toJson(instance.eventTime),
      'eventDate': const DateTimeConverter().toJson(instance.eventDate),
    };
