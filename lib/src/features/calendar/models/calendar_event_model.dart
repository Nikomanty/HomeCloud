import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CalendarEventModel {
  String? eventOwner;
  String eventTitle;
  String? eventDescription;
  Color? eventColor;
  DateTime? eventTime;
  DateTime eventDate;
  String documentId;

  CalendarEventModel({
    this.eventOwner,
    required this.eventTitle,
    required this.eventDate,
    required this.documentId,
    this.eventColor,
    this.eventDescription,
    this.eventTime,
  });

  factory CalendarEventModel.fromDocument(DocumentSnapshot document) {
    return CalendarEventModel(
      eventOwner: document['eventOwner'] as String,
      eventTitle: document['eventTitle'] as String,
      eventDescription: document['eventDescription'] as String,
      eventTime: document['eventTime'] != null
          ? DateTime.fromMillisecondsSinceEpoch(document['eventTime'] as int)
          : null,
      eventDate: DateTime.fromMillisecondsSinceEpoch(document['eventDate'] as int),
      eventColor: document['eventColor'] != null
          ? Color((document['eventColor'] as int))
          : null,
      documentId: document.id,
    );
  }
}