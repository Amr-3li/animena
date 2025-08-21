// ignore_for_file: use_build_context_synchronously

import 'package:animena/core/dependcy_injection/getit.dart';
import 'package:animena/features/auth/data/repository/auth_repo.dart';
import 'package:animena/features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:animena/features/auth/presentation/views/pages/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  FirebaseAuth instance = FirebaseAuth.instance;
  SharedPreferences? sharedPreferences;
  String? email;
  // UserData? userData;

  // static Future<UserData> getUser() async {
  //   CollectionReference ref = FirebaseFirestore.instance.collection('user');
  //   QuerySnapshot querySnapshot = await ref
  //       .where('email', isEqualTo: FirebaseAuth.instance.currentUser!.email)
  //       .get();
  //   if (querySnapshot.docs.isNotEmpty) {
  //     DocumentSnapshot doc = querySnapshot.docs.first;
  //     return UserData.fromDocument(doc);
  //   } else {
  //     throw Exception('User not found');
  //   }
  // }

  @override
  void initState() {
    super.initState();
    getUser();
  }

  getUser() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      email = sharedPreferences!.getString('email');
    });
  }

  @override
  Widget build(BuildContext context) {
    return email == null
        ? const Scaffold(
            backgroundColor: Color.fromARGB(255, 8, 31, 8),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : BlocProvider(
            create: (context) => AuthCubit(getIt<AuthRepo>()),
            child: BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is LogoutSuccess) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                } else if (state is LogoutError) {
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
                  appBar: AppBar(
                    title: Center(
                        child: Text(
                      "welcome ",
                      style: TextStyle(color: Colors.white, fontSize: 29.sp),
                    )),
                    backgroundColor: const Color.fromARGB(255, 22, 89, 22),
                  ),
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(100)),
                        height: 200.h,
                        width: 200.w,
                        child: ClipRRect(
                          child: Image.asset(
                              "assets/Images/illustration-businessman.png"),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Text(
                        "email : $email",
                        style: TextStyle(color: Colors.white, fontSize: 28.sp),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      state is LogoutLoading
                          ? const Center(child: CircularProgressIndicator())
                          : ElevatedButton(
                              style: ButtonStyle(
                                  fixedSize: WidgetStatePropertyAll(
                                      Size(300.w, 50.h))),
                              onPressed: () async {
                                try {
                                  BlocProvider.of<AuthCubit>(context).logout();
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return const LoginPage();
                                      },
                                    ),
                                  );
                                } on FirebaseAuthException catch (e) {
                                  print(e.code);
                                }
                              },
                              child: Text(
                                "log out",
                                style: TextStyle(fontSize: 25.sp),
                              ))
                    ],
                  ),
                );
              },
            ),
          );
  }
}
