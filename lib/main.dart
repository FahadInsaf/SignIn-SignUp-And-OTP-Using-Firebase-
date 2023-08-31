import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scholar/phone.dart';
import 'package:scholar/sign_in.dart';
import 'package:scholar/splashScreen.dart';
import 'package:scholar/verify.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      MaterialApp(
        initialRoute: 'phone',
        debugShowCheckedModeBanner: false,
        // routes: {
        //   'phone': (context) => MyPhone(),
        //   'verify': (context) => MyVerify()
        // },
       home:MyHomePage() ,
  ));
}
