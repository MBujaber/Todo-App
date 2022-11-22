import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_3/providers/task_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AddTaskPage extends StatelessWidget {
  AddTaskPage({super.key});

  final Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Task"),
      ),
      body: Column(
        children: [
          TextField(controller: Controller),
          ElevatedButton(
              onPressed: () {
                context.read<TaskProvider>().addTask(Controller.text);
                context.pop();
              },
              child: Text("add task"))
        ],
      ),
    );
  }
}
