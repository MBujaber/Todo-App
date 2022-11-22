import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages/add_task_page.dart';
import 'package:flutter_application_3/pages/list_page.dart';
import 'package:flutter_application_3/providers/task_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

final router = GoRouter(routes: [
  GoRoute(
    path: "/",
    builder: (context, state) => ListPage(),
  ),
  GoRoute(
    path: "/add",
    builder: (context, state) => AddTaskPage(),
  )
]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routerConfig: router,
      ),
    );
  }
}
