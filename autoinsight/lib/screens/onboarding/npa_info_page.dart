import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../onboarding/components/signin_textfield.dart';

import '../onboarding/car_info_page.dart';

class npaInfoPage extends StatelessWidget {

  final _name = TextEditingController();
  final _phone = TextEditingController();
  final _address = TextEditingController();

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
                              controller: _name,
                              icon: Icons.email,
                              hintText: 'Name',
                              textType: TextInputType.name,
                              obscureText: false,
                            )),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SignIn_TextField(
                            controller: _phone,
                            icon: Icons.key,
                            hintText: 'Phone Number',
                            textType: TextInputType.phone,
                            obscureText: true,
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: SignIn_TextField(
                              controller: _address,
                              icon: Icons.key,
                              hintText: 'Address',
                              textType: TextInputType.streetAddress,
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
                        
                        final SharedPreferences prefs = await SharedPreferences.getInstance();

                        prefs.setString('name', _name.text);
                        prefs.setString('phone', _phone.text);
                        prefs.setString('address', _address.text);

                        Get.offAll(carInfoPage());
                      
                    }, 
                    child: const Text(
                      "Next",
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