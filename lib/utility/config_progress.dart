import 'package:flutter/material.dart';
import 'package:tdvpprint/utility/config_text.dart';
import 'package:tdvpprint/utility/style.dart';

class ConfigProgress extends StatelessWidget {
  const ConfigProgress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CircularProgressIndicator(
          color: Colors.white,
        ),
        StyleProjects().boxTop2,
        // ignore: prefer_const_constructors
        ConfigText(
          lable: 'กรุณารอสักครู่นะคะ...',
        )
      ],
    ));
  }
}
