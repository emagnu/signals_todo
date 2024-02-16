//   ///
//  Import LIBRARIES
import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';
//  Import FILES
import '../controllers/todo_controller.dart';
import '../widgets/add_todo_form_widget.dart';
//  SIGNALS
//  //  //   ///

final todoCtrl = TodoController();

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Todo Screen - Signals',
            style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.w600),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () => showModalBottomSheet(
                context: context,
                builder: (context) => const AddTodoFormWidget(),
              ),
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.black,
        // body: const Center(
        //   child: Text(
        //     'Todo Screen',
        //     // '${todosStatusString.toString()}',
        //     style: TextStyle(
        //       fontSize: 25,
        //       fontWeight: FontWeight.w600,
        //       color: Colors.indigo,
        //     ),
        //   ),
        // ),
        body: Watch.builder(builder: (context) {
          return Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Center(
                  child: Text(
                    todoCtrl.todosStatusString.value,
                    style: const TextStyle(
                        color: Colors.amber,
                        fontSize: 14,
                        fontWeight: FontWeight.w300),
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
                        onChanged: (value) =>
                            todoCtrl.onChangeCompletedTodo(todo),
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
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () => todoCtrl.onRemoveTodo(todo),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }));
  }
}
