import 'package:autoinsight/screens/dashboard/components/new_trip.dart';
import 'package:autoinsight/screens/dashboard/previoustrip.dart';
import 'package:autoinsight/screens/navigationbarScreens/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:autoinsight/main.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:circle_bottom_navigation_bar/circle_bottom_navigation_bar.dart';
import 'package:circle_bottom_navigation_bar/widgets/tab_data.dart';

class FinalHomeScreen extends StatefulWidget {
  @override
  _FinalHomeScreenState createState() => _FinalHomeScreenState();
}

class _FinalHomeScreenState extends State<FinalHomeScreen> {
  int _index = 0;
  int currentPage = 0;

  List<PreviousTrip> trips = [
    PreviousTrip(
      start: 'pune',
      end: 'nagar',
      distance: '30',
    ),
    PreviousTrip(
      start: 'katraj',
      end: 'fc road',
      distance: '45',
    ),
    PreviousTrip(
      start: 'mumbai',
      end: 'pune',
      distance: '100',
    )
  ];

  @override
  Widget build(BuildContext context) {
    List<TabData> getTabsData() {
      return [
        TabData(
            icon: Icons.person,
            iconSize: 25.0,
            title: 'Profile',
            fontSize: 12,
            fontWeight: FontWeight.bold,
            onClick: () {
              Navigator.pushNamed(context, '/profile');
            }),
        TabData(
            icon: Icons.map_sharp,
            iconSize: 25,
            title: 'Area Feed',
            fontSize: 12,
            fontWeight: FontWeight.bold,
            onClick: () {
              //TODO: navigate to feed page/blindspot animation page
            }),
        TabData(
          icon: Icons.history_edu,
          iconSize: 25,
          title: 'History',
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        TabData(
          icon: Icons.settings,
          iconSize: 25,
          title: 'Settings',
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ];
    }

    final size = MediaQuery.of(context).size;
    final viewPadding = MediaQuery.of(context).viewPadding;
    double barHeight;
    double barHeightWithNotch = 67;
    double arcHeightWithNotch = 67;

    if (size.height > 700) {
      barHeight = 70;
    } else {
      barHeight = size.height * 0.1;
    }

    if (viewPadding.bottom > 0) {
      barHeightWithNotch = (size.height * 0.07) + viewPadding.bottom;
      arcHeightWithNotch = (size.height * 0.075) + viewPadding.bottom;
    }
    return Expanded(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) => New_trip((start, end, distance) {}));
          },
          backgroundColor: Colors.blueGrey.shade900,
          child: Icon(Icons.add),
        ),
        body: Column(children: <Widget>[
          SizedBox(
            height: 35,
          ),
          Row(children: <Widget>[
            SizedBox(
              width: 10,
            ),
            CircleAvatar(
              radius: 20,
              // backgroundImage: AssetImage(//insert image here
              // ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Welcome Back!',
              style: TextStyle(
                  color: Color(0xFF03045E),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 50,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  'current location',
                  style: TextStyle(color: Color(0xFFFFFFFF)),
                ),
              ),
              color: Colors.grey,
            ),
          ]),
          Container(
              child: Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Card(
                color: Color.fromARGB(67, 174, 175, 247),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Previous Trips',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 200,
            ),
          ])),
          Expanded(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0))),
                child: ListView(
                  children: trips,
                )),
          )
        ]),
        bottomNavigationBar: CircleBottomNavigationBar(
          initialSelection: currentPage,
          barHeight: viewPadding.bottom > 0 ? barHeightWithNotch : barHeight,
          arcHeight: viewPadding.bottom > 0 ? arcHeightWithNotch : barHeight,
          itemTextOff: viewPadding.bottom > 0 ? 0 : 1,
          itemTextOn: viewPadding.bottom > 0 ? 0 : 1,
          circleOutline: 15.0,
          shadowAllowance: 0.0,
          circleSize: 50.0,
          blurShadowRadius: 50.0,
          circleColor: Color(0xFFFF6D6D),
          activeIconColor: Color(0xFF03045E),
          inactiveIconColor: Colors.grey,
          tabs: getTabsData(),
          onTabChangedListener: (index) => setState(() => currentPage = index),
        ),
      ),
    );
  }
}
