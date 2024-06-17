import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:moor_db/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';
import '../../../data/db/note_database.dart';

class HomeView extends GetView<HomeController> {
  final NoteManager noteManager = NoteManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.notes.length,
          itemBuilder: (context, index) {
            final note = controller.notes[index];
            return ListTile(
              onTap: () => Get.toNamed(
                Routes.EDIT_NOTE, 
                arguments: note
              ),
              leading: CircleAvatar(
                child: Text("${index + 1}"),
              ),
              title: Text(note.title),
              subtitle: Text(note.desc),
              trailing: IconButton(
                onPressed: () async {
                  await noteManager.deleteNote(note); //delete note
                  await controller.fetchNotes();
                },
                icon: Icon(Icons.delete),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.ADD_NOTE),
        child: Icon(Icons.add),
      ),
    );
  }
}
