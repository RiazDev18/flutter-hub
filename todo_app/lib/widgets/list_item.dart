import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/task.dart';
import '../widgets/add_new_task.dart';
import './item_text.dart';

// A widget that composes every single item in the list.
// Allows the user to check it as done.
// Deletes a task when dismissed.
// ### MISSING FEATURES ###
// Edit a task through the icon button.

class ListItem extends StatefulWidget {
  final Task task;

  ListItem(this.task);

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    void _checkItem() {
      setState(() {
        Provider.of<TaskProvider>(context, listen: false)
            .changeStatus(widget.task.id);
      });
    }

    void _deleteItem() {
      Provider.of<TaskProvider>(context, listen: false).removeTask(widget.task.id);
    }

    return Dismissible(
      key: ValueKey(widget.task.id),
      direction: DismissDirection.endToStart,
      onDismissed: (_) {
        _deleteItem();
      },
      background: Container(
        color: Colors.red,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      ),
      child: GestureDetector(
        onTap: _checkItem,
        child: Container(
          height: 85,
          child: Card(
            elevation: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Checkbox(
                      value: widget.task.isDone,
                      onChanged: (_) => _checkItem(),
                    ),
                    ItemText(
                      widget.task.isDone,
                      widget.task.description,
                      widget.task.dueDate,
                      widget.task.dueTime,
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    if (!widget.task.isDone)
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (_) => AddNewTask(
                              id: widget.task.id,
                              isEditMode: true,
                            ),
                          );
                        },
                      ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: _deleteItem,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
