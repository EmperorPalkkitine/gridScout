import 'package:flutter/material.dart';

class SendDataPage extends StatefulWidget {
  const SendDataPage({super.key});

  @override
  State<SendDataPage> createState() => _SendDataPageState();
}

class _SendDataPageState extends State<SendDataPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: 
      Text('data sent successfully'),
    );
  }
}