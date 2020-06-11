import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttercovid19/core/constant.dart';
import 'package:fluttercovid19/core/flutter_icons.dart';
import 'package:pie_chart/pie_chart.dart';

class StaticPage extends StatefulWidget {
  @override
  _StaticPageState createState() => _StaticPageState();
}

class _StaticPageState extends State<StaticPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Header_View(),
          ],
        ),
      ),
    );
  }
}

//header view
class Header_View extends StatelessWidget {
  const Header_View({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Map<String, double> dataMapStatistics = new Map();
    dataMapStatistics.putIfAbsent("Confirmed", () => 6.5);
    dataMapStatistics.putIfAbsent("Deaths", () => 1);
    dataMapStatistics.putIfAbsent("Recovered", () => 2.5);

    List<Color> listColor = [Colors.blue, Colors.red, Colors.yellow];

    return Stack(
      children: <Widget>[
        //widget view
        Container(
          height: 250,
          decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              )),
          padding: EdgeInsets.only(top: 25),
          //image virus2 is background,
          child: Image.asset('assets/images/virus2.png'),
        ),



        Container(
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
                height: 10,
              ),

              //text Statitics
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //text COVID 19
                  Text(
                    'Statistics'.toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              //donut chart statitics
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0.25, 0.25),
                        spreadRadius: 0.1,
                        blurRadius: 0.25),
                  ],
                ),

                //row donut chart
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    //donut chart
                    Expanded(
                      child: Container(
                        width: 150,
                        height: 150,
                        child: PieChart(
                          dataMap: dataMapStatistics,
                          animationDuration: Duration(milliseconds: 600),
                          chartLegendSpacing: 32.0,
                          showChartValuesInPercentage: true,
                          showChartValues: false,
                          showChartValuesOutside: false,
                          chartValueBackgroundColor: Colors.grey[200],
                          colorList: listColor,
                          showLegends: false,
                          legendPosition: LegendPosition.right,
                          decimalPlaces: 1,
                          showChartValueLabel: true,
                          initialAngle: 120,
                          chartType: ChartType.ring,
                        ),
                      ),
                      flex: 1,
                    ),

                    //value statistics
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,

                            //group
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              _buildItemCount(
                                  'Confirmed', '2.329.520', Colors.blue),
                              SizedBox(
                                height: 10,
                              ),
                              _buildItemCount(
                                  'Recovered', '595.229', Colors.yellow),
                              SizedBox(
                                height: 10,
                              ),
                              _buildItemCount('Deaths', '1.607', Colors.red),
                            ],
                          ),
                        ],
                      ),
                      flex: 1,
                    ),
                  ],
                ),
              ),

              //male and female
              SizedBox(
                height: 20,
              ),

              //Case
              Row(
                children: <Widget>[
                  //case 1
                  Expanded(
                      child: _buildItemCase(FlutterIcons.male, Colors.orange,
                          'Male', 'Confirmed\nCases', '59,5%')),
                  //divider: 15
                  SizedBox(width: 15),
                  //case 2
                  Expanded(
                      child: _buildItemCase(FlutterIcons.female, colorFemale,
                          'Female', 'Confirmed\nCases', '40.5%')),
                ],
              ),

              SizedBox(
                height: 20,
              ),

              //text Globle cases of covid 19
              RichText(
                text: TextSpan(
                    text: 'Globle Cases of',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: ' Covid 19',
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ]),
              ),

              //map globle case in the world
              Padding(
                padding: const EdgeInsets.all(20),
                child: Image.asset('assets/images/map.png'),
              ),


            ],
          ),
        ),
      ],
    );
  }

  //build item case male/female
  Widget _buildItemCase(IconData icon, Color color, String title,
      String subTitle, String percent) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                offset: Offset(0.25, 0.25),
                spreadRadius: 0.1,
                blurRadius: 0.25),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //icon image
              Icon(
                icon,
                color: color,
                size: 58,
              ),

              //column text
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                //group layout
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  //text primary
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 5),

                  //text secondary
                  Text(
                    subTitle,
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          //text percent 59.5%
          Text(
            percent,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
          ),
        ],
      ),
    );
  }

  //item value statistics
  Widget _buildItemCount(
      String title, String count, MaterialColor materialColor) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Icon(
          FlutterIcons.label,
          color: materialColor,
          size: 50,
        ),
        Column(
          //set 2 text confirmed & 2.329.520 to group
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,

          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.normal,
                  fontSize: 16),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              count,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
