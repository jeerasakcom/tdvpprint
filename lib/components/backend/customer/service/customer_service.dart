import 'dart:async';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tdvpprint/components/backend/customer/orders/orders_customer.dart';
import 'package:tdvpprint/components/backend/customer/profile/read_profile.dart';
import 'package:tdvpprint/components/frontend/guest/authentication/authentication.dart';
import 'package:tdvpprint/models/users_model.dart';
import 'package:tdvpprint/utility/style.dart';




class CustomerService extends StatefulWidget {
  const CustomerService({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CustomerServiceState createState() => _CustomerServiceState();
}

class _CustomerServiceState extends State<CustomerService> {
  UserModel? userModel;
  Widget currentWidget = const CustomerOrdersPage();
  //CustomerProfilePage(uid: '',);
  //const ReadProfilePage(uid: '',);

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
        backgroundColor: StyleProjects().baseColor,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            /*
            onPressed: () {
              FirebaseAuth auth = FirebaseAuth.instance;
              auth.signOut().then((res) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => AuthenticationPage()),
                    (Route<dynamic> route) => false);
              });
            },

            */

            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor:
                        //Color.fromARGB(255, 255, 199, 199),
                        // Color.fromARGB(255, 255, 222, 222),
                        Color.fromARGB(255, 255, 250, 250),
                    title: Text(
                      'Exit',
                      style: StyleProjects().alertstyle1,
                    ),
                    content: Text(
                      'คุณต้องการออกจากระบบ ?',
                      style: StyleProjects().alertstyle2,
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () async {
                          FirebaseAuth auth = FirebaseAuth.instance;
                          auth.signOut().then((res) {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AuthenticationPage()),
                                (Route<dynamic> route) => false);
                          });
                        },
                        child: Text(
                          'ใช่',
                          style: StyleProjects().alertstyle2,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'ไม่ใช่',
                          style: StyleProjects().alertstyle2,
                        ),
                      ),
                    ],
                  );
                },
              );
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
                  buildListProfile(),
                  buildListPublishing(),
                  buildListFilePrint(),
                  buildListHistory(),
                  buildListJobTracking(),
                  buildListTransport(),
                ],
              ),
            ),
            blockLogout(),
           // ConfigLogout(),
            
          ],
        ),
      ),
      body: currentWidget,
    );
  }

  ListTile buildListProfile() {
    return ListTile(
      leading: IconButton(
        icon: new Icon(Icons.assignment_ind, color: Colors.black),
        onPressed: () => null,
      ),
      title: Text(
        'แก้ไขข้อมูลส่วนตัว',
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
          //MaterialPageRoute(builder: (context) => CustomerProfilePage(uid: '',)),
          MaterialPageRoute(
            builder: (context) => ReadProfilePage(
              uid: '',
            ),
            //CustomerDataProfilePage(),
            //ProfileDataCustomer(),
            //EditProfile(),
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
          MaterialPageRoute(builder: (context) => CustomerService()),
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
          MaterialPageRoute(builder: (context) => CustomerService()),
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
          MaterialPageRoute(builder: (context) => CustomerService()),
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
          MaterialPageRoute(builder: (context) => CustomerService()),
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
          MaterialPageRoute(builder: (context) => CustomerService()),
        );
      },
    );
  }

  UserAccountsDrawerHeader buildUserAccountsDrawerHeader() {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/img00100.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      currentAccountPicture: userModel == null
          ? Image.asset('assets/images/avatar.png')
          : CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(userModel!.images!),
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

          //
          /*
          Text(
            snapshot.data!.docs.elementAt(index)['fname'].toString(),
            style: TextStyle(
              fontFamily: 'THSarabunNew',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: const Color(0xff000f3b),
            ),
          ),
          */
        ],
      ),
      accountEmail: Row(
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

          //
          /*
          Text(
            snapshot.data!.docs.elementAt(index)['fname'].toString(),
            style: TextStyle(
              fontFamily: 'THSarabunNew',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: const Color(0xff000f3b),
            ),
          ),
          */
        ],
      ),

      //8
      /*
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
    
    
    */

