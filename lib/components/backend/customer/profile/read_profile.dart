import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tdvpprint/models/users_model.dart';
import 'package:tdvpprint/utility/config_avatar.dart';
import 'package:tdvpprint/utility/config_progress.dart';
import 'package:tdvpprint/utility/config_text.dart';
import 'package:tdvpprint/utility/style.dart';
import 'package:avatar_view/avatar_view.dart';

class ReadProfilePage extends StatefulWidget {
  const ReadProfilePage({Key? key, required String uid}) : super(key: key);

  @override
  State<ReadProfilePage> createState() => _ReadProfilePageState();
}

class _ReadProfilePageState extends State<ReadProfilePage> {
  var user = FirebaseAuth.instance.currentUser;
  UserModel? userModel;
  bool load = true;

  @override
  void initState() {
    super.initState();
    readProfile();
  }

  Future<void> readProfile() async {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(user!.uid)
        .get()
        .then((value) {
      setState(() {
        load = false;
        userModel = UserModel.fromMap(value.data()!);
        print('userModel ==> ${userModel!.toMap()}');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: StyleProjects().backgroundState,
      appBar: AppBar(
        backgroundColor: StyleProjects().primaryColor,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ReadProfilePage(
                  uid: '',
                ),
              )).then((value) {
            readProfile();
          });
        },
        //backgroundColor: Colors.amber,
        backgroundColor: StyleProjects().baseColor,
        child: const Icon(Icons.edit),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      body: SingleChildScrollView(
        child: load
            ? const Center(child: ConfigProgress())
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    StyleProjects().boxheight1,
                    Center(
                      child: Text(
                        'ข้อมูลลูกค้า',
                        style: StyleProjects().topicstyle1,
                      ),
                    ),
                    StyleProjects().boxheight1,
                    //
                    /*
                  AvatarView(
                    radius: 70,
                    borderWidth: 8,
                    // borderColor: Colors.yellow,
                   // borderColor: Color(0xff033674),
                   borderColor: Color(0xfff8d800),
                    avatarType: AvatarType.CIRCLE,
                    backgroundColor: Colors.red,
                    imagePath: userModel!.images!,
                    placeHolder: Container(
                      child: Icon(
                        Icons.person,
                        size: 50,
                      ),
                    ),
                    errorWidget: Container(
                      child: Icon(
                        Icons.error,
                        size: 50,
                      ),
                    ),
                  ),

                  //
                  AvatarView(
                    radius: 60,
                    borderColor: Colors.yellow,
                    isOnlyText: false,
                    text: Text(
                      'C',
                      style: TextStyle(color: Colors.white, fontSize: 50),
                    ),
                    avatarType: AvatarType.CIRCLE,
                    backgroundColor: Colors.red,
                    imagePath: userModel!.images!,
                    placeHolder: Container(
                      child: Icon(
                        Icons.person,
                        size: 50,
                      ),
                    ),
                    errorWidget: Container(
                      child: Icon(
                        Icons.error,
                        size: 50,
                      ),
                    ),
                  ),

*/
                    //

                    AvatarView(
                      radius: 80,
                      borderWidth: 6,
                      // borderColor: Colors.yellow,
                      //borderColor: Color(0xff033674),
                      borderColor: Color(0xfff8d800),
                      //borderColor: Color.fromARGB(255, 182, 255, 173),
                      avatarType: AvatarType.CIRCLE,
                      backgroundColor: Colors.red,
                      imagePath: userModel!.images!,
                      placeHolder: Container(
                        child: Icon(
                          Icons.person,
                          size: 50,
                        ),
                      ),
                      errorWidget: Container(
                        child: Icon(
                          Icons.error,
                          size: 50,
                        ),
                      ),
                    ),


/*
                    ConfigAvatar(
                      urlImage: userModel!.images!,
                      size: 75,
                    ),


*/
                    //
                    StyleProjects().boxheight1,
                    blockDetail(head: 'ชื่อ :', value: userModel!.fname!),
                    blockDetail(head: 'นามสกุล :', value: userModel!.lname!),
                    blockDetail(head: 'ที่อยู่ :', value: userModel!.address!),
                    blockDetail(head: 'ตำบล :', value: userModel!.subdistrict!),
                    blockDetail(head: 'อำเภอ :', value: userModel!.district!),
                    blockDetail(head: 'จังหวัด :', value: userModel!.province!),
                    blockDetail(
                        head: 'รหัสไปรษณีย์ :', value: userModel!.zipcode!),
                    blockDetail(
                        head: 'เบอร์โทรศัพท์ :', value: userModel!.phone!),
                    blockDetail(head: 'Email :', value: userModel!.email!),
                  ],
                ),
              ),
      ),

/*
      load
          ? const Center(child: ConfigProgress())
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  StyleProjects().boxTop2,
                  Center(
                    child: Text(
                      'ข้อมูลลูกค้า',
                      style: StyleProjects().topicstyle1,
                    ),
                  ),
                  StyleProjects().boxTop2,
                  //
                  /*
                  AvatarView(
                    radius: 70,
                    borderWidth: 8,
                    // borderColor: Colors.yellow,
                   // borderColor: Color(0xff033674),
                   borderColor: Color(0xfff8d800),
                    avatarType: AvatarType.CIRCLE,
                    backgroundColor: Colors.red,
                    imagePath: userModel!.images!,
                    placeHolder: Container(
                      child: Icon(
                        Icons.person,
                        size: 50,
                      ),
                    ),
                    errorWidget: Container(
                      child: Icon(
                        Icons.error,
                        size: 50,
                      ),
                    ),
                  ),

                  //
                  AvatarView(
                    radius: 60,
                    borderColor: Colors.yellow,
                    isOnlyText: false,
                    text: Text(
                      'C',
                      style: TextStyle(color: Colors.white, fontSize: 50),
                    ),
                    avatarType: AvatarType.CIRCLE,
                    backgroundColor: Colors.red,
                    imagePath: userModel!.images!,
                    placeHolder: Container(
                      child: Icon(
                        Icons.person,
                        size: 50,
                      ),
                    ),
                    errorWidget: Container(
                      child: Icon(
                        Icons.error,
                        size: 50,
                      ),
                    ),
                  ),

*/
                  //

