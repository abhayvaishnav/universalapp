import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:universalapp/style/app_style.dart';

class NotesEditorScreen extends StatefulWidget {
  const NotesEditorScreen({Key? key}) : super(key: key);

  @override
  State<NotesEditorScreen> createState() => _NotesEditorScreenState();
}

class _NotesEditorScreenState extends State<NotesEditorScreen> {
  int color_id = Random().nextInt(AppStyle.cardsColor.length);
  String date = DateTime.now().toString();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _mainController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.cardsColor[color_id],
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: AppStyle.cardsColor[color_id],
        elevation: 0.0,
        title: Text(
          'Add New Note',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Note Title',
              ),
              controller: _titleController,
              style: AppStyle.mainTitle,
            ),
            SizedBox(height: 8),
            Text(
              date,
              style: AppStyle.dateTitle,
            ),
            SizedBox(height: 28),
            TextField(
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Note Description',
              ),
              controller: _mainController,
              style: AppStyle.mainTitle,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            FirebaseFirestore.instance.collection('notes').add({
              "notes_title": _titleController.text,
              "notes_content": _mainController.text,
              "color_id ": color_id.toString(),
              "creation_date": date,
            }).then((value) {
              print(value.id);
              Navigator.pop(context);
            }).catchError((error) {
              print("Failed to add new note due to $error");
            });
          },
          child: Icon(Icons.check_rounded)),
    );
  }
}
