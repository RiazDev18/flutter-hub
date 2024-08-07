import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task.dart';

class TaskDetailsScreen extends StatelessWidget {
  final String taskId;

  TaskDetailsScreen({required this.taskId});

  @override
  Widget build(BuildContext context) {
    final task = Provider.of<TaskProvider>(context, listen: false).getById(taskId);

    return Scaffold(
      appBar: AppBar(
        title: Text('Task Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Description: ${task.description}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text('Due Date: ${task.dueDate}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text('Due Time: ${task.dueTime}', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
