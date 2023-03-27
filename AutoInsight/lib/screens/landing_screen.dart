// ignore_for_file: prefer_const_constructors


import 'package:flutter/material.dart';
import 'package:autoinsight/constants.dart';
import 'login_screen.dart';
import 'package:autoinsight/screens/registration_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> with SingleTickerProviderStateMixin {
  
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {

    future: Firebase.initializeApp();
    
    controller = AnimationController(
      duration: Duration(seconds: 4),
      vsync: this,
    );

    animation = CurvedAnimation(parent: controller, curve: Curves.elasticOut);

    controller.forward();

    controller.addListener(() {
      setState(() {
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: darkTeal,
      body: Stack(
        children: [
          OverflowBox(
            maxWidth: width*2,
            maxHeight: height*2,
            child: Container(
              width: animation.value*650,
              height: animation.value*650,
              decoration: const BoxDecoration(
                color: lightTeal,
                shape: BoxShape.circle,
              ),
              ),
          ),
          OverflowBox(
            maxWidth: width*1.5,
            maxHeight: height*1.5,
            child: Container(
              width: animation.value*500,
              height: animation.value*500,
              decoration: const BoxDecoration(
                color: offGrey,
                shape: BoxShape.circle,
              ),
              ),
          ),
          Container(
        alignment: Alignment.center,
        margin: EdgeInsets.fromLTRB(20, 80, 20, 60),
        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('AutoInsight',
            style: TextStyle(
              color: darkTeal,
              fontSize: 45,
              fontWeight: FontWeight.bold,

            ),),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: (){
              Navigator.push(
                context, 
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) => LoginScreen(),
                  transitionDuration: Duration.zero,
                  reverseTransitionDuration: Duration.zero,
                  ));
            },
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white,
                    fontSize: 20),
                  ),
                ),
            style:ElevatedButton.styleFrom(
              primary: lightTeal,
            ),),
            SizedBox(
              height: 13,
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(
                context, 
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) => RegistrationScreen(),
                  transitionDuration: Duration.zero,
                  reverseTransitionDuration: Duration.zero,
                  ));
            }, 
                child:Padding(
                  padding: EdgeInsets.all(10),
                  child: Text('Sign Up',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                  )),
                  ),
            style: ElevatedButton.styleFrom(
              primary: lightTeal,
            ),)
          ],
        ),
      )
        ]
      )
    );
  }
}
