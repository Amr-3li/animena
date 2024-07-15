import 'package:animena/data/models/user.dart';
import 'package:animena/views/pages/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  FirebaseAuth instance = FirebaseAuth.instance;
  UserData? userData;

  static Future<UserData> getUser() async {
    CollectionReference ref = FirebaseFirestore.instance.collection('user');
    QuerySnapshot querySnapshot = await ref
        .where('email', isEqualTo: FirebaseAuth.instance.currentUser!.email)
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      DocumentSnapshot doc = querySnapshot.docs.first;
      return UserData.fromDocument(doc);
    } else {
      throw Exception('User not found');
    }
  }

  @override
  void initState() {
    super.initState();
    setUser();
  }

  void setUser() async {
    UserData temp = await getUser();
    setState(() {
      userData = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return userData == null
        ? Scaffold(
      backgroundColor: Color.fromARGB(255, 8, 31, 8),
          body: Center(
              child: CircularProgressIndicator(),
            ),
        )
        : Scaffold(
            backgroundColor: Color.fromARGB(255, 8, 31, 8),
            appBar: AppBar(
              title: Center(
                  child: Text(
                "welcome ${userData!.name}",
                style: TextStyle(color: Colors.white, fontSize: 29),
              )),
              backgroundColor: Color.fromARGB(255, 22, 89, 22),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(100)),
                  height: 200,
                  width: 200,
                  child: ClipRRect(
                    child: Image.asset(
                        "assets/Images/illustration-businessman.png"),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                    child: Text(
                  "name : ${userData?.name}",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                )),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "email : ${userData?.email}",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "phone : ${userData?.phone}",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                SizedBox(
                  height: 100,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        fixedSize: WidgetStatePropertyAll(Size(300, 50))),
                    onPressed: () async {
                      try {
                        await instance.signOut();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return LoginPage();
                            },
                          ),
                        );
                      } on FirebaseAuthException catch (e) {
                        print(e.code);
                      }
                    },
                    child: Text(
                      "log out",
                      style: TextStyle(fontSize: 25),
                    ))
              ],
            ),
          );
  }
}
