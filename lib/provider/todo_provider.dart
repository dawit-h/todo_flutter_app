import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import '../model/todo.dart';
import '../util/file_provider.dart';

class TodoProvider with ChangeNotifier {
  final fileManager = FileManager();
  final Map<String, List<Todo>> _todo = {
    'Todo': [
      Todo(
          title: "Dave",
          dateAdded: DateTime.now(),
          scheduleDate: DateTime.now(),
          id: "My todo"),
      Todo(
          title: "Second",
          dateAdded: DateTime.now(),
          scheduleDate: DateTime.now(),
          id: "My todo"),
      Todo(
          title: "Third",
          dateAdded: DateTime.now(),
          scheduleDate: DateTime.now(),
          id: "My todo"),
    ]
  };

  void addTodo(Todo todo) async {
    _todo['Todo']!.add(todo);
    final length = _todo["Todo"]!.length;
    for (int i = 0; i < length; i++) {
      await fileManager
          .writeToFile("${json.encode(_todo["Todo"]![i].tojson())};");
    }
    printFromFile();
  }

  void printFromFile() async {
    final todos = await fileManager.readFromFile();
    // final fromJsontoMap = json.decode(todos);
    final decoded = decodeStringFromJson(todos);
    // print(todos);
  }

  // recives Json string and converts it to Dart List
  List<Todo> decodeStringFromJson(String todos) {
    final todoList = todos.split(';');
    final List<Todo> decoded = [];
    for (int i = 0; i < todoList.length - 1; i++) {
      decoded.add(Todo.fromJson(json.decode(todoList[i])));
    }
    return decoded;
  }
}
