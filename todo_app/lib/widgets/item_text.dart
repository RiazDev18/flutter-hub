import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemText extends StatelessWidget {
  final bool isDone;
  final String description;
  final DateTime? dueDate;
  final TimeOfDay? dueTime;

  ItemText(this.isDone, this.description, this.dueDate, this.dueTime);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          description,
          style: TextStyle(
            decoration: isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        if (dueDate != null)
          Text(
            'Due: ${DateFormat.yMMMd().format(dueDate!)}',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        if (dueTime != null)
          Text(
            'At: ${dueTime!.format(context)}',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
      ],
    );
  }
}
