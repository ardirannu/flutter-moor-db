import 'package:get/get.dart';
import '../../../data/db/note_database.dart';

class HomeController extends GetxController {
  final NoteManager noteManager = NoteManager(); //instance note manager

  final notes = <Note>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchNotes();
  }

  Future<void> fetchNotes() async {
    notes.assignAll(await noteManager.fetchAllNotes()); //refresh data notes dari note manager
    //lalu masukkan data ke notes obs
  }
}
