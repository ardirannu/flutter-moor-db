import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_note_controller.dart';
import '../../home/controllers/home_controller.dart';

class AddNoteView extends GetView<AddNoteController> {
  final HomeController HomeC = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('AddNoteView'),
          centerTitle: true,
        ),
        body: ListView(
          padding: EdgeInsets.all(15),
          children: [
            TextField(
                controller: controller.titleC,
                decoration: InputDecoration(
                    labelText: "Title", border: OutlineInputBorder())),
            SizedBox(
              height: 10,
            ),
            TextField(
                controller: controller.descC,
                decoration: InputDecoration(
                    labelText: "Desc", border: OutlineInputBorder())),
            SizedBox(
              height: 10,
            ),
            Obx(() => ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Color.fromARGB(255, 255, 255, 255),
                  backgroundColor: Color.fromARGB(255, 0, 136, 255),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(5), // Atur radius di sini
                  ),
                ),
                onPressed: () async {
                  if (controller.isLoading.isFalse) {
                    await controller.addNote();
                    await HomeC.fetchNotes(); //call fetchNotes di home controller untuk render ulang home view
                    Get.back();
                  }
                },
                child: Text((controller.isLoading.isFalse) ? "Add Note" : "Loading")
              )
            ),
          ],
        ));
  }
}
