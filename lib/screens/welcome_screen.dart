import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/components/oval_button.dart';

class WelcomeScreen extends StatefulWidget {
  static String id  = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {

  AnimationController controller;
  Animation animation;
  Animation backgroundAnimation;
  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(
        seconds: 2,
      ),
      vsync: this,
      upperBound: 1.0,
//      lowerBound: 0.7
    );
    animation = CurvedAnimation(
        parent: controller, curve: Curves.decelerate,
    );
   backgroundAnimation = ColorTween(begin: Colors.red, end: Colors.blue).animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundAnimation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: animation.value*100,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: ['Flash Chat'],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                  speed: Duration(
                    milliseconds: 400
                  ),
                  totalRepeatCount: 5,
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            OvalButton(labelText: 'Login',buttonColor: Colors.lightBlueAccent,onPressed: (){
              Navigator.pushNamed(context, LoginScreen.id);
            }),
            OvalButton(labelText: 'Register',buttonColor: Colors.blueAccent,onPressed: (){
              Navigator.pushNamed(context, RegistrationScreen.id);
            },)
          ],
        ),
      ),
    );
  }
}