/*
      accountEmail: Row(
        children: [
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("Users")
                .orderBy('id', descending: true)
                .snapshots(),
            builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return Text(
                          'กรุณารอสักครู่นะคะ...',
                          style: StyleProjects().contentstyle6,
                        );
                      }
                        }
          ),
        ],
      ),
   
   */

/*
      accountEmail: Row(
        children: [
          StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("Users")
                  .where("uid")
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    shrinkWrap: true,
                    itemBuilder: (context, i) {
                      var data = snapshot.data!.docs[i];
                      return UserAccountsDrawerHeader(
                          accountName: Text(
                              data['first name'] + " " + data['last name']),
                          accountEmail: Text(data['email address']));
                    },
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text('Loading Data......'),
                  );
                }
              }),
        ],
      ),
    
    
    
    
    
    */
    );
  }

//2
/*
  UserAccountsDrawerHeader buildUserAccountsDrawerHeader() {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        image: DecorationImage(
          //image: AssetImage('assets/images/img00100.jpg'),
          image: AssetImage('assets/images/img00100.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      currentAccountPicture: userModel == null
          ? Image.asset('assets/images/avatar.png')
          : CircleAvatar(
              radius: 30.0,
             // backgroundImage: NetworkImage(UserModel.fromJson('images')),
            ),

      /*     
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

          //
          /*
          Text(
            snapshot.data!.docs.elementAt(index)['fname'].toString(),
            style: TextStyle(
              fontFamily: 'THSarabunNew',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: const Color(0xff000f3b),
            ),
          ),
          */
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
  
  
  */
      accountName: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future: FirebaseFirestore.instance.collection('Users').doc().get(),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data!.data();
            var value = data!['fname'];
            return Text(value);
          }
          return const Text('User');
        },
      ),

/*
            future: FirebaseFirestore.instance
                .collection("Users")
                .doc()
                .get(),
                builder: (_, snapshot) {
                    if (snapshot.hasData) {
                      //var data = snapshot.data!.data();
                      //var data = snapshot.data?.docs.elementAt(index)['fname'];
                      var data = snapshot.data?.DocumentSnapshot();
                      var value = data!['fname'];
                      return Text(value);
                    }
                    return const Text('Users');
                  },
*/

      //
      /*
            builder: (context, AsyncSnapshot<querySnapshot> snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.value['fname']);
              } else {
                return CircularProgressIndicator();
              }
            },
            */

      // ),

      accountEmail: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future: FirebaseFirestore.instance.collection('Users').doc().get(),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data!.data();
            var value = data!['email'];
            return Text(value);
          }
          return const Text('User');
        },
      ),

//2
/*
  accountEmail: FutureBuilder(
            future: FirebaseFirestore.instance
                .collection("Users")
                .doc()
                .get(),
            builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.value['email']);
              } else {
                return CircularProgressIndicator();
              }
            }),
  


  */
    );
  }

*/
  Column blockLogout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.red.shade700),
          child: ListTile(
            /*
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
            */
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor:
                        //Color.fromARGB(255, 255, 199, 199),
                        // Color.fromARGB(255, 255, 222, 222),
                        Color.fromARGB(255, 255, 250, 250),
                    title: Text(
                      'Exit',
                      style: StyleProjects().alertstyle1,
                    ),
                    content: Text(
                      'คุณต้องการออกจากระบบ ?',
                      style: StyleProjects().alertstyle2,
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: Text(
                          'ใช่',
                          style: StyleProjects().alertstyle2,
                        ),
                        onPressed: () async {
                          
                          FirebaseAuth auth = FirebaseAuth.instance;
                          auth.signOut().then((res) {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AuthenticationPage()),
                                (Route<dynamic> route) => false);
                          });

                          

                          //2
                          /*
                          FirebaseAuth.instance.signOut().then(
                            (value) {
                              Navigator.pushNamedAndRemoveUntil(context,
                                  StyleProjects.routeHome, (route) => false);
                            },
                          );

                          */

                          

                          //
                        },
                      ),
                      TextButton(
                        child: Text(
                          'ไม่ใช่',
                          style: StyleProjects().alertstyle2,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
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
