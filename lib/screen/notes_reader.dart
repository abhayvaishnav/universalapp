import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:universalapp/style/app_style.dart';

class NotesReaderScreen extends StatefulWidget {
  NotesReaderScreen(this.doc);
  final QueryDocumentSnapshot doc;
  @override
  State<NotesReaderScreen> createState() => _NotesReaderScreenState();
}

class _NotesReaderScreenState extends State<NotesReaderScreen> {
  @override
  Widget build(BuildContext context) {
    int colorID = int.parse(widget.doc['color_id']);
    return Scaffold(
      backgroundColor: AppStyle.cardsColor[colorID],
      appBar: AppBar(
        backgroundColor: AppStyle.cardsColor[colorID],
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.doc["notes_title"],
              style: AppStyle.mainTitle,
            ),
            Text(
              widget.doc["creation_date"],
              style: AppStyle.dateTitle,
            ),
            SizedBox(height: 28),
            Text(
              widget.doc["notes_content"],
              style: AppStyle.mainContent,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
