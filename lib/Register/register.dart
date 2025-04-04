// ignore: file_names
import 'package:digilocker/utilities/reusable.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
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
                          height: 300,
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
                              Container(
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
                                  onPressed: () {},
                                  child: const Text(
                                    "Register",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
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
