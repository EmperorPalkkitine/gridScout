import 'package:flutter/material.dart';

class NewDataTextfields extends StatelessWidget {
final TextEditingController controller;
final String hintText;
final bool obscureText;

  const NewDataTextfields({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                controller: controller,
                obscureText: obscureText,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  hintText: hintText,
                  hintStyle: TextStyle(color: Colors.grey[500]),
               ),
             ),
           );
  }
}