import 'package:flutter/material.dart';



class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Container(
      constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg400.jpg"),
              fit: BoxFit.cover,
            ),
          ),
     ),
    );
  }
}