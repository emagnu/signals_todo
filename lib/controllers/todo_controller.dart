//    ///
//  Import LIBRARIES
import 'package:signals_flutter/signals_flutter.dart';
//  Import FILES
import '../models/todo_model.dart';
//  SIGNALS
//   //   ///

class TodoController {
  final todos = <TodoModel>[].toSignal();

  late final Computed<String> todosStatusString = computed(() {
    final notCompletedTodos = todos.where((todo) => !todo.completed);
    if (notCompletedTodos.isEmpty) {
      return 'You do not have any task';
    } else if (notCompletedTodos.isEmpty) {
      return 'Congratulations, all tasks are completed!';
    } else {
      return 'You have ${notCompletedTodos.length} task${notCompletedTodos.length == 1 ? '' : 's'} to complete.';
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
  }

  // void onToggleAll() {
  //   todos.forEach((todo) => todo.toggle())
  // }

  // void onRemoveCompleted() {
  //   todos.removeWhere((todo) => todo.completed);
  // }

  // void onRemoveAll() {
  //   todos.clear();
  // }
}
