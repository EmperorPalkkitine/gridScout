import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {

  final Function()? onTap;

  const LoginButton({super.key, required this.onTap,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(25),
        margin: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 198, 39, 1.0),
          borderRadius: BorderRadius.circular(8)
          ),
        child: Center(
          child: Text(
            "Login",
            style: TextStyle(color: Color.fromRGBO(140, 29, 64, 1.0), 
            fontSize: 18, 
            fontWeight: FontWeight.bold,
            ),
            ),
            ),
      ),
    );
  }
}