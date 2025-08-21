import 'package:animena/core/dependcy_injection/getit.dart';
import 'package:animena/features/auth/data/repository/auth_repo.dart';
import 'package:animena/features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:animena/features/auth/presentation/views/pages/signup_screen.dart';
import 'package:animena/features/navigation/bottom_navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? _email, _password;
  bool isPass = true;

  @override
  Widget build(BuildContext context) {
    FirebaseAuth instance = FirebaseAuth.instance;

    return BlocProvider(
      create: (context) => AuthCubit(getIt<AuthRepo>()),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const BottomNavigator()));
          } else if (state is LoginError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 8, 31, 8),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: Image.asset(
                      "assets/Images/login.png",
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
                    "welcome to the login",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 35),
                  )),
                  const SizedBox(
                    height: 30,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Text(
                      "Email",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                  emailTextInput(),
                  const Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Text(
                      "password",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                  passwordTextInput(),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "forget password",
                          style: TextStyle(color: Colors.grey),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  state is LoginLoading
                      ? const Center(child: CircularProgressIndicator())
                      : loginButtom(instance, context),
                  const SizedBox(
                    height: 20,
                  ),
                  pushRegisterButton(context)
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Padding passwordTextInput() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        obscureText: isPass,
        focusNode: FocusNode(),
        onChanged: (value) {
          _password = value;
        },
        cursorColor: Colors.white,
        style: const TextStyle(color: Colors.white, fontSize: 20),
        decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isPass = !isPass;
                });
              },
              icon: const Icon(Icons.visibility)),
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

  Padding emailTextInput() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextFormField(
        onChanged: (value) {
          _email = value;
        },
        cursorColor: Colors.white,
        style: const TextStyle(color: Colors.white, fontSize: 20),
        decoration: const InputDecoration(
          border: InputBorder.none,
          alignLabelWithHint: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          hintStyle: TextStyle(color: Colors.white),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Center pushRegisterButton(BuildContext context) {
    return Center(
      child: ElevatedButton(
          clipBehavior: Clip.antiAlias,
          style: ButtonStyle(
              fixedSize: WidgetStateProperty.all(const Size(350, 60))),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SignUpPage()));
          },
          child: const Text(
            "Rigester",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
          )),
    );
  }

  Center loginButtom(FirebaseAuth instance, BuildContext context) {
    return Center(
      child: ElevatedButton(
          style: ButtonStyle(
              fixedSize: WidgetStateProperty.all(const Size(350, 60))),
          onPressed: () async {
            try {
              await BlocProvider.of<AuthCubit>(context)
                  .login(_email!, _password!);
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(e.toString()),
                ),
              );
            }
          },
          child: const Text(
            "log in",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
          )),
    );
  }
}
