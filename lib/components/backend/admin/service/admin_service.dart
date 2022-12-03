/*




import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shopstate/components/admin/admin/mis_listadmin.dart';
import 'package:shopstate/components/admin/services/admin_info.dart';
import 'package:shopstate/components/guest/Authentication/authentication.dart';
import 'package:shopstate/components/guest/homescreen/homescreen.dart';
import 'package:shopstate/components/guest/register/registerpages.dart';
import 'package:shopstate/models/user_model.dart';
import 'package:shopstate/utility/stylepro.dart';

class AdminService extends StatefulWidget {
  @override
  _AdminServiceState createState() => _AdminServiceState();
}

class _AdminServiceState extends State<AdminService> {
  UserModel? userModel;
  Widget currentWidget = AdmininfoPage(
    uid: '',
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findUserLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            onPressed: () {
              FirebaseAuth auth = FirebaseAuth.instance;
              auth.signOut().then((res) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AuthenticationPage()),
                    (Route<dynamic> route) => false);
              });
            },
          )
        ],
      ),
      drawer: Drawer(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  buildUserAccountsDrawerHeader(),
                  buildListAdmin(),
                  buildListPublishing(),
                  buildListFilePrint(),
                  buildListHistory(),
                  buildListJobTracking(),
                  buildListTransport(),
                ],
              ),
            ),
            buildLogout(),
          ],
        ),
      ),
      body: currentWidget,
    );
  }

  ListTile buildListAdmin() {
    return ListTile(
      leading: IconButton(
        icon: new Icon(Icons.assignment_ind, color: Colors.black),
        onPressed: () => null,
      ),
      title: Text(
        'ข้อมูลผู้ดูแลระบบ',
        style: TextStyle(
          fontFamily: 'THSarabunNew',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          //color: const Color(0xFF000120),
          color: Colors.black,
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ListAdminPage(),
          ),
        );
      },
    );
  }

ListTile buildListProducts() {
    return ListTile(
      leading: IconButton(
        icon: new Icon(Icons.add_box_outlined, color: Colors.black),
        onPressed: () => null,
      ),
      title: Text(
        'แก้ไขหมวดหมู่และแบบพิมพ์',
        style: TextStyle(
          fontFamily: 'THSarabunNew',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          //color: const Color(0xFF000120),
          color: Colors.black,
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ListAdminPage(),
          ),
        );
      },
    );
  }

  
  ListTile buildListPublishing() {
    return ListTile(
      leading: IconButton(
        icon: new Icon(Icons.shopping_cart_outlined, color: Colors.black),
        onPressed: () => null,
      ),
      title: Text(
        'สั่งซื้อ/สั่งพิมพ์แบบพิมพ์',
        style: TextStyle(
          fontFamily: 'THSarabunNew',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          //color: const Color(0xFF000120),
          color: Colors.black,
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AdminService()),
        );
      },
    );
  }

  ListTile buildListFilePrint() {
    return ListTile(
      leading: IconButton(
        icon: new Icon(Icons.cloud_upload, color: Colors.black),
        onPressed: () => null,
      ),
      title: Text(
        'ส่งไฟล์งาน',
        style: TextStyle(
          fontFamily: 'THSarabunNew',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          //color: const Color(0xFF000120),
          color: Colors.black,
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AdminService()),
        );
      },
    );
  }

  ListTile buildListHistory() {
    return ListTile(
      leading: IconButton(
        icon: new Icon(Icons.description_outlined, color: Colors.black),
        onPressed: () => null,
      ),
      title: Text(
        'ประวัติการสั่งซื้อ/สั่งพิมพ์',
        style: TextStyle(
          fontFamily: 'THSarabunNew',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          //color: const Color(0xFF000120),
          color: Colors.black,
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AdminService()),
        );
      },
    );
  }

  ListTile buildListJobTracking() {
    return ListTile(
      leading: IconButton(
        icon: new Icon(Icons.invert_colors_on_outlined, color: Colors.black),
        onPressed: () => null,
      ),
      title: Text(
        'ติดตามงานพิมพ์',
        style: TextStyle(
          fontFamily: 'THSarabunNew',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          //color: const Color(0xFF000120),
          color: Colors.black,
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AdminService()),
        );
      },
    );
  }

  ListTile buildListTransport() {
    return ListTile(
      leading: IconButton(
        icon: new Icon(Icons.beenhere_outlined, color: Colors.black),
        onPressed: () => null,
      ),
      title: Text(
        'ติดตามการจัดส่ง',
        style: TextStyle(
          fontFamily: 'THSarabunNew',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          //color: const Color(0xFF000120),
          color: Colors.black,
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AdminService()),
        );
      },
    );
  }

  UserAccountsDrawerHeader buildUserAccountsDrawerHeader() {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        image: DecorationImage(
          //image: AssetImage('assets/images/img00100.jpg'),
          //image: AssetImage('assets/images/img00100.jpg'),
          image: AssetImage('assets/images/pro901.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      currentAccountPicture: userModel == null
          ? Image.asset('assets/images/avatar.png')
          : CircleAvatar(
              radius: 30.0,
              //backgroundImage: NetworkImage(userModel.images),
              /*
              backgroundImage:
                    NetworkImage("${snapshot.data.hitsList[index].images}"),
                backgroundColor: Colors.transparent,
              */

              backgroundImage: NetworkImage('images'),
              backgroundColor: Colors.transparent,
            ),

      accountName: Row(
        children: [
          Text(
            'คุณ',
            style: TextStyle(
              fontFamily: 'THSarabunNew',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              //color: const Color(0xFF000120),
              color: const Color(0xFFFFFFFF),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'fname',
            style: TextStyle(
              fontFamily: 'THSarabunNew',
              fontSize: 20,
              fontWeight: FontWeight.normal,
              //color: const Color(0xFF000120),
              color: const Color(0xFFFFFFFF),
            ),
          ),
        ],
      ),
      accountEmail: Row(
        children: [
          Text(
            'อีเมล',
            style: TextStyle(
              fontFamily: 'THSarabunNew',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              //color: const Color(0xFF000120),
              color: const Color(0xFFFFFFFF),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'email',
            style: TextStyle(
              fontFamily: 'THSarabunNew',
              fontSize: 20,
              fontWeight: FontWeight.normal,
              //color: const Color(0xFF000120),
              color: const Color(0xFFFFFFFF),
            ),
          ),
        ],
      ),

//2
/*
    accountEmail: FutureBuilder(
            future: FirebaseFirestore.instance
                .collection("Users")
                .doc()
                .get(),
                builder: (context, AsyncSnapshot<DataSnapshot> snapshot,) {
            //builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.value['email']);
              } else {
                return CircularProgressIndicator();
              }
            }),

    //

    */
    );
  }

  Column buildLogout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.red.shade700),
          child: ListTile(
            onTap: () async {
              await Firebase.initializeApp().then((value) async {
                await FirebaseAuth.instance
                    .signOut()
                    .then((value) => Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AuthenticationPage(),
                        ),
                        (route) => false));
              });
            },
            leading: Icon(
              Icons.exit_to_app,
              size: 36,
              color: Colors.white,
            ),
            title: Text(
              'ออกจากระบบ',
              style: TextStyle(
                fontFamily: 'THSarabunNew',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFFFFFFF),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<Null> findUserLogin() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseAuth.instance.authStateChanges().listen((event) async {
        String uid = event!.uid;
        print('uid ===>> $uid');
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(uid)
            .snapshots()
            .listen((event) {
          setState(() {
            /*
            userModel = UserModel.fromJson(event.data()!);
            //userModel = UserModel.fromJson(event.data());
            switch (userModel!.level) {
                case 'customer':
                  if (userModel!.level == 'customer') {
                    Navigator.pushNamedAndRemoveUntil(
                        context, StyleProjects.routeCustomer, (route) => false);
                  } else {
                    Navigator.pushNamedAndRemoveUntil(
                        context, StyleProjects.routeAdmin, (route) => false);
                  }

                  break;
                default:
              }
              */

            //
          });
        });
      });
    });
  }

  //
}


