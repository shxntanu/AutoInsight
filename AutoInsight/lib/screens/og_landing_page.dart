// Original Landing screen designed by Ridhima

import 'package:flutter/material.dart';

class OGEntryPage extends StatefulWidget {
  const OGEntryPage({Key? key}) : super(key: key);

  @override
  State<OGEntryPage> createState() => _OGEntryPageState();
}

class _OGEntryPageState extends State<OGEntryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade100,
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.fromLTRB(20, 80, 20, 60),
        decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('AutoInsight',
            style: TextStyle(
              color: Colors.teal.shade900,
              fontSize: 40,
              fontWeight: FontWeight.bold,

            ),),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(onPressed: (){},
            style:ElevatedButton.styleFrom(
              primary: Colors.teal,
            ),
                child: const Text(
              'Login',
              style: TextStyle(color: Colors.white),
            ),),
            ElevatedButton(onPressed: (){},
            style: ElevatedButton.styleFrom(
              primary: Colors.teal,
            ), 
                child:const Text('Sign In'),)
          ],
        ),
      ),
    );
  }
}
