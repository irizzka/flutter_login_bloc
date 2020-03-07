import 'package:flutter/material.dart';
import 'package:flutter_login_bloc/src/screens/login_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'log me',
      home: Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}
