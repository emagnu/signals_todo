//   ///
//  Import LIBRARIES
import 'package:uuid/uuid.dart';
//  Import FILES
//  SIGNALS
//  //  //   ///

class TodoModel {
  final String id;
  final String title;
  final String? description;
  final bool completed;

  TodoModel(this.title, {String? descriptionC, String? idC, bool? completedC})
      : description = descriptionC,
        id = idC ?? const Uuid().v4(),
        completed = completedC ?? false;

  TodoModel copyWith({
    String? id,
    String? title,
    String? description,
    bool? completed,
  }) {
    return TodoModel(
      idC: id ?? this.id,
      title ?? this.title,
      descriptionC: description ?? this.description,
      completedC: completed ?? this.completed,
    );
  }
}
