import 'package:flutter/material.dart';


class ConfigText extends StatelessWidget {
  final String lable;
  final TextStyle? textStyle;

  const ConfigText({
    Key? key,
    required this.lable,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(lable, style: textStyle);
  }
}
