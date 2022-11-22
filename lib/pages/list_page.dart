import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_3/providers/task_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ListPage extends StatelessWidget {
  ListPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List"),
        actions: [
          IconButton(
              onPressed: () {
                context.push("/add");
              },
              icon: Icon(Icons.add_box_outlined)),
        ],
      ),
      body: ListView.builder(
        itemCount: context.watch<TaskProvider>().tasks.length,
        itemBuilder: (context, index) => Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Checkbox(
                  value: context.watch<TaskProvider>().tasks[index].isComplete,
                  onChanged: ((value) {
                    context.read<TaskProvider>().updateTask(index);
                  }),
                ),
                Text(context.watch<TaskProvider>().tasks[index].text),
                Spacer(),
                if (!context.read<TaskProvider>().tasks[index].isComplete)
                  IconButton(onPressed: null, icon: Icon(Icons.delete_forever))
                else
                  IconButton(
                      onPressed: () {
                        var delete = context.read<TaskProvider>();
                        delete.deleteTask(index);
                      },
                      icon: Icon(Icons.delete)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
