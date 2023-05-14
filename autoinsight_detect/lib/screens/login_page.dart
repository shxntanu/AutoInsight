import 'package:flutter/material.dart';

import '../screens/login_page/widgets/sign_in.dart';
import '../screens/login_page/widgets/sign_up.dart';
import '../utils/theme.dart';
import '../../../utils/bubble_indicator_painter.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {

  late PageController _pageController;

  Color left = Colors.black;
  Color right = Colors.white;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 75.0),
                child: Image(
                  height:
                      MediaQuery.of(context).size.height > 800 ? 191.0 : 150,
                  fit: BoxFit.fill,
                  image: const AssetImage('images/autoinsight (logo).png')
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: _buildMenuBar(context),
              ),
              Expanded(
                flex: 2,
                child: PageView(
                  controller: _pageController,
                  physics: const ClampingScrollPhysics(),
                  onPageChanged: (int i) {
                    FocusScope.of(context).requestFocus(FocusNode());
                    if (i == 0) {
                      setState(() {
                        right = Colors.white;
                        left = Colors.black;
                      });
                    } else if (i == 1) {
                      setState(() {
                        right = Colors.black;
                        left = Colors.white;
                      });
                    }
                  },
                  children: <Widget>[
                    ConstrainedBox(
                      constraints: const BoxConstraints.expand(),
                      child: SignIn(),
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints.expand(),
                      child: SignUp(),
                    ),
                    
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Widget _buildMenuBar(BuildContext context) {
    return Container(
      width: 300.0,
      height: 50.0,
      decoration: const BoxDecoration(
        color: Color(0x552B2B2B),
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      child: CustomPaint(
        painter: BubbleIndicatorPainter(pageController: _pageController),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: _onSignInButtonPress,
                child: Text(
                  'Sign In',
                  style: TextStyle(
                      color: left,
                      fontSize: 16.0,
                  ),
                ),
              ),
            ),
            //Container(height: 33.0, width: 1.0, color: Colors.white),
            Expanded(
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: _onSignUpButtonPress,
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                      color: right,
                      fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onSignInButtonPress() {
    _pageController.animateToPage(0,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onSignUpButtonPress() {
    _pageController.animateToPage(1,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }
}