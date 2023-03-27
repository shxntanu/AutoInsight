// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:autoinsight/screens/landing_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:autoinsight/constants.dart';
import 'login_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {

  bool showSpinner = false;
  late AnimationController controller;
  late Animation animation;
  final _auth = FirebaseAuth.instance;

  late String email = "", password = "";

  @override
  void initState() {
    
    controller = AnimationController(
      duration: Duration(seconds: 4),
      vsync: this,
    );

    animation = CurvedAnimation(parent: controller, curve: Curves.ease);

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
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        backgroundColor: darkTeal,
        body: Stack(
          children: [
            OverflowBox(
              maxWidth: width*4,
              maxHeight: height*4,
              child: Container(
                width: animation.value*650+650,
                height: animation.value*650+650,
                decoration: const BoxDecoration(
                  color: lightTeal,
                  shape: BoxShape.circle,
                ),
                ),
            ),
            OverflowBox(
              maxWidth: width*4,
              maxHeight: height*4,
              child: Container(
                width: animation.value*500+500,
                height: animation.value*500+500,
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
              Container(
                width: 300,
                child: TextField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: darkTeal,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 3,
                              color: darkTeal,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          hintText: "Enter email",
                        ),
                        onChanged: (newValue) {
                          email = newValue;
                        },
                ),
              ),
              SizedBox(
                height: 13,
              ),
              Container(
                width: 300,
                child: TextField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: darkTeal,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 3,
                              color: darkTeal,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          hintText: "Enter password",
                        ),
                        onChanged: (newValue) {
                          password = newValue;
                        },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(onPressed: () async {
                setState(() {
                  showSpinner = true;
                });
                try {
                    final user = await _auth.signInWithEmailAndPassword(
                    email: email, password: password,
                  );
                  if (user != null) {
                            Navigator.pushNamed(context, '/home');
                  }
                  setState(() {
                    showSpinner = false;
                  });
                }
                catch(e) {
                  print(e);
                  print("Kahi tari gandlay");
                }
              }, 
              child:Padding(
                padding: EdgeInsets.all(10),
                child: Text('Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
                )),
                ),
              style: ElevatedButton.styleFrom(
                primary: lightTeal,
              ),),
              SizedBox(
                height: 25,
              ),
              FloatingActionButton(
                backgroundColor: lightTeal,
                focusColor: lightTeal,
                hoverColor: darkTeal,
                splashColor: darkTeal,
                onPressed: (){
                  Navigator.push(
                  context, 
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => LandingScreen(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                    ));
                },
              child: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
                ),
              ),
            ],
          ),
        )
          ]
        )
      ),
    );
  }
}
