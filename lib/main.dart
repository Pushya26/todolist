import 'package:flutter/material.dart';
import 'package:isarcrudtute/models/notes_database.dart';
import 'package:provider/provider.dart';
import 'pages/notes_page.dart';

void main() async{
  //initialize note isar db
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDatabase.initialize();


  runApp(
  MultiProvider(
    providers: (
      //note provider
    ChangeNotifierProvider(create: (context) => NoteDatabase()),

    //theme provider
     ChangeNotifierProvider(create: (context) => NoteDatabase())
  ),
  child: const MyApp(),
  ),
  ); 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const NotesPage(),
      theme: Provider.of<ThemeProvider>(context).themeData;
    );
  }
}
