import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/model/todo.dart';
import 'package:todo/provider/todo_provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => TodoProvider())
        ],
        builder: (context, child) {
          final todoProvider = context.read<TodoProvider>();
          todoProvider.addTodo(Todo(
              title: "Dave",
              dateAdded: DateTime.now(),
              scheduleDate: DateTime.now(),
              id: "My todo"));
          // todoProvider.getTodoFromFile();
          return const MaterialApp(
            home: Scaffold(
              body: Center(
                child: Text('Hello World!'),
              ),
            ),
          );
        });
  }
}
