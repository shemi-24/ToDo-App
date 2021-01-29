import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/task_data.dart';

import '../tasks.dart';
import 'add_task_screen.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) => AddTaskScreen(
                    // addTaskCallback: (newTask) {
                    //   //print(newTask);
                    //   //newTask==null ? Navigator.pop(context) :
                    //   // setState(() {
                    //   //   //tasks.add(Tasks(taskName: newTask));
                    //   // });
                    //   // Navigator.pop(context);
                    // },
                  ));
        },
        child: Icon(
          Icons.add,
          size: 40,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    child: Icon(
                      Icons.list,
                      size: 30,
                      color: Colors.lightBlueAccent,
                    ),
                    backgroundColor: Colors.white,
                    radius: 30,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Todo',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    '${Provider.of<TaskData>(context).taskCount} Tasks',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: Colors.white,
              ),
              child: TasksList(

              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (BuildContext context, taskData, Widget child)
      {
        return ListView.builder(
          // ignore: missing_return
          itemBuilder: (BuildContext context, int index) {
            final taskTip=taskData.tasks[index];
            return TasksTile(
              isChecked: taskTip.isDone,
              taskTitle: taskTip.taskName,
              checkBoxCallback: (checkState) {
                taskData.updateTask(taskTip);
              },
              longPressCallBack:(){ taskData.deleteTask(taskTip);}
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}

// ignore: must_be_immutable
class TasksTile extends StatelessWidget {
  final bool isChecked;
  final Function checkBoxCallback;
  final String taskTitle;
  final Function longPressCallBack;

  TasksTile(
      {@required this.isChecked,
      @required this.taskTitle,
      this.checkBoxCallback, this.longPressCallBack});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallBack ,
      title: Text(
        taskTitle,
        style: TextStyle(
            decoration:
                isChecked ? TextDecoration.lineThrough : TextDecoration.none),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkBoxCallback,
      ),
    );
  }
}
