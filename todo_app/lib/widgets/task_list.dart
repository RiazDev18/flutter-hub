import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task.dart';
import 'list_item.dart';

//Parent widget of all ListItems, this widget role is just to group all list tiles.

class TaskList extends StatelessWidget {
  final List<Task> tasks;
  final Function(String) onTapTask;

  TaskList({required this.tasks, required this.onTapTask});

  @override
  Widget build(BuildContext context) {
    return tasks.length > 0
        ? ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => onTapTask(tasks[index].id),
          child: ListItem(tasks[index]),
        );
      },
    )
        : LayoutBuilder(
      builder: (ctx, constraints) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: constraints.maxHeight * 0.5,
                child: Image.asset('assets/images/waiting.png',
                    fit: BoxFit.cover),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'No tasks added yet...',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
        );
      },
    );
  }
}
