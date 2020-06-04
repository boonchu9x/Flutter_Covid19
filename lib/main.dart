import 'package:flutter/material.dart';
import 'file:///C:/Users/CanhLX.Hachinet/Desktop/Flutter/flutter_covid19/lib/core/constant.dart';
import 'package:fluttercovid19/pages/intro_page.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Covid 19',
        theme: ThemeData(
          primaryColor: Colors.blue,
          fontFamily: 'Ubuntu',
        ),
        home: IntroPage(),
      ),
    );


