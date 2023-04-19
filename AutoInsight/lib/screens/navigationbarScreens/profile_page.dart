import 'package:flutter/material.dart';

class Profile_Page extends StatelessWidget {
  const Profile_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'User Profile',
          style: TextStyle(color: Color(0xFFFFFFFF)),
        ),
        backgroundColor: Color(0xFFFF6D6D),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Card(
              child: Text(
                'Name Name',
                style: TextStyle(fontSize: 35, color: Color(0xFF03045E)),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Card(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Car Name',
                        style: kstyle,
                      ),
                      Text(
                        'Car Model',
                        style: kstyle,
                      ),
                      Text(
                        'Year',
                        style: kstyle,
                      ),
                      Text(
                        'License plate number',
                        style: kstyle,
                      )
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}

const TextStyle kstyle = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
