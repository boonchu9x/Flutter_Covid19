import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/constant.dart';
import 'home_page.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    //get size width and height of device
    Size size = MediaQuery.of(context).size;
    //change status bar color transparent
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      //statusBarBrightness: Brightness.dark,
    ));
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          //gradient
          gradient: LinearGradient(
            colors: [
              //color 1
              primaryColor,
              //color 2
              primaryColor.withOpacity(0.55),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter, /**/
          ),
        ),

        //lớp chồng nhau
        child: Stack(
          children: <Widget>[
            //image logo header
            Header_View(size: size),

            //image virus2 and doctor
            Body_View(size: size),

            //text and button get started
            Bottom_View(size: size),
          ],
        ),
      ),
    );
  }
}

class Header_View extends StatelessWidget {
  final Size size;

  const Header_View({
    Key key,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 50),
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
            width: size.width * 0.64,
            child: Image.asset('assets/images/logo.png')),
      ),
    );
  }
}

class Body_View extends StatelessWidget {
  const Body_View({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        //image doctor
        Positioned(
          top: size.height * 0.28,
          right: 60,
          child: Container(
              alignment: Alignment.topRight,
              width: size.width * 0.3,
              child: Image.asset('assets/images/doctor.png')),
        ),

        //image virus
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
              margin: EdgeInsets.only(left: size.width * 0.15),
              width: size.width * 0.6,
              child: Image.asset('assets/images/virus.png')),
        ),
      ],
    );
  }
}

class Bottom_View extends StatelessWidget {
  const Bottom_View({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 40,
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                'Coronavirus disease (COVID-19)',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'is an infectious disease caused by a new\nvirus.',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          SizedBox(
            height: 25.0,
          ),
          //button get started, width = width screen * 0.85

          Container(
            width: size.width * 0.75,
            height: 45,
            //button GET STARTED with ripple
            child: RaisedButton(
              color: Colors.white,

              //elevator when press button
              highlightElevation: 3,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => HomePage(),
                  ),
                );
              },
              child: Text(
                'Get started'.toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 19.0,
                  color: primaryColor,
                ),
                textAlign: TextAlign.center,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
