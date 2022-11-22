import 'package:flutter/foundation.dart';
import 'package:flutter_application_3/models/task_model.dart';

class TaskProvider extends ChangeNotifier {
  List<TaskModel> tasks = [
    TaskModel(text: "Define provider class", isComplete: false),
    TaskModel(text: "Provide/Configure the provider", isComplete: false),
    TaskModel(
        text: "watch/read provider variables/function", isComplete: false),
  ];

  void addTask(String task) {
    TaskModel model = TaskModel(
      text: task,
      isComplete: false,
    );
    tasks.add(model);
    notifyListeners();
  }

  void updateTask(int index) {
    tasks[index].isComplete = !tasks[index].isComplete;
    notifyListeners();
  }

  void deleteTask(int index) {
    tasks.removeAt(index);
    // notifyListeners();
  }
}
