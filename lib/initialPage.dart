// ignore_for_file: use_build_context_synchronously

import 'package:animena/features/navigation/bottom_navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/auth/presentation/views/pages/login_screen.dart';

class Initialpage extends StatefulWidget {
  const Initialpage({super.key});

  @override
  State<Initialpage> createState() => _InitialpageState();
}

class _InitialpageState extends State<Initialpage> {
  FirebaseAuth instance = FirebaseAuth.instance;
  SharedPreferences? sharedPreferences;
  @override
  void initState() {
    super.initState();
    getState();
  }

  getState() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences!.getString('email') != null) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const BottomNavigator()));
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(color: Colors.black),
      ),
    );
  }
}
