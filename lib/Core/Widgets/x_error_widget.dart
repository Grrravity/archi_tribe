import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import 'x_button.dart';

class XErrorWidget extends StatelessWidget {
  final String error;
  final void Function() onRetry;
  const XErrorWidget({Key? key, required this.error, required this.onRetry})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 40.0),
            child: Icon(
              LineAwesomeIcons.heart_broken,
              size: 100,
            ),
          ),
          RichText(
            maxLines: 7,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: "Oops, une erreur est survenue\r\n\r\n",
                    style: Get.textTheme.headline6),
                TextSpan(
                    text: error,
                    //style du deuxieme élément
                    style: Get.textTheme.bodyText2),
              ],
            ),
          ),
          SizedBox(
            height: 56,
            child: XButton.redFilled(
                value: 'Réessayer'.toUpperCase(), onPressed: onRetry),
          ),
        ],
      ),
    ));
  }
}
