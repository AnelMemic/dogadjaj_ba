import 'package:flutter/material.dart';

class InitScreen extends StatelessWidget {
    static const String routeName = '/init_screen';
  const InitScreen({Key? key}) : super(key: key);  // Ensure this constructor is here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Init Screen'), backgroundColor: Colors.blue),
      body: const Center(
        child: Text(
          'Welcome to the Init Screen!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
