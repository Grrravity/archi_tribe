import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Core/Theme/theme_color.dart';
import '../../../../Core/Widgets/x_button.dart';
import '../Controller/todo_detail_controller.dart';

class TodoDetail extends StatelessWidget {
  final TodoDetailController controller;
  const TodoDetail(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: SizedBox(
          width: Get.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: Get.width - 104,
                      child: Text(
                        "Titre : ${controller.todo!.title}",
                        style: Get.textTheme.headline5,
                      ),
                    ),
                    if (controller.todo!.isDone)
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Icon(
                          Icons.done,
                          color: green,
                        ),
                      )
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Text(
                "Description : \r\n\r\n${controller.todo!.description ?? ''}",
                style: Get.textTheme.bodyText1,
              ),
              const SizedBox(height: 48),
              controller.todo!.isDone
                  ? XButton.redOutlined(
                      value: "Supprimer cette tâche",
                      onPressed: () => controller.deleteTodo())
                  : XButton.greyFilled(
                      value: "Marquer comme terminée",
                      onPressed: () => controller.markDone()),
              const SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }
}
