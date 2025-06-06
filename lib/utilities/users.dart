import 'package:digilocker/HomePage/HomePage.dart';
import 'package:digilocker/Register/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class UserManagement with ChangeNotifier {
 

  logOut(context) {
    EasyLoading.show(status: "Logging Out");
    Future.delayed(const Duration(seconds: 2), () {
      EasyLoading.dismiss();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Login()),
      );
    });
  }

  // loginUser(String email, String password) async {
  //   EasyLoading.show(status: 'Logging In...');
  //   Future.delayed(const Duration(seconds: 2), () {
  //     EasyLoading.dismiss();
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(builder: (context) => const MyHomePage()),
  //     );
  //   });
  //}
}
