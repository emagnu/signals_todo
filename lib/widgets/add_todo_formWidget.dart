//    ///
//  Import LIBRARIES
import 'package:flutter/material.dart';
import 'package:signals_todo/models/todo_model.dart';
import 'package:signals_todo/screens/todos_screen.dart'; //  Import FILES
//  SIGNALS
//   //   ///

class AddTodoFormWidget extends StatefulWidget {
  const AddTodoFormWidget({super.key});

  @override
  State<AddTodoFormWidget> createState() => _AddTodoFormWidgetState();
}

class _AddTodoFormWidgetState extends State<AddTodoFormWidget> {
  final titleTec = TextEditingController();

  final descriptionTec = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void onAddTodo() {
    if (formKey.currentState!.validate()) {
      debugPrint(titleTec.text);
      debugPrint(descriptionTec.text);
      final todoToAdd = TodoModel(
        //  SIGNALS
        titleTec.text,
        descriptionC: descriptionTec.text,
      );
      todoCtrl.onAddTodo(todoToAdd);
      Navigator.of(context).pop();
    } else {
      debugPrint('Form is not valid');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: <Widget>[
          TextFormField(
            controller: titleTec,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Title',
            ),
            validator: (String? newTitle) {
              if (newTitle == null || newTitle.isEmpty) {
                return 'Title is required';
              }
              return null;
            },
          ),
          const SizedBox(height: 8.0),
          TextFormField(
            controller: descriptionTec,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Description',
            ),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: onAddTodo,
            child: const Text('Add Todo'),
          ),
        ]),
      ),
    );
  }
}
