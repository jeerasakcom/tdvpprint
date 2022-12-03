import 'package:flutter/material.dart';
import 'package:tdvpprint/utility/config_button.dart';
import 'package:tdvpprint/utility/config_image.dart';
import 'package:tdvpprint/utility/config_progress.dart';
import 'package:tdvpprint/utility/config_text.dart';
import 'package:tdvpprint/utility/style.dart';


Future<Null> normalDialog(BuildContext context, String string) async {
  showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      //backgroundColor: Colors.lime.shade200,
      backgroundColor: Color.fromARGB(255, 255, 214, 214),
      title: ListTile(
        leading: Container(
          width: 50,
          child: Image.asset('assets/images/master.png'),
        ),
        title: Text(string),
      ),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              // ignore: prefer_const_constructors
              child: Text(
                'ตกลง',
                style: const TextStyle(
                    fontFamily: 'THSarabunNew',
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}


//

class MyDialog {
  final BuildContext context;
  MyDialog({
    required this.context,
  });

  Future<void> processDialog() async {
    showDialog(
        context: context,
        builder: (BuildContext context) => WillPopScope(
            child: const ConfigProgress(),
            onWillPop: () async {
              return false;
            }));
  }

  Future<void> normalActionDilalog(String error, {
    required String title,
    required String message,
    required String label,
    required Function() pressFunc,
    bool? cancel,
  }) async {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: Colors.grey.shade900,
        title: ListTile(
          leading: const ConfigImage(
            path: 'assets/images/logo.png',
            width: 80,
          ),
          title: ConfigText(
            lable: title,
          ),
          subtitle: ConfigText(lable: title,),
        ),
        actions: [
          TextButton(onPressed: pressFunc, child: ConfigText(lable: title,)),
          cancel == null
              ? const SizedBox()
              : cancel
                  ? ConfigButton(
                      label: 'Cancel',
                      pressFunc: () {
                        Navigator.pop(context);
                      })
                  : const SizedBox(),
        ],
      ),
    );
  }

  Future<void> twoActionDilalog({
    required String title,
    required String message,
    required String label1,
    required String label2,
    required Function() pressFunc1,
    required Function() pressFunc2,
    Widget? contentWidget,
  }) async {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: StyleProjects().buttona,
        title: ListTile(
          leading: const ConfigImage(
            path: 'assets/images/logo.png',
            width: 80,
          ),
          title: ConfigText(
            lable: title,
          ),
          subtitle: ConfigText(lable: title,),
        ),
        content: contentWidget ?? const SizedBox(),
        actions: [
          TextButton(onPressed: pressFunc1, child: ConfigText(lable: title,)),
          TextButton(onPressed: pressFunc2, child: ConfigText(lable: title,)),
        ],
      ),
    );
  }
}
