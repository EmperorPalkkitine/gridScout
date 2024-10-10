import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grid_scout/components/login_button.dart';
import 'package:grid_scout/components/login_textfields.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
 State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controlllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  //sign in method
  void signUserIn() async {
   
    //show loading circle
    showDialog(
     context: context, 
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
          );
      },
      );

    //try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text, 
        password: passwordController.text,
      );
      //pop the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //pop the loading circle
      Navigator.pop(context);
      print(e.code);
      //Wrong Email or password
      if (e.code == 'invalid-credential') {
        //show error to user
        invalidCredentialMessage();
      }
    } 
  } 
      
      //error popup
      void invalidCredentialMessage() {
        showDialog(
          context: context, 
          builder: (context) {
            return const AlertDialog(
              title: Text('Incorrect email or password'),
            );
         },
      );
    }
  

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(140, 29, 64, 1.0),
      body: SafeArea(
        child: Center(
           child: SingleChildScrollView(
             child: Column(
                children: [
                 SizedBox(height: 100),
                  //logo
              
                CircleAvatar(
                  child: ClipOval(
                    child: Image.asset(
                    'assets/images/logo_white.png',
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                    ),
                ),
                radius: 100,
                ),
              
                //email textfield
                const SizedBox(height: 30),
             
                LoginTextfield(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                //password textfield
                const SizedBox(height: 30),
             
                LoginTextfield(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                
                const SizedBox(height: 30),
             
                //login button
             
                LoginButton(
                  onTap: signUserIn,
                ),
             
                const SizedBox(height: 10),
                //forgot password?
                    Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.blue[200]),
                    ),
                     
              ],
                       ),
           ),
        ),
      ),
    );
  }
}