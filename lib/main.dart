import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/task_data.dart';
import 'screens/tasks_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) { return TaskData(); },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:TasksScreen()
      ),
    );
  }
}
