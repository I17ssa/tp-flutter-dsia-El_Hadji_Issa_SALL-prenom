import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:todoapp/common/task_category.dart';
import 'package:todoapp/commons/common.dart';
import 'package:todoapp/models/task.dart';

class TaskItem extends StatefulWidget {
  final bool isDone;
  final Task task;
  const TaskItem({
    super.key,
    required this.task,
    required this.isDone,
  });
  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
        height: 65.0,
        decoration: BoxDecoration(
          color: primaryBackground,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                if (!widget.task.isDone) {
                  showCupertinoModalPopup<void>(
                    context: context,
                    builder: (BuildContext context) => CupertinoAlertDialog(
                      title: const Text('Confirmation'),
                      content: const Text('Do you want close'),
                      actions: <CupertinoDialogAction>[
                        CupertinoDialogAction(
                          /// This parameter indicates this action is the default,
                          /// and turns the action's text to bold text.
                          isDefaultAction: true,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('No'),
                        ),
                        CupertinoDialogAction(
                          /// This parameter indicates the action would perform
                          /// a destructive action such as deletion, and turns
                          /// the action's text color to red.
                          isDestructiveAction: true,
                          onPressed: () {
                            Navigator.pop(context);
                            print("task closed");
                            //widget.task.isDone = true
                          },
                          child: const Text('Yes'),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  padding: const EdgeInsets.all(2.0),
                  width: 25.0,
                  height: 25.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.task.category == TaskCategory.business
                        ? businessIndicator
                        : personalIndicator,
                  ),
                  child: widget.task.isDone
                      ? const Icon(
                          Icons.done,
                          color: Colors.white,
                          size: 16.0,
                        )
                      : Container(
                          decoration: const BoxDecoration(
                            color: primaryBackground,
                            shape: BoxShape.circle,
                          ),
                        ),
                ),
              ),
            ),
            Text(
              "${widget.task.title}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                decoration: widget.task.isDone
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            )
          ],
        ),
      ),
    );
  }
}
