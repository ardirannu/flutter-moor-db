import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_note_controller.dart';
import '../../../data/db/note_database.dart';
import '../../home/controllers/home_controller.dart';

class EditNoteView extends GetView<EditNoteController> {
  final Note note = Get.arguments; //masukkan data argument ke Note
  final HomeController HomeC = Get.find();

  @override
  Widget build(BuildContext context) {
    controller.titleC.text = note.title;
    controller.descC.text = note.desc;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Note'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          TextField(
            controller: controller.titleC,
            decoration: InputDecoration(
              labelText: "Title",
              border: OutlineInputBorder()
            )
          ),
          SizedBox(height: 10,),
          TextField(
            controller: controller.descC,
            decoration: InputDecoration(
              labelText: "Desc",
              border: OutlineInputBorder()
            )
          ),
          SizedBox(height: 10,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Color.fromARGB(255, 255, 255, 255),
              backgroundColor: Color.fromARGB(255, 0, 136, 255),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5), // Atur radius di sini
              ),
            ),
            onPressed: () async {
              if (controller.isLoading.isFalse) {
                await controller.editNote(note.id!);
                await HomeC.fetchNotes(); //call fetchNotes di home controller untuk render ulang home view
                Get.back();
              }
            },
            child: Text("Edit Note")
          ),
        ],
      ),
    );
  }
}
