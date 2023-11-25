import 'package:flutter/material.dart';
import 'package:home_cloud/core/converters/color_converter.dart';
import 'package:home_cloud/core/converters/datetime_converter.dart';
import 'package:home_cloud/core/converters/nullable_datetime_converter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'calendar_event.g.dart';

@JsonSerializable()
class CalendarEvent {
  late String? documentId;
  final String? eventOwner;
  final String eventTitle;
  final String? eventDescription;
  @ColorConverter()
  final Color eventColor;
  @NullabeleDateTimeConverter()
  final DateTime? eventTime;
  @DateTimeConverter()
  final DateTime eventDate;

  CalendarEvent({
    this.eventOwner,
    required this.eventTitle,
    required this.eventDate,
    required this.documentId,
    required this.eventColor,
    this.eventDescription,
    this.eventTime,
  });

  factory CalendarEvent.fromMap(String? docId, Map<String, dynamic> map) =>
      _$CalendarEventFromJson(map)..documentId = docId;

  Map<String, dynamic> toMap() => _$CalendarEventToJson(this);
}
