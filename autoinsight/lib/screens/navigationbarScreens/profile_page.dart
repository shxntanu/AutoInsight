import 'package:flutter/material.dart';

class Profile_Page extends StatelessWidget {
  
  Profile_Page({required this.name, required this.carname, required this.year, required this.licenseplatenumber});

  final String name, carname, year, licenseplatenumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'User Profile',
          style: TextStyle(color: Color(0xFFFFFFFF)),
        ),
        backgroundColor: const Color(0xFFFF6D6D),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Card(
              child: Text(
                name,
                style: const TextStyle(fontSize: 35, color: Color(0xFF03045E)),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Card(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        carname,
                        style: kstyle,
                      ),
                      Text(
                        year,
                        style: kstyle,
                      ),
                      Text(
                       licenseplatenumber,
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