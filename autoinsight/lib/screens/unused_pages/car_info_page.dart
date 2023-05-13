import 'package:autoinsight/screens/dashboard/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controllers/backend_controller.dart';
import 'components/signin_textfield.dart';

final _backendCtr = Get.put(backendController());

class carInfoPage extends StatelessWidget {

  final _name = TextEditingController();
  final _year = TextEditingController();
  final _licencePlate = TextEditingController();

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
          ]
        ),
      ),
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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Padding(
                  padding: EdgeInsets.all(50.0),
                  child: Card(
                    margin: EdgeInsets.only(top: 20, right: 30, left: 30),
                    color: Colors.white,
                    child: Text(
                      'Car Info',
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
                            hintText: 'Car Name',
                            textType: TextInputType.name,
                            obscureText: false,
                          )),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SignIn_TextField(
                          controller: _year,
                          icon: Icons.key,
                          hintText: 'Licence Plate',
                          textType: TextInputType.phone,
                          obscureText: false,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SignIn_TextField(
                          controller: _licencePlate,
                          icon: Icons.key,
                          hintText: 'Car Year',
                          textType: TextInputType.streetAddress,
                          obscureText: false,
                        )
                      )
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
          
                    prefs.setString('carName', _name.text);
                    prefs.setString('carYear', _year.text);
                    prefs.setString('licencePlate', _licencePlate.text);
                  
                    _backendCtr.createUser(
                      prefs.getString("email") ?? "null", 
                      prefs.getString("password") ?? "null", 
                      prefs.getString("name") ?? "null", 
                      prefs.getString("phone") ?? "null", 
                      prefs.getString("address") ?? "null",  
                      prefs.getString("carName") ?? "null", 
                      prefs.getString("carYear") ?? "null",
                      prefs.getString("licencePlate") ?? "null",
                    );
          
                    final user = _auth.createUserWithEmailAndPassword(email: prefs.getString("email") ?? "null", password: prefs.getString("password") ?? "null");
          
                    Get.offAll(HomeScreen());
                  }, 
                  child: const Text(
                    "Sign Up",
                  ),
                ),
              ]
            ),
                  ),
          )
      ),
    );
  }
}

// FF7171
// FA6E00
// FFB342