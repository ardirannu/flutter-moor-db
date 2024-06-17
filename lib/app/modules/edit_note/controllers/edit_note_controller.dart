import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/db/note_database.dart';

class EditNoteController extends GetxController {
  RxBool isLoading = false.obs;

  TextEditingController titleC = TextEditingController();
  TextEditingController descC = TextEditingController();

  final NoteManager noteManager = NoteManager(); //instance note manager

  Future<void> editNote(int noteId) async { //add note
    isLoading.value = true;
    await noteManager.updateNote(
      Note(
        id: noteId, 
        title: titleC.text, 
        desc: descC.text
      )
    );
    isLoading.value = false;
  }
}
