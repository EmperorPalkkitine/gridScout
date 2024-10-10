import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grid_scout/components/home_page_button.dart';
import 'package:grid_scout/pages/new_data_entry_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
 HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  // document IDs
  List<String> docIDs = [];

  //get docIds
  Future getDocId() async {
    await FirebaseFirestore.instance.collection('users').get().then(
      (snapshot) => snapshot.docs.forEach((document) {
        print(document.reference);
        docIDs.add(document.reference.id);
      },
      ),
      );
  }

  //@override
  //void initState() {
   //getDocId();
    //super.initState();
  //}

  //sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  //gather user ID method
  void sendUserID() async {
    final userEmail =user.email!; //User email from Firebase Auth

    //Define the API endpoint
    final url = Uri.parse(
      'http://10.130.1.143:5000/send-data'
      );

    //Create the request body
    final body = jsonEncode({'email': userEmail});

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

  void changePage(BuildContext context, Widget destinationPage) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => destinationPage,
    ),
  );
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
      
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
            children: [
              SizedBox(height: 300,),

            //Data entry button
            HomePageButton(
              onTap: (context) => changePage(context, NewDataEntryPage()),
              buttonText: 'Data Entry',
              ),
            ],
        ),
        ),
    );
  }
}