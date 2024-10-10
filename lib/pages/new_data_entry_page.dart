import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grid_scout/components/new_data_textfields.dart';
import 'package:grid_scout/components/send_data_button.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewDataEntryPage extends StatefulWidget {
  const NewDataEntryPage({super.key});

  @override
  State<NewDataEntryPage> createState() => _NewDataEntryPageState();
}

class _NewDataEntryPageState extends State<NewDataEntryPage> {
  //text editing controllers
  final stringController = TextEditingController();
  final intController = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final datetimeController = TextEditingController();

  //sendData method
  void sendData() async {

    //Define the API endpoint
    final url = Uri.parse(
      'http://10.130.1.143:5000/send-data'
      );

    //Create the request body
    final body = jsonEncode({'email': ()});

    //send the POST request
    try {
      final response = await http.post(
        url, 
        headers: {'Content-Type': 'application/json'},
        body: body,
      );

      if (response.statusCode == 200) {
        print('Data sent successfully!');
      } else {
        print('Failed to send data. Error: ${response.body}');
      }
    } catch (e) {
      print('Error occured: $e');
    }
  }
  
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
          backgroundColor: Color.fromRGBO(140, 29, 64, 1.0),
          title: Image.asset('assets/images/banner_logo_maroon.png', 
          fit: BoxFit.contain,
          height: 40,
          ),
          actions: [
          IconButton(
            onPressed: signUserOut, 
            icon: Icon(
              Icons.logout, 
              color: Colors.white,
              ),
            ),
            ],
            ),
      
      body: SafeArea(
        child: Center(
           child: SingleChildScrollView(
             child: Column(
                children: [
                 SizedBox(height: 50),

                //string data field
                NewDataTextfields(
                  controller: stringController,
                  hintText: 'string',
                  obscureText: false,
                ),
                const SizedBox(height: 30),

                //int data field
                NewDataTextfields(
                  controller: intController,
                  hintText: 'int',
                  obscureText: false,
                ),
                const SizedBox(height: 30),

                //date data field
                NewDataTextfields(
                  controller: dateController,
                  hintText: 'date, MM/DD/YYYY',
                  obscureText: false,
                ),
                const SizedBox(height: 30),

                //time data field
                NewDataTextfields(
                  controller: timeController,
                  hintText: 'time, eg. 12:15:00',
                  obscureText: false,
                ),
                const SizedBox(height: 30),

                //datetime data field
                NewDataTextfields(
                  controller: datetimeController,
                  hintText: 'datetime, MM-DD-YYYY 00:00:00 ',
                  obscureText: false,
                ),
                const SizedBox(height: 30),

                //send data button
                SendDataButton(
                  onTap: sendData,
                ),
          ],
         ),
        ),
       ),
     ),
   );
  }
}