                  ConfigAvatar(
                    urlImage: userModel!.images!,
                    size: 75,
                  ),

                  //
                  StyleProjects().boxTop2,
                  blockDetail(head: 'ชื่อ :', value: userModel!.fname!),
                  blockDetail(head: 'นามสกุล :', value: userModel!.lname!),
                  blockDetail(head: 'ที่อยู่ :', value: userModel!.address!),
                  blockDetail(head: 'ตำบล :', value: userModel!.subdistrict!),
                  blockDetail(head: 'อำเภอ :', value: userModel!.district!),
                  blockDetail(head: 'จังหวัด :', value: userModel!.province!),
                  blockDetail(
                      head: 'รหัสไปรษณีย์ :', value: userModel!.zipcode!),
                  blockDetail(
                      head: 'เบอร์โทรศัพท์ :', value: userModel!.phone!),
                  blockDetail(head: 'Email :', value: userModel!.email!),
                ],
              ),
            ),
    
    */
    );
  }

  Row blockDetail({required String head, required String value}) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(5),
          child: ConfigText(
            lable: head,
            textStyle: StyleProjects().topicstyle4,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(2),
          child: ConfigText(
            lable: value,
            textStyle: StyleProjects().topicstyle4,
          ),
        ),
        /*
        Expanded(
          flex: 2,
          child: ConfigText(
            lable: head,
            textStyle: StyleProjects().topicstyle4,
          ),
        ),
        Expanded(
          flex: 3,
          child: ConfigText(
            lable: value,
            textStyle: StyleProjects().topicstyle4,
          ),
        ),
        */
      ],
    );
  }
}
