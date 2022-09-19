import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Header extends StatelessWidget {
  final int count;
  const Header(this.count, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
      child: Text(
        count == 0
            ? 'Aucune tâche'
            : 'Vous avez $count ${count == 1 ? 'tâche' : 'tâches'}',
        style: Get.textTheme.headline5,
      ),
    );
  }
}
