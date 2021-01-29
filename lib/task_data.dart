import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todo/tasks.dart';

class TaskData extends ChangeNotifier{

  List<Tasks> _tasks = [
    Tasks(taskName: 'buy one'),
    Tasks(taskName: 'buy two'),
    Tasks(taskName: 'buy three')
  ];

  UnmodifiableListView<Tasks> get tasks
  {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount{
    return _tasks.length;
  }
  void addTask(String newTaskTitle){
    final task=Tasks(taskName: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask( Tasks task){
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Tasks task){
    _tasks.remove(task);
    notifyListeners();
  }

}