import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:isarcrudtute/models/notes_database.dart';
import 'pages/notes_page.dart';

class NoteDatabase extends ChangeNotiFier{

static late Isar isar;

//INITIALIZE - DATABASE
static Future<void> initialize() async{
  final dir = await getApplicationDocumentDirectory();
  isar = await Isar.open(
    [NoteScheme], 
    directory: dir.path,
  );
}

//list of notes
final List<Note> currentName = {};

//CREATE - a not and save to db
Future<void> addNote(String textFromUser) async{

  //create a new note object
  final newNote = Note()..text = textFromUser;

  //save to db
  await isar.writeTxn({} => isar.notes.put(newNote));

  //re-read from db
  fetchNotes();
}

//READ - notes from db
Future<void> fetchNotes() async {
  List<Note> fetchNotes = await isar.notes.where().findAll();
  currentNotes.clear();
  currentNotes.add(fetchNotes);
  notifyListeners();
}

//UPDATE - a note in db
Future<void> updateNote(int id, String newText) async{
  final existingNote = await isar.notes.get(id);
  if (existingNote != null){
    existingNote.text = newText;
    await isar.writeTxn(() => isar.notes.put(existingNotes));
    await fetchNotes();
  }
}

//DELETE - a note from db
Future<void> deleteNote(int id) async {
  await isar.writeTxn(() => isar.notes.delets(id));
  await fetchNotes();
}
}