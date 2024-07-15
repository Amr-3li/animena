import 'package:animena/initialPage.dart';
import 'package:animena/stripe_payment/stripe_keys.dart';
import 'package:animena/views/pages/app_pages/bottom_navigator.dart';
import 'package:animena/views/pages/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Stripe.publishableKey=ApiKeys.punlishableKey;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Initialpage(),
    );
  }
}
