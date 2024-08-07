import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/providers/task.dart';

class StatisticsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    final completedTasksCount = taskProvider.completedTasks.length;
    final totalTasksCount = taskProvider.itemsList.length;

    return Scaffold(
      appBar: AppBar(
        title: Text('Statistics'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Total Tasks: $totalTasksCount', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text('Completed Tasks: $completedTasksCount', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
