import 'package:flutter/material.dart';
import 'package:grid_scout/pages/auth_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

const Color primaryColor = Color.fromRGBO(140, 29, 64, 1.0);
void main() async {
  WidgetsFlutterBinding.ensureInitialized;
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
    );
  }
}