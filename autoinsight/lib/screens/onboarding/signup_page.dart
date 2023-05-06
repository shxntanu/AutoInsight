import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../onboarding/components/signin_textfield.dart';

import '../onboarding/npa_info_page.dart';

class SignUpPage extends StatelessWidget {

  final _ctr1 = TextEditingController();
  final _ctr2 = TextEditingController();
  final _ctrConfirm = TextEditingController();

  final storage = FirebaseStorage.instance;
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
          body: SingleChildScrollView(
            child: Padding(
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
                          'Sign Up',
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
                                hintText: 'enter email',
                                textType: TextInputType.emailAddress,
                                obscureText: false,
                              )),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: SignIn_TextField(
                              controller: _ctr2,
                              icon: Icons.key,
                              hintText: 'enter password',
                              textType: TextInputType.visiblePassword,
                              obscureText: true,
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: SignIn_TextField(
                                controller: _ctrConfirm,
                                icon: Icons.key,
                                hintText: 'confirm password',
                                textType: TextInputType.visiblePassword,
                                obscureText: true,
                              ))
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
                        late final user;
                        if(_ctr2.text == _ctrConfirm.text){
                          user = _auth.createUserWithEmailAndPassword(
                            email: _ctr1.text,
                            password: _ctr2.text
                          );
                        }
          
                        if(user != null) {
                          // final path = 'users/${_ctr1.text}/profile.png';
                          // Reference ref = storage.ref().child(path);
                          
                          final SharedPreferences prefs = await SharedPreferences.getInstance();
          
                          prefs.setString('email', _ctr1.text);
                          prefs.setString('password', _ctr2.text);
                          prefs.setBool('logged_in', true);
                        }
          
                        Get.to(npaInfoPage());
                      }, 
                      child: const Text(
                        "Next",
                      ),
                    ),
                  ]),
            ),
          )),
    );
  }
}

// FF7171
// FA6E00
// FFB342