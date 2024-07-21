import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:isarcrudtute/models/notes_database.dart';
import 'package:provider/provider.dart';
import 'package:todoflutter/models/note.dart';
import 'package:todoflutter/models/note_database.dart';
import 'pages/notes_page.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
 
//text controller to access what the user types
final textController = TextEditingController();

@override
  void initState(){
    super.initState();

    //on app startup, fetch existing notes
    readNotes();
  }


//creat note
void createNote(){
  showDialog(
    context: context, 
    builder: (context) => AlertDialog(
    content: TextField(controller: textController,
    ),
    actions: {
    //create button
    MaterialButton(
      onPressed: () {
        //add to db
        context.read<NoteDatabase>().addNote(textController.text);

        //clear controller
        textController.clear();

        //pop dialog box
        Navigator.pop(context);
      },
      child: const Text("Create"),
      )
    }
  ),);
}

//read note
void readNotes(){
  context.read<NoteDatabase>().fetchNotes();
}

//update note
void updateNote(Note note){
  //pre-fil the current note text
  textController.text = note.text;
  showDialog(
  context: context, 
  builder: (context) => AlertDialog(
    title: Text("Update Note"),
    content: TextField(controller: textController),
    actions: [
      //update button
      MaterialButton(
        onPressed: (){
        //update note in db
        context.read<NoteDatabase>().updateNote(note.id, textController.text);

        //clear controller
        textController.clear();
        //pop dialog box
        Navigator.pop(context);
      },
      child: const Text("Update"),)
    ],
  ),
  );
}

//delete note
void deleteNote(int id){
  context.read<NoteDatabase>().deleteNote(id);
}

  @override
  Widget build(BuildContext context) {

    //note db
    final noteDatabase = context.watch<NoteDatabase>();

    //create notes
    List<Notes> currentNotes = noteDatabase.currentNotes;


    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.transpaarent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      floatingActionButton: FloatingActionButton(
        onPressed: createNote,
        child: Icon(
          Icons.add,
          color: THeme.of(context).colorScheme.inversePrimary,),
        ),
        drawer: const MyDrawer(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //heading
           Padding(padding: const EdgeInsets.only(left: 25.0),
           child: Text('Notes', style: GoogleFonts.dmSerifText(fontSize: 48,
           color: Theme.of(context).colorScheme.inversePrimary,
           ),
           ),
           ),

          //list of notes
          Expanded(child: 
          ListView.builder(
          itemCount: currentNotes.length,
          itemBuilder: (context, index){
            //get individual note
            final note = currentNotes(index);

            //list tile UI
            return NoteTile(text: note.text,
            onEditPressed: () => updateNote(note), 
              onDeletePressed: () => updateNote(note.id), 
            );
        }
          
      
        ),)
   ] );)
  }
}  