*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tdvpprint/components/backend/admin/info/mis_listsinfo.dart';
import 'package:tdvpprint/components/frontend/guest/authentication/authentication.dart';
import 'package:tdvpprint/models/users_model.dart';
import 'package:tdvpprint/utility/style.dart';




class AdminService extends StatefulWidget {
  const AdminService({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AdminServiceState createState() => _AdminServiceState();
}

class _AdminServiceState extends State<AdminService> {
  UserModel? userModel;
  Widget currentWidget = ListsInfoPages();
  
  /*
  AdmininfoPage(
    uid: '',
  );
  */

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findUserLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: StyleProjects().primaryColor,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            onPressed: () {
              FirebaseAuth auth = FirebaseAuth.instance;
              auth.signOut().then((res) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AuthenticationPage(),
                    ),
                    (Route<dynamic> route) => false);
              });
            },
          )
        ],
      ),
      drawer: Drawer(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  buildUserAccountsDrawerHeader(),
                  buildListAdmin(),
                  buildListProducts(),
                  buildListPublishing(),
                  buildListTransportation(),
                  buildListPrinting(),
                  buildListNews(),
                  buildListAccount(),
                  buildListFilePDF(),
                ],
              ),
            ),
            blockLogout(),
          ],
        ),
      ),
      body: currentWidget,
    );
  }


  ListTile buildListAdmin() {
    return ListTile(
      leading: IconButton(
        icon: new Icon(
          Icons.person_add_alt_1_outlined,
          color: Colors.black,
        ),
        onPressed: () => null,
      ),
      title: Text(
        'ผู้ดูแลระบบ',
        style: TextStyle(
          fontFamily: 'THSarabunNew',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          //color: const Color(0xFF000120),
          color: Colors.black,
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        setState(() {
          currentWidget = ListsInfoPages();
          //const ProfileAdmin();
        });
      },
    );
  }


  ListTile buildListProducts() {
    return ListTile(
      leading: IconButton(
        icon: new Icon(
          Icons.add_chart,
          color: Colors.black,
        ),
        onPressed: () => null,
      ),
      title: Text(
        'หมวดสินค้า/รายการสินค้า',
        style: TextStyle(
          fontFamily: 'THSarabunNew',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          //color: const Color(0xFF000120),
          color: Colors.black,
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        setState(() {
          currentWidget = ListsInfoPages();
        });
      },
    );
  }

  ListTile buildListPublishing() {
    return ListTile(
      leading: IconButton(
        icon: new Icon(
          //Icons.print_rounded,
          Icons.production_quantity_limits,
          color: Colors.black,
        ),
        onPressed: () => null,
      ),
      title: Text(
        'การสั่งซื้อ/สั่งพิมพ์',
        style: TextStyle(
          fontFamily: 'THSarabunNew',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          //color: const Color(0xFF000120),
          color: Colors.black,
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        setState(() {
          currentWidget = ListsInfoPages();
        });
      },
    );
  }

  ListTile buildListNews() {
    return ListTile(
      leading: IconButton(
        icon: new Icon(
          Icons.new_label_sharp,
          color: Colors.black,
        ),
        onPressed: () => null,
      ),
      title: Text(
        'ข่าวสาร',
        style: TextStyle(
          fontFamily: 'THSarabunNew',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          //color: const Color(0xFF000120),
          color: Colors.black,
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        setState(() {
          currentWidget = ListsInfoPages();
        });
      },
    );
  }

  ListTile buildListTransportation() {
    return ListTile(
      leading: IconButton(
        icon: new Icon(
          Icons.real_estate_agent,
          color: Colors.black,
        ),
        onPressed: () => null,
      ),
      title: Text(
        'การขนส่ง',
        style: TextStyle(
          fontFamily: 'THSarabunNew',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          //color: const Color(0xFF000120),
          color: Colors.black,
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        setState(() {
          currentWidget = ListsInfoPages();
        });
      },
    );
  }

  ListTile buildListPrinting() {
    return ListTile(
      leading: IconButton(
        icon: new Icon(
          Icons.invert_colors,
          //Icons.add_task,
          color: Colors.black,
        ),
        onPressed: () => null,
      ),
      title: Text(
        'ขั้นตอนการพิมพ์',
        style: TextStyle(
          fontFamily: 'THSarabunNew',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          //color: const Color(0xFF000120),
          color: Colors.black,
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        setState(() {
          currentWidget = ListsInfoPages();
        });
      },
    );
  }

  ListTile buildListAccount() {
    return ListTile(
      leading: IconButton(
        icon: new Icon(
          Icons.add_task,
          color: Colors.black,
        ),
        onPressed: () => null,
      ),
      title: Text(
        'รายรับ-รายจ่าย',
        style: TextStyle(
          fontFamily: 'THSarabunNew',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          //color: const Color(0xFF000120),
          color: Colors.black,
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        setState(() {
          currentWidget = ListsInfoPages();
        });
      },
    );
  }

  ListTile buildListFilePDF() {
    return ListTile(
      leading: IconButton(
        icon: new Icon(
          Icons.cloud_download,
          color: Colors.black,
        ),
        onPressed: () => null,
      ),
      title: Text(
        'ไฟล์งาน',
        style: TextStyle(
          fontFamily: 'THSarabunNew',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          //color: const Color(0xFF000120),
          color: Colors.black,
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        setState(() {
          currentWidget = ListsInfoPages();
        });
      },
    );
  }

  UserAccountsDrawerHeader buildUserAccountsDrawerHeader() {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        image: DecorationImage(
          //image: AssetImage('assets/images/img00100.jpg'),
          //image: AssetImage('assets/images/img00100.jpg'),
          image: AssetImage('assets/images/pro901.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      currentAccountPicture: userModel == null
          ? Image.asset('assets/images/avatar.png')
          : CircleAvatar(
              radius: 30.0,
              //backgroundImage: NetworkImage(userModel.images),
              /*
              backgroundImage:
                    NetworkImage("${snapshot.data.hitsList[index].images}"),
                backgroundColor: Colors.transparent,
              */

              backgroundImage: NetworkImage('images'),
              backgroundColor: Colors.transparent,
            ),
      accountName: Row(
        children: [
          Text(
            'คุณ',
            style: TextStyle(
              fontFamily: 'THSarabunNew',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              //color: const Color(0xFF000120),
              color: const Color(0xFFFFFFFF),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'fname',
            style: TextStyle(
              fontFamily: 'THSarabunNew',
              fontSize: 20,
              fontWeight: FontWeight.normal,
              //color: const Color(0xFF000120),
              color: const Color(0xFFFFFFFF),
            ),
          ),
        ],
      ),
      accountEmail: Row(
        children: [
          Text(
            'อีเมล',
            style: TextStyle(
              fontFamily: 'THSarabunNew',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              //color: const Color(0xFF000120),
              color: const Color(0xFFFFFFFF),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'email',
            style: TextStyle(
              fontFamily: 'THSarabunNew',
              fontSize: 20,
              fontWeight: FontWeight.normal,
              //color: const Color(0xFF000120),
              color: const Color(0xFFFFFFFF),
            ),
          ),
        ],
      ),
    );
  }

  Column blockLogout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.red.shade700),
          child: ListTile(
            onTap: () async {
              await Firebase.initializeApp().then((value) async {
                await FirebaseAuth.instance
                    .signOut()
                    .then((value) => Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AuthenticationPage(),
                        ),
                        (route) => false));
              });
            },
            leading: Icon(
              Icons.exit_to_app,
              size: 36,
              color: Colors.white,
            ),
            title: Text(
              'ออกจากระบบ',
              style: TextStyle(
                fontFamily: 'THSarabunNew',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFFFFFFF),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<Null> findUserLogin() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseAuth.instance.authStateChanges().listen((event) async {
        String uid = event!.uid;
        print('uid ===>> $uid');
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(uid)
            .snapshots()
            .listen((event) {
          setState(() {});
        });
      });
    });
  }

  //
}
