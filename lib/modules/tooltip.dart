import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:greentech/shared/constant/constant.dart';

class HeatmapTooltipImage extends StatelessWidget {
  final String message;
  final EdgeInsetsGeometry padding=const EdgeInsets.all(25);
  final EdgeInsetsGeometry margin=const EdgeInsets.all(25);
  final Duration showDuration=const Duration(seconds: 10);
  final Color tooltipColor=Colors.red;
  final ShapeBorder tooltipShape= ToolTipCustomShape();
  final Color textStyleColor=Colors.white;
  final double verticalOffset=20;
  final String imageBase64;
   HeatmapTooltipImage({
    required this.message,
    required this.imageBase64,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,
      padding: padding,
      margin: margin,
      showDuration: showDuration,
      decoration: ShapeDecoration(
        color: tooltipColor,
        shape: tooltipShape,
      ),
      textStyle: TextStyle(color: textStyleColor),
      verticalOffset: verticalOffset,
      child: Image.memory(
        base64Decode(imageBase64),
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
