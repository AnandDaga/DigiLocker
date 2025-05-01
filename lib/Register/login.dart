import 'package:digilocker/Register/register.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:digilocker/HomePage/HomePage.dart';
import 'package:digilocker/provider/auth_provider.dart';
import 'package:digilocker/utilities/reusable.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  bool isNotValidate = false;
  void loginUser() async {
    if (_emailTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty) {
      var token = await AuthProvider.loginuser(
        _emailTextController.text,
        _passwordTextController.text,
      );
     // print('${response.body}');
      ;
      if (token != null) {
        print('Login Successfully');
        Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(builder: (context) => const MyHomePage()),
        );
      } else {
        print('Failed');
        print('Invalid Credentials');
      }
    } else {
      setState(() {
        isNotValidate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 55, 14, 201),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 70),
              Icon(
                Icons.account_balance_wallet_outlined,
                color: Colors.white,
                size: 90,
              ),
              Text(
                "PocketID",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Center(
                child: Column(
                  children: [
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35.0),
                        child: Container(
                          height: 350,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Column(
                            children: <Widget>[
                              const SizedBox(height: 40),
                              reusableTextField(
                                "Email",
                                Icons.person,
                                false,
                                _emailTextController,
                              ),
                              const SizedBox(height: 15),
                              reusableTextField(
                                "Password",
                                Icons.lock,
                                true,
                                _passwordTextController,
                              ),
                              const SizedBox(height: 25),

                              SizedBox(
                                height: 35,
                                child: Text(
                                  "Forgot Password",
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: 15,
                                  ),
                                ),
                              ),

                              Container(
                                height: 43,
                                width: 150,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 50, 14, 201),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    loginUser();
                                  },
                                  child: const Text(
                                    "Sign In",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Create an Account",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (context) => const Register(),
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      "Sign Up",
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 55, 14, 201),
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
