import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class sherpri2 extends StatefulWidget {
  const sherpri2({super.key});

  @override
  State<sherpri2> createState() => _sherpri2State();
}

class _sherpri2State extends State<sherpri2> {
   String action ='';
   getLocal() async {
     SharedPreferences sher = await SharedPreferences.getInstance();
     var name = sher.get("name");
     setState(() {

     });
   }
   @override
  void initState() {
    // TODO: implement initState
      super.initState();
  getLocal();
   }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          TextButton(onPressed: () async {
      SharedPreferences sher = await SharedPreferences.getInstance();
          }, child:  Text(action),
          ),

        ],
      ),);
  }
}
