import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../../../utils/theme.dart';
import '../../../../utils/snackbar.dart';
import '../../../dashboard/homescreen.dart';

import '../../../../controllers/backend_controller.dart';

final storage = FirebaseStorage.instance;
final auth = FirebaseAuth.instance;

final _backendCtr = Get.put(backendController());

class CarInfo extends StatefulWidget {

  @override
  _CarInfoState createState() => _CarInfoState();
}

class _CarInfoState extends State<CarInfo> {
  final FocusNode focusNodeLicencePlate = FocusNode();
  final FocusNode focusNodeCarYear = FocusNode();
  final FocusNode focusNodeCarName = FocusNode();

  bool _obscureTextPassword = true;
  bool _obscureTextConfirmPassword = true;

  TextEditingController signupCarYearController = TextEditingController();
  TextEditingController signupCarNameController = TextEditingController();
  TextEditingController signupLicencePlateController = TextEditingController();

  @override
  void dispose() {
    focusNodeLicencePlate.dispose();
    focusNodeCarYear.dispose();
    focusNodeCarName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 23.0),
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Card(
                elevation: 2.0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: SizedBox(
                  width: 300.0,
                  height: 360.0,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                        child: TextField(
                          focusNode: focusNodeCarName,
                          controller: signupCarNameController,
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.words,
                          autocorrect: false,
                          style: const TextStyle(
                            
                              fontSize: 16.0,
                              color: Colors.black),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              FontAwesomeIcons.car,
                              color: Colors.black,
                            ),
                            hintText: 'Car Name',
                            hintStyle: TextStyle(
                                fontSize: 16.0),
                          ),
                          onSubmitted: (_) {
                            focusNodeCarYear.requestFocus();
                          },
                        ),
                      ),
                      Container(
                        width: 250.0,
                        height: 1.0,
                        color: Colors.grey[400],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                        child: TextField(
                          focusNode: focusNodeCarYear,
                          controller: signupCarYearController,
                          keyboardType: TextInputType.number,
                          autocorrect: false,
                          style: const TextStyle(
                           
                              fontSize: 16.0,
                              color: Colors.black),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              FontAwesomeIcons.calendar,
                              color: Colors.black,
                            ),
                            hintText: 'Car Year',
                            hintStyle: TextStyle(
                                fontSize: 16.0),
                          ),
                          onSubmitted: (_) {
                            focusNodeLicencePlate.requestFocus();
                          },
                        ),
                      ),
                      Container(
                        width: 250.0,
                        height: 1.0,
                        color: Colors.grey[400],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                        child: TextField(
                          focusNode: focusNodeLicencePlate,
                          controller: signupLicencePlateController,
                          keyboardType: TextInputType.text,
                          autocorrect: false,
                          style: const TextStyle(
                      
                              fontSize: 16.0,
                              color: Colors.black),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              FontAwesomeIcons.idCard,
                              color: Colors.black,
                            ),
                            hintText: 'Car Licence Plate',
                            hintStyle: TextStyle(
                                 fontSize: 16.0),
                          ),
                          onSubmitted: (_) {
                            _toggleSignUpButton();
                          },
                          textInputAction: TextInputAction.go,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 340.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: CustomTheme.loginGradientStart,
                      offset: Offset(1.0, 6.0),
                      blurRadius: 20.0,
                    ),
                    BoxShadow(
                      color: CustomTheme.loginGradientEnd,
                      offset: Offset(1.0, 6.0),
                      blurRadius: 20.0,
                    ),
                  ],
                  gradient: LinearGradient(
                      colors: <Color>[
                        CustomTheme.loginGradientEnd,
                        CustomTheme.loginGradientStart
                      ],
                      begin: FractionalOffset(0.2, 0.2),
                      end: FractionalOffset(1.0, 1.0),
                      stops: <double>[0.0, 1.0],
                      tileMode: TileMode.clamp),
                ),
                child: MaterialButton(
                  highlightColor: Colors.transparent,
                  splashColor: CustomTheme.loginGradientEnd,
                  //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 42.0),
                    child: Text(
                      'SIGN UP',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                  onPressed: () => _toggleSignUpButton(),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  void _toggleSignUpButton() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
          
    prefs.setString('carName', signupCarNameController.text);
    prefs.setString('carYear', signupCarYearController.text);
    prefs.setString('licencePlate', signupLicencePlateController.text);
  
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

    final user = auth.createUserWithEmailAndPassword(email: prefs.getString("email") ?? "null", password: prefs.getString("password") ?? "null");

    Get.offAll(HomeScreen());
  }
}