import 'package:flutter/material.dart';
import 'package:tdvpprint/utility/style.dart';

class EvaluationPage extends StatefulWidget {
  const EvaluationPage({super.key});

  @override
  State<EvaluationPage> createState() => _EvaluationPageState();
}

class _EvaluationPageState extends State<EvaluationPage> {
  /*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/p13.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        StyleProjects().boxTop1,
        Padding(
          padding: EdgeInsets.only(top: 50),
          child: _backButton(),
        ),
         Padding(
          padding: EdgeInsets.only(top: 50),
          child: Card(),
        ),
      ],
    ));
  }


*/
//

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/p13.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 20,
              bottom: 20,
              left: 20,
              right: 20,
              child: ListView(
                children: <Widget>[
                  StyleProjects().boxTop2,
                  _backButton(),
                  StyleProjects().boxheight1,
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xfffffdf9),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 200,
                          width: 200,
                          child: Stack(children: [_headertext()]),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _headertext() {
    return Container(
      child: Column(
        children: [
          Center(
            child: Text(
              'การประเมินราคาสิ่งพิมพ์',
              style: TextStyle(
                fontFamily: 'THSarabunNew',
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: const Color(0xff004080),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              '**ราคาอาจมีการเปลี่ยนแปลง**',
              style: TextStyle(
                fontFamily: 'THSarabunNew',
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: const Color(0xfff57777),
              ),
            ),
          ),
        ],
      ),
    );
  }

//
  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: const Icon(
                Icons.keyboard_arrow_left,
                color: Color(0xffffda7a),
              ),
            ),
            Text(
              'Back',
              style: StyleProjects().topicstyle7,
            )
          ],
        ),
      ),
    );
  }
}
