import 'package:isar/isar.dart';
//this line is to generate file
//then run: dart run build_runner build
part 'note.g.dart';
@Collection()
class Note{

  Id id = Isar.autoIncrement;
  late String text;

}  