//    ///
//  Import LIBRARIES
import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';
//  Import FILES
import '../controllers/todo_controller.dart';
import '../widgets/add_todo_formWidget.dart';
//  SIGNALS
//   //   ///

final todoCtrl = TodoController();

class TodosScreen extends StatelessWidget {
  const TodosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text(
          'Todos Page (Signals)',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () => showModalBottomSheet(
                context: context, builder: (_) => const AddTodoFormWidget()),
            icon: const Icon(Icons.add, color: Colors.white),
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete, color: Colors.white))
        ],
      ),
      body: Watch((context) {
        return Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  todoCtrl.todosStatusString.value,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: todoCtrl.todos.length,
              itemBuilder: (BuildContext context, int index) {
                final todo = todoCtrl.todos[index];
                return ListTile(
                  leading: Checkbox(
                    value: todo.completed,
                    onChanged: (value) => todoCtrl.onChangeCompletedTodo(todo),
                  ),
                  title: Text(
                    todo.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text(
                    todo.description ?? '',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () => todoCtrl.onRemoveTodo(todo),
                    icon: const Icon(Icons.remove_circle, color: Colors.red),
                  ),
                );
              },
            ))
          ],
        );
      }),
    );
  }
}
