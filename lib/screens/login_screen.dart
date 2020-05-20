import 'package:flash_chat/constants.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/components/oval_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chat_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static String id  = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  bool _loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: _loading,
        opacity: 0.5,
        progressIndicator: CircularProgressIndicator(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                    email = value;
                },
                decoration: kEmailInputDecoration
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
                decoration: kPasswordInputDecoration,
              ),
              SizedBox(
                height: 24.0,
              ),
              OvalButton(labelText: 'Login',buttonColor: Colors.lightBlueAccent,onPressed: ()async{
                setState(() {
                  _loading = true;
                });
                try{
                  final user = await _auth.signInWithEmailAndPassword(email: email, password: password);

                  if(user != null){
                    setState(() {
                      _loading = false;
                    });
                    Navigator.pushNamed(context, ChatScreen.id);
                  }
                }catch(e){
                  print(e);
                  setState(() {
                    _loading = false;
                  });
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
