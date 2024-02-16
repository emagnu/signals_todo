//   ///
//  Import LIBRARIES
import 'package:signals_flutter/signals_flutter.dart';
//  Import FILES
import '../models/todo_model.dart';
//  SIGNALS
//  //  //   ///

class TodoController {
  // final List<TodoModel> todos = <TodoModel>[].toSignal();
  final ListSignal<TodoModel> todos = <TodoModel>[].toSignal();

  late final Computed<String> todosStatusString = computed(() {
    final notCompletedTodos = todos.where((todo) => !todo.completed);
    if (todos.isEmpty) {
      return 'You don not have any tasks';
    } else if (notCompletedTodos.isEmpty) {
      return 'All tasks completed';
    } else {
      return 'You have ${notCompletedTodos.length} task${notCompletedTodos.length == 1 ? '' : 's'} left to complete.';
    }
  });

  void onAddTodo(TodoModel todo) {
    todos.add(todo);
  }

  void onRemoveTodo(TodoModel todo) {
    todos.removeWhere((todoFromList) => todoFromList.id == todo.id);
  }

  void onChangeCompletedTodo(TodoModel todoToUpdate) {
    todos.value = todos.map((todo) {
      if (todo.id == todoToUpdate.id) {
        return todo.copyWith(completed: !todo.completed);
      } else {
        return todo;
      }
    }).toList();
    // todo.completed = !todo.completed;
  }
}
