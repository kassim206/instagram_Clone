import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task3/home_Screen/home.dart';
import 'package:task3/Open_Screen/sherpri2.dart';
class shepref extends StatefulWidget {
  const shepref({super.key});

  @override
  State<shepref> createState() => _sheprefState();
}

class _sheprefState extends State<shepref> {
  TextEditingController controller =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width:w,
        height:h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: controller,
            ),
            TextButton(onPressed: () async {
              SharedPreferences sher = await SharedPreferences.getInstance();

              if(controller.text.isNotEmpty){
                sher.setString("name", controller.text);
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => sherpri2 ()));
              }
            }, child: Center(child: Text("submit")))
          ],
        ),
      ),
    );
  }
}
