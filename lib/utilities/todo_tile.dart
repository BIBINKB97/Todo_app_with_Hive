import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/constants/colors.dart';

// ignore: must_be_immutable
class TodoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleated;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
  TodoTile({
    super.key,
    required this.taskName,
    required this.taskCompleated,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: kred,
            borderRadius: BorderRadius.circular(10),
          )
        ]),
        child: ListTile(
          tileColor: kwhite,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          leading: Checkbox(value: taskCompleated, onChanged: onChanged),
          title: Text(
            taskName,
            style: TextStyle(
                fontSize: 20,
                color: kblack,
                decoration: taskCompleated
                    ? TextDecoration.lineThrough
                    : TextDecoration.none),
          ),
        ),
      ),
    );
  }
}
