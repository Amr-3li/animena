// ignore_for_file: use_build_context_synchronously

import 'package:animena/bloc/cubit/auth/auth_cubit.dart';
import 'package:animena/views/pages/app_pages/bottom_navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  FirebaseAuth instance = FirebaseAuth.instance;
  String name = "", email = "", password = "", phone = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 8, 31, 8),
      body: BlocProvider(
        create: (context) => AuthCubit(),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is RegisterSuccess) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const BottomNavigator()),
              );
            } else if (state is RegisterError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                ),
              );
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: Image.asset(
                      "assets/Images/signUp.png",
                      filterQuality: FilterQuality.low,
                      width: 200,
                      height: 200,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Center(
                      child: Text(
                    "welcome to the SignUp",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 35),
                  )),
                  const SizedBox(
                    height: 30,
                  ),
                  textInputRegister(
                    name: name,
                    text: "Name",
                  ),
                  textInputRegister(
                    name: email,
                    text: "Email",
                  ),
                  textInputRegister(
                    name: password,
                    text: "Password",
                    obscureText: true,
                  ),
                  textInputRegister(
                    name: phone,
                    text: "Phone",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  state is RegisterLoading
                      ? const Center(child: CircularProgressIndicator())
                      : buttonRegister(context),
                  const SizedBox(
                    height: 100,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Center buttonRegister(BuildContext context) {
    return Center(
      child: ElevatedButton(
          clipBehavior: Clip.antiAlias,
          style: ButtonStyle(
              fixedSize: WidgetStateProperty.all(const Size(350, 60))),
          onPressed: () async {
            try {
              // await PaymentManager.makePayment(200, "EGP");
              await BlocProvider.of<AuthCubit>(context)
                  .signup(name, email, password, phone);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("correct sign Up"),
                ),
              );
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(e.toString()),
                ),
              );
            }
          },
          child: const Row(
            children: [
              Text(
                "Rigester",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
              ),
              Spacer(
                flex: 1,
              ),
              Text(
                "200 LE",
                style: TextStyle(color: Colors.red, fontSize: 20),
              ),
            ],
          )),
    );
  }

  Padding textInputRegister(
      {required String text, required String name, bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextFormField(
        obscureText: obscureText,
        onChanged: (value) {
          name = value;
        },
        cursorColor: Colors.white,
        style: const TextStyle(color: Colors.white, fontSize: 20),
        decoration: InputDecoration(
          labelText: text,
          labelStyle: const TextStyle(color: Colors.white),
          border: InputBorder.none,
          alignLabelWithHint: true,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          hintStyle: const TextStyle(color: Colors.white),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
