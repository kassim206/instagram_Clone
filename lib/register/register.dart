import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task3/model/accountmodels.dart';

import '../home_Screen/home.dart';
import 'login.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  bool obsc = false;
  final _auth = FirebaseAuth.instance;
  final usernamecontroller = TextEditingController();
  final signmailcontroller = TextEditingController();
  final signpasswardcontroller = TextEditingController();
  final signconfirmpassword = TextEditingController();
  final signphonecontroller = TextEditingController();
  getuser() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(children: [
            // Icon(Icons.lock,size:h*.30 ),
            Text("SigninPage"),
            SizedBox(
              height: h * .05,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextFormField(
                controller: usernamecontroller,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400)),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintText: "User Name",
                    labelText: "User Name",
                    prefixIcon: Icon(Icons.person_outlined)),
              ),
            ),
            SizedBox(
              height: h * .02,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextFormField(
                controller: signmailcontroller,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400)),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintText: "Email",
                    prefixIcon: Icon(Icons.email_outlined)),
              ),
            ),
            SizedBox(
              height: h * .02,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: signphonecontroller,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400)),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintText: "Phone Number",
                    labelText: "Phone Number",
                    prefixIcon: Icon(Icons.call)),
              ),
            ),
            SizedBox(
              height: h * .02,
            ),



            //---------------------password-----------------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                controller: signpasswardcontroller,
                obscureText: obsc,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400)),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintText: "Password",
                suffixIcon:  GestureDetector(
                    onTap: (){
              setState(() {
              obsc = ! obsc;
              });
              },
                child: obsc?Icon(Icons.visibility):Icon(Icons.visibility_off),
              )
                ),

              ),
            ),

            SizedBox(
              height: h * .02,
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Align(
            //       alignment: Alignment.centerRight,
            //       child: TextButton(onPressed: (){}, child: Text("Forget Password?"))),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                controller: signconfirmpassword,
                obscureText: true,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400)),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintText: "Confirm Password"),
              ),
            ),
            SizedBox(
              height: h * .05,
            ),
            InkWell(
              onTap: () {
               var model= UsersModel(userEmail:signmailcontroller.text,
                  userName: usernamecontroller.text,
                  userPhoneNumber: signphonecontroller.text,
                  userPassword: signpasswardcontroller.text,
                  createDate: DateTime.now(), imageUrl: '', lastLogged:DateTime.now(),
                 uid: '', followers: [],
                );
                _auth
                    .createUserWithEmailAndPassword(
                  email: signmailcontroller.text,
                  password: signpasswardcontroller.text,
                )
                    .then((value) {
                  FirebaseFirestore.instance
                      .collection("users").add(model.toJson()).then((value) =>
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  loginpage())),);
                  //     .doc(value.user!.uid)
                  //     .set({
                  //   "email": signmailcontroller.text,
                  //   "password": signpasswardcontroller.text,
                  //   "createDate": FieldValue.serverTimestamp(),
                  //   "userName": usernamecontroller.text,
                  //   "phoneNo": signphonecontroller.text,
                  //
                  // });

                });
              },
              child: Container(
                width: w * .70,
                height: h * .075,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black,
                ),
                child: Center(
                    child: Text(
                  "Continue",
                  style: TextStyle(fontSize: h * .02, color: Colors.white),
                )),
              ),
            ),
            SizedBox(
              height: h * .02,
            ),
            Text(
              "OR",
              style: TextStyle(color: Colors.black26, fontSize: h * .01),
            ),
            SizedBox(
              height: h * .02,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MyApp6()));
              },
              child: Container(
                width: w * .08,
                height: h * .06,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.grey.shade200),
                child: Image(
                  image: AssetImage("images/go.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account yet?",
                      style: TextStyle(color: Colors.grey, fontSize: h * .020),
                    ),
                    SizedBox(
                      width: w * .01,
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const loginpage()));
                        },
                        child: Text(
                          "LOGIN",
                          style:
                              TextStyle(color: Colors.black, fontSize: h * .02),
                        )),
                  ],
                ),
              ),
            ),
          ]),
        )));
  }
}
