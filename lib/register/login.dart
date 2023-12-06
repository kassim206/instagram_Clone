import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task3/Auth/Authentication.dart';
import 'package:task3/register/register.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../home_Screen/home.dart';


final auth1=Authentication();

var getuser;
class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  bool obsck = true;
  final _auth=FirebaseAuth.instance;
  final signmailcontroller =TextEditingController();
  final signpasswardcontroller =TextEditingController();
  getUser({required String email, required String password}){
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email, password: password).then((value) =>
        Navigator.push(context, MaterialPageRoute(
        builder: (context) =>MyApp6())));
    FirebaseFirestore.instance.collection("users")
        .doc("XTDZVNgexCW6nblYvLdiXv9I9pI2")
        .update({
      "lastLogged":DateTime.now()
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
                 Container(
                   width: w*.70,
                   height: h*.20,
                   decoration: BoxDecoration(
                     color: Colors.grey[300]
                   ),
                   child: Image(image: AssetImage("images/Threm (2).png",),
                     width: w*.200,
                     height: h*.120,
                     fit: BoxFit.cover,),
                 ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                    child: Text("Welcome Back!",style: TextStyle(color: Colors.black,fontSize: h*.02,),)),
              ),
              SizedBox(height: h*.02,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0,),
                child: TextFormField(
                  controller: signmailcontroller,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400)
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintText: "Email",
                      labelText: "Email",

                  ),

                ),

              ),
              SizedBox(height: h*.04,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0,),
                child: TextFormField(
                  controller: signpasswardcontroller,
                  obscureText: obsck,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400)
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintText: "Password",
                    labelText: "Password",
                    suffixIcon: GestureDetector(
                      onTap: (){
                        setState(() {
                          obsck = ! obsck;
                        });
                      },
                      child: obsck?Icon(Icons.visibility):Icon(Icons.visibility_off),
                    )
                  ),

                ),

              ),
              // SizedBox(height: h*.01,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerRight,
                    child: TextButton(onPressed: (){}, child: Text("Forget Password?"))),
              ),
              SizedBox(height: h*.01,),
              InkWell(
                onTap: (){


                  getUser(email:signmailcontroller.text, password:signpasswardcontroller.text);


                },
                child: Container(
                  width: w*.70,
                  height: h*.075,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(child: Text("Continue",style: TextStyle(color: Colors.white,fontSize: h*.02),)),
                ),
              ),
              SizedBox(height: h*.01,),
              Text("OR",style: TextStyle(color: Colors.black,fontSize: h*.01),),
              SizedBox(height: h*.01,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap :(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const loginpage()));
                    },
                      child: Container(
                        width: w*.10,
                        height: h*.07,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey
                        ),
                        child: Positioned
                          (child: Image(image: AssetImage("images/iosblk.png"),fit: BoxFit.cover)),
                      ),
                    ),
                    SizedBox(width: w*.06,),
                    InkWell(onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const loginpage()));
                    },
                      child: InkWell(
                        onTap: (){
                          auth1.signup(context);
                        },
                        child: Container(
                          width: w*.10,
                          height: h*.07,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey.shade200
                          ),
                          child: Image(image: AssetImage("images/go.png"),fit: BoxFit.cover,
                        ),
                        ),
                      ),
                    ),
                    SizedBox(width: w*.06,),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const loginpage()));
                      },
                      child: Container(
                        width: w*.10,
                        height: h*.07,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.blueAccent
                        ),
                        child: Image(image: AssetImage("images/fac.png"),fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                  },
                  // child: Container(
                  //   width: w*.60,
                  //   height: h*.07,
                  //   decoration: BoxDecoration(
                  //       color: Colors.blueAccent,
                  //       borderRadius: BorderRadius.circular(15)
                  //   ),
                  //   child: Center(child: Text("Create",style: TextStyle(color: Colors.black26,fontSize: h*.03),)),
                  // ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text("Don't have an account yet?",style: TextStyle(color: Colors.grey,fontSize: h*.020),),
                      SizedBox(width: w*.01,),
                      InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const signup()));
                          },

                          child: Text("Sign Up",style: TextStyle(color: Colors.black,fontSize: h*.02),)),
                    ],
                  ),
                ),
              ),
            ],


          ),
        ),

      ),
    );
  }
}
