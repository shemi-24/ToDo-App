import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../task_data.dart';
import '../tasks.dart';

class AddTaskScreen extends StatelessWidget {
  final Function addTaskCallback;

  AddTaskScreen({@required this.addTaskCallback});

  @override
  Widget build(BuildContext context) {
    String newTaskTitle;
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: Colors.white,
        ),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Text',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.lightBlue,
                  fontSize: 30,
                  fontWeight: FontWeight.w500),
            ),
            TextField(
              textAlign: TextAlign.center,
              autofocus: true,
              onChanged: (newText) {
                newTaskTitle = newText;
              },
            ),
            FlatButton(
                onPressed: () {
                  //print(newTaskTitle);
                  //addTaskCallback(newTaskTitle);
                  Provider.of<TaskData>(context,listen: false).addTask(newTaskTitle);
                  Navigator.pop(context);
                  //print(TaskData().tasks);
                },
                child: Text(
                  'Add',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                color: Colors.lightBlue)
          ],
        ),
      ),
    );
  }
}
