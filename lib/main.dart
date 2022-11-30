import 'dart:async';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tdvpprint/components/frontend/guest/home/homepage.dart';
import 'package:tdvpprint/utility/style.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SharedPreferences.getInstance();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'tdvp',
      theme: ThemeData(
          primaryColor: StyleProjects().primaryColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Colors.white),
      home: const SplashPage(),
    );
  }
}

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = const Duration(seconds: 2);
    return Timer(duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const HomePage(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/logo.png',
              width: 150,
              height: 150,
            ),
            Text(
              'โรงพิมพ์อาสารักษาดินแดน กรมการปกครอง\n'
              'Territorial Defence Volunteers Printing',
              textAlign: TextAlign.center,
              style: StyleProjects().topicstyle5,
            ),
          ],
        ),
      ),
    );
  }
}
