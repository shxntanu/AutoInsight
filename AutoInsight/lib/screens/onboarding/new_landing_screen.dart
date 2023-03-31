import 'package:flutter/material.dart';

class NewLandingScreen extends StatefulWidget {
  @override
  _NewLandingScreenState createState() => _NewLandingScreenState();
}

class _NewLandingScreenState extends State<NewLandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('AutoInsight',
              style: TextStyle(
                fontSize: 50,
                fontWeight:FontWeight.bold,
              color: Color(0xFFFF6D6D),
              ),),
              ElevatedButton(onPressed: (){
                
              },
                child: Text('Login'),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFFF6D6D),
  
                ),
              ),
              ElevatedButton(onPressed: (){},
                child: Text('Sign In'),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFFF6D6D),
                ),
              ),
          ],
        ),
      ),),
    );
  }
}