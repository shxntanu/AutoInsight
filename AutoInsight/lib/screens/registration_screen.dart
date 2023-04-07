// ignore_for_file: prefer_const_constructors

// Circular Design Registration Screen

import 'package:autoinsight/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'animated_landing_screen.dart';
import 'package:autoinsight/screens/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:autoinsight/constants.dart';
import 'login_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> with TickerProviderStateMixin {

  late AnimationController pageAnimationController;
  late AnimationController transitionAnimationController;
  late Animation pageAnimation;
  late Animation transitionAnimation;

  final _auth = FirebaseAuth.instance;

  bool showSpinner = false;
  String email = "", password = "";

  @override
  void initState() {
    
    future: Firebase.initializeApp();

    pageAnimationController = AnimationController(
      duration: Duration(seconds: 4),
      vsync: this,
    );

    transitionAnimationController = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );

    pageAnimation = CurvedAnimation(parent: pageAnimationController, curve: Curves.ease);
    transitionAnimation = CurvedAnimation(parent: transitionAnimationController, curve: Curves.ease);

    pageAnimationController.forward();

    pageAnimationController.addListener(() {
      setState(() {
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    pageAnimationController.dispose();
    transitionAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    bool pressFlag = false;

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
                width: pageAnimation.value*650+650,
                height: pageAnimation.value*650+650,
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
                width: pageAnimation.value*500+500,
                height: pageAnimation.value*500+500,
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
                          hintText: "Email",
                        ),
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
                          hintText: "Password",
                        ),
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
                        final newUser = await _auth.createUserWithEmailAndPassword(
                            email: email, password: password);
                        if(newUser != null)
                          {
                            transitionAnimationController.reset();
                            transitionAnimationController.forward();
              
                            Future.delayed(Duration(seconds: 3), (){
                                  Navigator.push(
                                  context, 
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation, secondaryAnimation) => HomeScreen(),
                                    transitionDuration: Duration.zero,
                                    reverseTransitionDuration: Duration.zero,
                                  ));
                            });
                          }

                        setState(() {
                          showSpinner = false;
                        });
                      }
                      catch (e) {
                        print("Kahitari Gandlay, chukicha input");
                      }
    
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
        ),
        OverflowBox(
              maxWidth: width*4,
              maxHeight: height*4,
              child: Container(
                width: transitionAnimation.value*500,
                height: transitionAnimation.value*500,
                decoration: const BoxDecoration(
                  color: offGrey,
                  shape: BoxShape.circle,
                ),
                ),
            ),
          ]
        )
      ),
    );
  }
}
