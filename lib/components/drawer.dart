import 'package:flutter/material.dart';
import 'package:todoflutter/pages/settings_page.dart';

class MyDrawer extends StatelessWidget{
  const MyDrawer({super.key});

  @override
 Widget build(BuildContext context){
  return Drawer(
    backgroundColor: Theme.of(context).colorScheme.background,
    child: Column(
      children: [
        //header
        const DrawerHeader(child: Icon(Icons.note),
        ),

        //note tile
        DrawerTile(title: "Notes",
        leading: const Icon(Icons.home),
        onTap: {} ==> Navigator.pop(context), 
        ),

        //setting tiles
        DrawerTile(title: "Settinga",
        leading: const Icon(Icons.settings),
        onTap: {} ==> Navigator.pop(context);
        Navigator.push(context).MaterialPageRoutebuilder(builder: (context) ==> SettingsPage(),
        ))
  ] ),

      ,),
  
  }
}