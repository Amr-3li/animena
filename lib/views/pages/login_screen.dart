import 'package:animena/views/pages/app_pages/bottom_navigator.dart';
import 'package:animena/views/pages/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? _email, _password;
  bool isPass=true;
  @override

  @override


  @override
  Widget build(BuildContext context) {
    FirebaseAuth instance = FirebaseAuth.instance;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 8, 31, 8),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
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
              SizedBox(
                height: 10,
              ),
              Center(
                  child: Text(
                "welcome to the login",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 35),
              )),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  "Email",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  onChanged: (value) {
                    this._email = value;
                  },
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white, fontSize: 20),
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
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  "password",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  obscureText: isPass,
                  focusNode: FocusNode(),
                  onChanged: (value) {
                    this._password = value;
                  },
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  decoration:  InputDecoration(
                    suffixIcon: IconButton(onPressed:() {
                      setState(() {
                        this.isPass=! isPass;
                      });
                    }, icon: Icon(Icons.visibility)),
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
              ),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "forget password",
                      style: TextStyle(color: Colors.grey),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: ElevatedButton(
                    style: ButtonStyle(
                        fixedSize: WidgetStateProperty.all(Size(350, 60))),
                    onPressed: () async {
                      try {
                        await instance.signInWithEmailAndPassword(
                            email: this._email!, password: this._password!);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BottomNavigator()));
                      } on FirebaseAuthException catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(e.code),
                          ),
                        );
                      }
                    },
                    child: Text(
                      "log in",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: ElevatedButton(
                    clipBehavior: Clip.antiAlias,
                    style: ButtonStyle(
                        fixedSize: WidgetStateProperty.all(Size(350, 60))),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpPage()));
                    },
                    child: Text(
                      "Rigester",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
