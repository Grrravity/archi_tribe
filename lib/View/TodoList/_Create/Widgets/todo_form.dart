import 'package:flutter/material.dart';

import '../../../../Core/Widgets/x_button.dart';
import '../../../../Core/Widgets/x_text_form_field.dart';
import '../Controller/todo_create_controller.dart';

class TodoForm extends StatelessWidget {
  final TodoCreateController controller;
  const TodoForm(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: controller.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            XTextFormField.roundedBorder(
              labelText: "titre",
              hintText: "ajoutez un titre à votre note",
              focusNode: controller.titleNode,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              textEditingController: controller.titleController,
              validator: (value) => controller.validateTitle(value),
              onFieldSumitted: (_) => controller.descNode.requestFocus(),
            ),
            const SizedBox(height: 24),
            XTextFormField.roundedBorder(
              labelText: "description",
              hintText: "ajoutez une description à votre note (optionnel)",
              focusNode: controller.descNode,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.multiline,
              maxLines: 10,
              textEditingController: controller.descController,
            ),
            const SizedBox(height: 48),
            XButton.redFilled(
                value: "Enregistrer", onPressed: () => controller.create())
          ],
        ),
      ),
    );
  }
}
