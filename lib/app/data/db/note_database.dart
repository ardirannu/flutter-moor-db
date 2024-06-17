import 'package:moor_flutter/moor_flutter.dart';

part 'note_database.g.dart';

class Notes extends Table {
  IntColumn get id => integer().autoIncrement().nullable()();
  TextColumn get title => text().withLength(min: 1, max: 100)();
  TextColumn get desc => text().withLength(min: 1, max: 255)();
}

@UseMoor(tables: [Notes])
class NoteManager extends _$NoteManager {
  static final NoteManager _instance = NoteManager._internal(); //buat jadi singleton, antisipasi race condition
  //note manager jadi bisa diinstansiasi dimana saja

  factory NoteManager() {
    return _instance;
  }

  NoteManager._internal() : super(FlutterQueryExecutor.inDatabaseFolder(path: "notes.sqlite"));

  @override
  int get schemaVersion => 1;

  //CRUD
  //Fetch data
  Future<List<Note>> fetchAllNotes() => select(notes).get();

  //Insert
  Future<int> insertNote(Note note) => into(notes).insert(note);

  //update
  Future<bool> updateNote(Note note) => update(notes).replace(note);

  //delete
  Future<int> deleteNote(Note note) => delete(notes).delete(note);
}
