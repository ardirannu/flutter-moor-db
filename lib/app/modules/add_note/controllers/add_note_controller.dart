import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/db/note_database.dart';

class AddNoteController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController titleC = TextEditingController();
  TextEditingController descC = TextEditingController();

  final NoteManager noteManager = NoteManager(); //instance note manager

  Future<void> addNote() async { //add note
    isLoading.value = true;
    await noteManager.insertNote(
      Note(
        title: titleC.text, 
        desc: descC.text
      )
    );
    isLoading.value = false;
  }
}
