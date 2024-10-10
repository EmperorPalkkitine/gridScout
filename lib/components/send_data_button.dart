import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SendDataButton extends StatelessWidget {

  final Function()? onTap;
  final user = FirebaseAuth.instance.currentUser!;

  SendDataButton({super.key, required this.onTap,});
  //Send Data
  
  
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
            "Submit",
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