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
      duration: const Duration(seconds: 4),
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
              // child: AssetImage(
              //   'assets/CarWheel.svg',
              // ),
            ),
            // child: CircleAvatar(
            //   radius: animation.value*400,
            //   backgroundImage: const AssetImage(
            //     'assets/CarWheel2.png'
            //   ),
            // ),
          ),
          Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.fromLTRB(20, 80, 20, 60),
        decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('AutoInsight',
            style: TextStyle(
              color: darkTeal,
              fontSize: 45,
              fontWeight: FontWeight.bold,

            ),),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: (){
              Navigator.push(
                context, 
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) => const LoginScreen(),
                  transitionDuration: Duration.zero,
                  reverseTransitionDuration: Duration.zero,
                  ));
            },
            style:ElevatedButton.styleFrom(
              backgroundColor: lightTeal,
            ),
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white,
                    fontSize: 20),
                  ),
                ),),
            const SizedBox(
              height: 13,
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(
                context, 
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) => const RegistrationScreen(),
                  transitionDuration: Duration.zero,
                  reverseTransitionDuration: Duration.zero,
                  ));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: lightTeal,
            ), 
                child:const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text('Sign Up',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                  )),
                  ),)
          ],
        ),
      )
        ]
      )
    );
  }
}
