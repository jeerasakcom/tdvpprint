import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tdvpprint/components/backend/admin/service/admin_service.dart';
import 'package:tdvpprint/components/backend/customer/service/customer_service.dart';
import 'package:tdvpprint/components/frontend/guest/home/homepage.dart';
import 'package:tdvpprint/components/frontend/guest/register/register.dart';
import 'package:tdvpprint/models/users_model.dart';
import 'package:tdvpprint/utility/dailog.dart';
import 'package:tdvpprint/utility/style.dart';

class AuthenticationPage extends StatefulWidget {
  @override
  _AuthenticationPageState createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  late double screen;
  bool statusRedEye = true;
  String? email, password;


  void routeToService(Widget widget) {
    MaterialPageRoute route = MaterialPageRoute(
      builder: (context) => widget,
    );
    Navigator.pushAndRemoveUntil(context, route, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/p21.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          height: height,
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              SizedBox(height: 30),
              _backButton(),
              SizedBox(height: 10),
              Card(
                margin: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                elevation: 1,
                color: Colors.black54,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    StyleProjects().boxTop1,
                    StyleProjects().header3(),
                    StyleProjects().boxheight1,
                    blockheaderLogin(),
                    blockEmail(),
                    blockPassword(),
                    blockButtonLogin(),
                    _regpath(),
                    _mailButton(),
                    StyleProjects().boxTop2,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//
  TextButton blockButtonNewAcc() => TextButton(
        onPressed: () => Navigator.pushNamed(context, '/register'),
        child: Text(
          'สมัครสมาชิก',
          style: StyleProjects().topicstyle1,
        ),
      );

  Container blockButtonLogin() {
    return Container(
      //width: screen * 0.75,
      //height: 45,
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 40,
      width: 250,

      margin: const EdgeInsets.only(top: 16),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          if ((email?.isEmpty ?? true) || (password?.isEmpty ?? true)) {
            normalDialog(context, 'กรุณากรอก ทุกช่อง คะ');
          } else {
            checkAuthenticationPage();
          }
        },
        child: Text(
          'เข้าสู่ระบบ',
          style: StyleProjects().topicstyle3,
        ),
      ),
    );
  }

  Container blockEmail() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white70,
      ),
      margin: const EdgeInsets.only(top: 16),
      width: 250,
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) => email = value.trim(),
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.white),
          hintText: 'Email',
          prefixIcon: Icon(
            Icons.email_outlined,
            color: Colors.white,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Color.fromARGB(255, 255, 14, 98),
            ),
          ),
        ),
      ),
    );
  }

  Container blockPassword() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white70,
      ),
      margin: const EdgeInsets.only(top: 16),
      width: 250,
      child: TextField(
        onChanged: (value) => password = value.trim(),
        obscureText: statusRedEye,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: statusRedEye
                ? const Icon(Icons.remove_red_eye)
                : const Icon(Icons.remove_red_eye_outlined),
            onPressed: () {
              setState(() {
                statusRedEye = !statusRedEye;
              });
              if (kDebugMode) {
                print('statusRedEye =$statusRedEye');
              }
            },
          ),
          hintStyle: TextStyle(color: Colors.white),
          hintText: 'Password',
          prefixIcon: Icon(
            Icons.lock_outline,
            color: Colors.white,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Color.fromARGB(255, 255, 14, 98),
            ),
          ),
        ),
      ),
    );
  }

  Widget blockheaderLogin() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'ลงชื่อเข้าสู่ระบบ',
            textAlign: TextAlign.center,
            style: TextStyle(
              //fontFamily: 'THSarabunNew',
              fontFamily: 'Charmonman',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: const Color(0xFFD5E7FF),
            ),
          ),
          /*
          SizedBox(
            width: 10,
          ),
          Text(
            'Login',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Charmonman',
              //fontFamily: 'Suvarnajati',
              fontSize: 26,
              fontWeight: FontWeight.bold,
              //color: const Color(0xFF006EFF),
              color: Color.fromARGB(255, 254, 255, 255),
            ),

          ),
          */
        ],
      ),
    );
  }

  Widget _regpath() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 2,
                color: const Color(0xfff1f8ff),
              ),
            ),
          ),
          Text(
            'หรือ',
            style: TextStyle(
              fontFamily: 'THSarabunNew',
              fontSize: 28,
              fontWeight: FontWeight.bold,
              //color: const Color(0xff0e254e),
              color: const Color(0xffffffff),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 2,
                color: const Color(0xfff1f8ff),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }

  Widget _mailButton() {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => RegisterPage()));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 40,
        // ignore: prefer_const_constructors
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xffde3e26),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      topLeft: Radius.circular(5)),
                ),
                alignment: Alignment.center,
                child: new Icon(
                  Icons.mail,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xffe37969),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(5),
                      topRight: Radius.circular(5)),
                ),
                alignment: Alignment.center,
                child: Text(
                  'สมัครสมาชิกด้วยบัญชี Email',
                  style: TextStyle(
                    fontFamily: 'THSarabunNew',
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: const Color(0xfff1f8ff),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(
                Icons.keyboard_arrow_left,
                color: const Color(0xffffc52e),
              ),
            ),
            Text(
              'Back',
              style: TextStyle(
                fontFamily: 'THSarabunNew',
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffc52e),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<Null> checkAuthenticationPage() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email!, password: password!)
          .then((value) async {
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(value.user!.uid)
            .snapshots()
            .listen((event) {
          UserModel model = UserModel.fromMap(event.data()!);
          switch (model.level) {
            case 'customer':
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CustomerService(),
                ),
              );
              break;
            case 'admin':
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AdminService(),
                ),
              );
              break;
            default:
          }
        });
      }).catchError((value) => normalDialog(
                context,
                value.code,
              ));
    });
  }
}
