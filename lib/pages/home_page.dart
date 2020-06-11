import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttercovid19/core/flutter_icons.dart';
import 'package:fluttercovid19/pages/static.dart';

import '../core/constant.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: bgColor,
      //stack like framelayout in android native
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //header view
            Header_View(),

            //body view
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //multiple color in one text, text Symptoms of COVID 19
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 20, bottom: 10),
                    child: RichText(
                      //a half text color black
                      text: TextSpan(
                          text: 'Symptoms of',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),

                          //a half text color purple
                          children: [
                            TextSpan(
                              text: ' Covid 19'.toUpperCase(),
                              style: TextStyle(
                                color: primaryColor,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]),
                    ),
                  ),

                  //listview horizontal
                  Container(
                    height: 120,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(left: 20),

                      //anim scroll listview
                      physics: BouncingScrollPhysics(),
                      children: <Widget>[
                        _buildSymptomItem('assets/images/1.png', 'Fever'),
                        SizedBox(
                          width: 20,
                        ),
                        _buildSymptomItem('assets/images/2.png', 'Dry Cough'),
                        SizedBox(
                          width: 20,
                        ),
                        _buildSymptomItem('assets/images/3.png', 'Headache'),
                        SizedBox(
                          width: 20,
                        ),
                        _buildSymptomItem('assets/images/4.png', 'Breathless'),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 15),
                    child: Text(
                      'Prevention',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  //list view prevention
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => StaticPage()),
                      );
                    },
                    child: Container(
                      height: 100,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.only(left: 20),

                        //anim scroll listview
                        physics: BouncingScrollPhysics(),
                        children: <Widget>[
                          _buildPreventionItem('assets/images/a10.png',
                              'Wash'.toUpperCase(), 'honds often'),
                          _buildPreventionItem('assets/images/a4.png',
                              'Cover'.toUpperCase(), 'your cough'),
                          _buildPreventionItem('assets/images/a6.png',
                              'Always'.toUpperCase(), 'clean'),
                          _buildPreventionItem('assets/images/a9.png',
                              'Use'.toUpperCase(), 'mask'),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 5,
                  ),

                  Container(
                    height: 100,
                    margin: EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        color: Colors.white,
                        //shadow for cardview
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.2, 0.2),
                            spreadRadius: 0.2,
                            blurRadius: 2,
                          ),
                        ]),
                    padding: EdgeInsets.only(left: 15, top: 10, bottom: 10),
                    //image in cardview
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Image.asset(
                            'assets/images/map.png',
                            alignment: Alignment.center,
                          ),
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Cases'.toUpperCase(),
                                style: TextStyle(
                                  color: Colors.purple,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'overview worldwide',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '21.118.594 confirmed',
                                style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: SizedBox(),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                              icon: Icon(Icons.arrow_forward_ios),
                              iconSize: 24,
                              color: Colors.black54,
                              onPressed: () {}),
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
}

//item listview Symptom
Widget _buildSymptomItem(String assetsImage, String titleItem) {
  return Align(
    alignment: Alignment.center,
    child: Column(
      //set item center in listview when use column
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        //cardview
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),

              //gradient for cardview
              gradient: LinearGradient(
                colors: [
                  alphaColor80,
                  Colors.white,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),

              //border white around cardview
              border: Border.all(color: Colors.white),

              //shadow for cardview
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0.2, 0.2),
                  spreadRadius: 0.2,
                  blurRadius: 2,
                ),
              ]),

          //padding view in cardview
          padding: EdgeInsets.only(top: 15),
          alignment: Alignment.center,
          //image in cardview
          child: Image.asset(assetsImage),
        ),

        //space
        SizedBox(
          height: 5,
        ),

        //text item listview
        Align(
          alignment: Alignment.center,
          child: Text(
            titleItem,
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.normal,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );
}

//item listview prevention
Widget _buildPreventionItem(
    String assetsImage, String titleItem, String subTitleItem) {
  return Align(
    alignment: Alignment.center,
    child: Row(
      children: <Widget>[
        Column(
          //set item center in listview when use column
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //cardview
            Container(
              height: 80,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  color: Colors.white,
                  //shadow for cardview
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.2, 0.2),
                      spreadRadius: 0.2,
                      blurRadius: 2,
                    ),
                  ]),

              //padding view in cardview
              margin: EdgeInsets.only(right: 10),
              alignment: Alignment.center,
              //image in cardview
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Image.asset(
                      assetsImage,
                      alignment: Alignment.center,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          titleItem.toUpperCase(),
                          style: TextStyle(
                            color: Colors.purple,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          subTitleItem,
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 15.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

//header view
class Header_View extends StatelessWidget {
  const Header_View({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        //widget view
        Container(
          decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              )),
          child: Container(
            margin: EdgeInsets.only(left: 20, top: 40, right: 20, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //app bar with icon menu and image avatar
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      //icon menu
                      GestureDetector(
                        child: Icon(
                          FlutterIcons.menu,
                          color: Colors.white,
                          size: 28.0,
                        ),
                        onTap: null,
                      ),

                      //image avatar
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                            image: AssetImage('assets/images/profile.jpg'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 20,
                ),
                //text
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //text COVID 19
                    Text(
                      'Covid 19'.toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    //text Coronavirus Reliaf Fund
                    Text(
                      'Coronavirus Reliaf Fund',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    //text Coronavirus Reliaf Fund
                    Text(
                      'To this fund will help stop the virus is spread and give commuunication the front linears. ',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 10,
                ),

                //2 button DONATE NOW and  EMERGENCY

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    //button DONATE NOW
                    Expanded(
                      child: RaisedButton(
                        color: Colors.blue,
                        highlightElevation: 3,
                        onPressed: () {},
                        child: Text(
                          'Donate Now'.toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                      ),
                    ),

                    SizedBox(
                      width: 20,
                    ),

                    //button EMERGENCY
                    Expanded(
                      child: RaisedButton(
                        color: Colors.red,
                        highlightElevation: 3,
                        onPressed: () {},
                        child: Text(
                          'Emergency'.toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        //image virus2 is background with opacity
        Opacity(
          opacity: 0.8,
          child: Image.asset('assets/images/virus2.png'),
        ),
      ],
    );
  }
}
