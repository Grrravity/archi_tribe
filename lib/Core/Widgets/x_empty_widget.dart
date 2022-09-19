import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../Helper/constants.dart';
import '../Theme/theme_color.dart';

class XEmptyWidget extends StatelessWidget {
  final String? title;
  final String message;
  final String? asset;
  final bool hasFAB;
  const XEmptyWidget({
    Key? key,
    required this.message,
    this.title,
    this.asset,
    this.hasFAB = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: SvgPicture.asset(
                  asset ?? svgEmptyFile,
                  placeholderBuilder: (BuildContext context) => const SizedBox(
                    height: 125,
                  ),
                ),
              ),
              RichText(
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: "${title ?? "Oups !"}\r\n\r\n",
                        style: Get.textTheme.bodyText1!.copyWith(
                            color: Get.theme.errorColor,
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: message,
                        style: Get.textTheme.bodyText2!.copyWith(color: grey5)),
                  ],
                ),
              ),
              if (hasFAB)
                SizedBox(
                  height: 300,
                  width: 180,
                  child: CustomPaint(
                    painter: ArrowPainter(),
                  ),
                )
            ],
          ),
        ));
  }
}

class ArrowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round
      ..color = grey5.withOpacity(0.7);
    var path = Path();

    //Line
    path
      ..moveTo(0, size.height * 0.05)
      ..quadraticBezierTo(size.width * 0.5, size.height * 0.15,
          size.width * 0.5, size.height * 0.5)
      ..quadraticBezierTo(size.width * 0.5, size.height * 0.85,
          size.width * 0.95, size.height * 0.955);
    //Relocate
    path.moveTo(size.width * 0.95, size.height);
    //Arrow
    path
      ..quadraticBezierTo(
          size.width * 0.96, size.height * 0.98, size.width, size.height * 0.97)
      ..quadraticBezierTo(size.width * 0.98, size.height * 0.94,
          size.width * 0.99, size.height * 0.92);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
