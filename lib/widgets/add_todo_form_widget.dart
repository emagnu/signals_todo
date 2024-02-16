//   ///
//  Import LIBRARIES
import 'package:flutter/material.dart';
//  Import FILES
import '../models/todo_model.dart';
import '../screens/todo_screen.dart';
//  SIGNALS
//  //  //   ///

class AddTodoFormWidget extends StatefulWidget {
  const AddTodoFormWidget({super.key});

  @override
  State<AddTodoFormWidget> createState() => _AddTodoFormWidgetState();
}

class _AddTodoFormWidgetState extends State<AddTodoFormWidget> {
  final TextEditingController titleTEC = TextEditingController();
  final TextEditingController descriptionTEC = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void onAddTodo() {
    if (formKey.currentState!.validate()) {
      final todoAdd = TodoModel(
        titleTEC.text,
        descriptionC: descriptionTEC.text,
      );
      todoCtrl.onAddTodo(todoAdd);

      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 8.0),
            TextFormField(
              controller: titleTEC,
              validator: (newTitle) {
                if (newTitle == null || newTitle.isEmpty) {
                  return 'Please enter a title for your task';
                }
                return null;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter the title of your task here',
                labelText: 'Title',
              ),
            ),
            const SizedBox(height: 15.0),
            TextFormField(
              controller: descriptionTEC,
              validator: (newTitle) {
                if (newTitle == null || newTitle.isEmpty) {
                  return 'Please enter a short description for your task';
                }
                return null;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a short description of your task here',
                labelText: 'Description',
              ),
            ),
            const SizedBox(height: 25.0),
            ElevatedButton(
              onPressed: onAddTodo,
              child: const Text('Add the Taks'),
            ),
          ],
        ),
      ),
    );
  }
}
