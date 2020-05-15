import 'package:flutter/material.dart';

class OvalButton extends StatelessWidget {
  OvalButton({@required this.labelText,@required this.buttonColor,@required this.onPressed});

  final String labelText;
  final Function onPressed;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: buttonColor,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
              labelText,
            style: TextStyle(
              color: Colors.white,

            ),

          ),
        ),
      ),
    );
  }
}