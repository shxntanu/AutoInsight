import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import '../onboarding/components/signin_textfield.dart';

class SignInPage extends StatelessWidget {

  final _ctr1 = TextEditingController();
  final _ctr2 = TextEditingController();
  final _ctrConfirm = TextEditingController();

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
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(50.0),
                    child: Card(
                      margin: EdgeInsets.only(top: 20, right: 30, left: 30),
                      color: Colors.white,
                      child: Text(
                        'Sign In',
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
                  )
                ]),
          )),
    );
  }
}

// FF7171
// FA6E00
// FFB342