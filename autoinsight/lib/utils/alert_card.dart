import 'package:flutter/material.dart';
import '../utils/colors.dart';

class AlertCard extends StatelessWidget {
  
  const AlertCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final IconData icon;
  final String title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        child: Material(
          child: InkWell(
            splashColor: accentOrange.withOpacity(0.7),
            onTap: (){
              print('Tapped!');
            },
            child: SizedBox(
              height: 100,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 1,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        icon,
                        color: accentOrange,
                        size: 50,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          subtitle,
                          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: accentOrange,
                      size: 50,
                    ),
                  ),
                ],
              )
            ),
          ),
        ),
      ),
    );
  }
}