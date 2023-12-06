import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:task3/Open_Screen/splash.dart';
import 'home_Screen/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCNtzTVD0pUfQENMypaS31_sR9HGz_loOM",
            appId: "1:788260680823:web:b1234ed2df3a631fd24272",
            messagingSenderId: "G-D8B0ELYK9M",
            projectId: "total-service-336607")
    );
  }
  else{
    await Firebase.initializeApp();
  }
    runApp(const MyApp());



}
class MyApp extends StatefulWidget {

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  // bool aaa=false;
  // getLocal() async {
  //
  //  SharedPreferences sher = await SharedPreferences.getInstance();
  //  if(sher.containsKey('name')){
  //    aaa=true;
  //  }
  //  else{
  //    aaa=false;
  //  }
  //  setState(() {
  //
  //  });
  // }

  @override
  // void initState() {
  //   // TODO: implement initState
  //   getLocal();
  //   super.initState();
  // }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    w=MediaQuery.of(context).size.width;
    h=MediaQuery.of(context).size.height;
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: openscreen(),
      // aaa==true?sherpri2():shepref(),
      // proverified openscreen MYProfile Post CommentDisplay
    );
  }
}
// const firebaseConfig = {
//   apiKey: "AIzaSyCNtzTVD0pUfQENMypaS31_sR9HGz_loOM",
//   authDomain: "total-service-336607.firebaseapp.com",
//   projectId: "total-service-336607",
//   storageBucket: "total-service-336607.appspot.com",
//   messagingSenderId: "788260680823",
//   appId: "1:788260680823:web:b1234ed2df3a631fd24272",
//   measurementId: "G-D8B0ELYK9M"
// };
