import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task.dart';
import '../widgets/list_item.dart';

class CompletedTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final taskList = Provider.of<TaskProvider>(context).completedTasks;

    return Scaffold(
      appBar: AppBar(
        title: Text('Completed Tasks'),
      ),
      body: taskList.length > 0
          ? ListView.builder(
        itemCount: taskList.length,
        itemBuilder: (context, index) {
          return ListItem(taskList[index]);
        },
      )
          : Center(
        child: Text('No tasks completed yet...'),
      ),
    );
  }
}
