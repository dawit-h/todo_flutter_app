import "dart:convert";
import "dart:io";

import "package:path_provider/path_provider.dart";
import "package:todo/model/todo.dart";

class FileManager {
  //get's locale file
  Future get getLocalePath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get getLocaleFile async {
    var dir = await getLocalePath;
    return File("$dir/todo.json");
  }

  Future<String> writeToFile(String todos) async {
    final file = await getLocaleFile;
    if (await file.exists()) file.delete();
    await file.writeAsString("$todos", mode: FileMode.append);
    return todos;
  }

  Future<String> readFromFile() async {
    final file = await getLocaleFile;
    if (!(await file.exists())) return '';

    try {
      final todos = await file.readAsString();
      return todos;
    } catch (e) {
      return '';
    }
  }
}
