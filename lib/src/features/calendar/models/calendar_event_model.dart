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
      eventOwner: document['eventOwner'],
      eventTitle: document['eventTitle'],
      eventDescription: document['eventDescription'],
      eventTime: document['eventTime'] != null
          ? DateTime.fromMillisecondsSinceEpoch(document['eventTime'])
          : null,
      eventDate: DateTime.fromMillisecondsSinceEpoch(document['eventDate']),
      eventColor: document['eventColor'] != null
          ? Color((document['eventColor']))
          : null,
      documentId: document.id,
    );
  }
}