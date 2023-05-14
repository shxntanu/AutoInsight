import 'package:autoinsight_detect/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../screens/login_page/widgets/signin_textfield.dart';
import '../utils/snackbar.dart';
import 'package:autoinsight_detect/screens/home/car_screen.dart';
import '../controllers/user_controller.dart';
import '../controllers/backend_controller.dart';

final _userCtr = Get.put(userController());
final _backendCtr = Get.put(backendController());

class LoginPage extends StatefulWidget {

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _ctr1 = TextEditingController();

  final _ctr2 = TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Color.fromARGB(255, 240, 87, 87),
            Color.fromARGB(255, 252, 125, 108),
            Color.fromARGB(255, 248, 154, 114),
            Color.fromARGB(255, 246, 187, 169),
            Color.fromARGB(255, 239, 220, 220)
          ])),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            foregroundColor: const Color(0xFF03045E),
          ),
          backgroundColor: const Color(0x00000000),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(50.0),
                    child: Card(
                      margin: EdgeInsets.only(top: 20, right: 30, left: 30),
                      color: Colors.white,
                      child: Text(
                        'Log in',
                        style: TextStyle(
                            color: Color(0xFF03045E),
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: SignIn_TextField(
                              controller: _ctr1,
                              icon: Icons.email,
                              hintText: 'Enter email',
                              textType: TextInputType.emailAddress,
                              obscureText: false,
                            )),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SignIn_TextField(
                            controller: _ctr2,
                            icon: Icons.key,
                            hintText: 'Enter password',
                            textType: TextInputType.visiblePassword,
                            obscureText: true,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, 
                      backgroundColor: const Color.fromARGB(255, 240, 87, 87),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                    onPressed: () async {
                        
                        try {
                          final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: _ctr1.text,
                            password: _ctr2.text
                          );
                          if (credential.user != null) {
                            await _backendCtr.login(_ctr1.text, _ctr2.text);
                            Get.offAll(CarScreen());
                          }
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            showSnackbar(context, 'No user found for that email.');
                          } else if (e.code == 'wrong-password') {
                            showSnackbar(context, 'Wrong password provided for that user.');
                          }
                        } 
                    }, 
                    child: const Text(
                      "Sign Up",
                    ),
                  ),
                ]),
          )),
    );
  }
}

// FF7171
// FA6E00
// FFB342