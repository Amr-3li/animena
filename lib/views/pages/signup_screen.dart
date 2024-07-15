import 'package:animena/stripe_payment/payment_manager.dart';
import 'package:animena/views/pages/app_pages/bottom_navigator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  FirebaseAuth instance = FirebaseAuth.instance;
  String? _name, _email, _password, phone;
  @override
  Widget build(BuildContext context) {
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
                  "assets/Images/signUp.png",
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
                "welcome to the SignUp",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 35),
              )),
              SizedBox(
                height: 30,
              ),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  onChanged: (value) {
                    this._name = value;
                  },
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  decoration: const InputDecoration(
                    labelText: "User name",
                    labelStyle: TextStyle(color: Colors.white),
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
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  onChanged: (value) {
                    this._email = value;
                  },
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  decoration: const InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(color: Colors.white),
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
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  obscureText: true,
                  onChanged: (value) {
                    this._password = value;
                  },
                  cursorColor: Colors.white,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  decoration: const InputDecoration(
                    labelText: "password",
                    labelStyle: TextStyle(color: Colors.white),
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
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    this.phone = value;
                  },
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  decoration: const InputDecoration(
                    labelText: "phone",
                    labelStyle: TextStyle(color: Colors.white),
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
              SizedBox(
                height: 20,
              ),
              Center(
                child: ElevatedButton(
                    clipBehavior: Clip.antiAlias,
                    style: ButtonStyle(
                        fixedSize: WidgetStateProperty.all(Size(350, 60))),
                    onPressed: () async {
                      try {
                        await PaymentManager.makePayment(200, "EGP");
                        CollectionReference collRef =
                            FirebaseFirestore.instance.collection('user');
                        collRef.add({
                          'email': this._email,
                          'name': this._name,
                          'phone': this.phone
                        });
                        await instance.createUserWithEmailAndPassword(
                            email: this._email!.trim(),
                            password: this._password!);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("correct sign Up"),
                          ),
                        );
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BottomNavigator()),

                        );
                      } on FirebaseAuthException catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(e.code),
                          ),
                        );
                      }
                    },
                    child: Row(
                      children: [
                        Text(
                          "Rigester",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 19),
                        ),
                        Spacer(flex: 1,),
                        Text(
                          "200 LE",
                          style: TextStyle(color: Colors.red, fontSize: 20),
                        ),
                      ],
                    )),
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
