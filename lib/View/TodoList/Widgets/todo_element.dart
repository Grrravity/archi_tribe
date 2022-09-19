import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Domain/Entities/todo.dart';

class TodoElement extends StatelessWidget {
  final Todo element;
  final Future<void> Function(bool isDone) onCheck;
  final void Function() onTap;
  final void Function() onDelete;
  const TodoElement(this.element,
      {Key? key,
      required this.onCheck,
      required this.onTap,
      required this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: element.isDone,
        onChanged: (isDone) => onCheck(isDone ?? false),
      ),
      title: Text(element.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Get.textTheme.headline5!.copyWith(
              decoration: element.isDone
                  ? TextDecoration.lineThrough
                  : TextDecoration.none)),
      subtitle: element.description != null
          ? Text(
              element.description!,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: Get.textTheme.subtitle1!.copyWith(
                  decoration: element.isDone
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
            )
          : null,
      trailing: IconButton(
          icon: Icon(Icons.delete, color: Get.theme.primaryColor),
          onPressed: () => onDelete()),
      onTap: () => onTap(),
    );
  }
}
