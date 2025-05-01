import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'config.dart';

class AuthProvider extends ChangeNotifier {
  static Future<String?> loginuser(String email, String password) async {
    try {
      var reqBody = {"email": email, "password": password};

      var response = await http.post(
        Uri.parse(login),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(reqBody),
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        if (jsonResponse['message'] == 'User logged in successfully') {
          print('login successful ${response.body}');
          return jsonResponse['message'];
        } else {
          print('Authentication Failed: ${jsonResponse['message']}');
          return null;
        }
      } else {
        print('Server Error: ${response.statusCode}');
        print('Server Error: ${response.body}');
        return null;
      }
    } catch (e) {
      print("Error logging in: $e");
      return null;
    }
  }

  static Future<bool> registerUser(String email, String password) async {
    try {
      var reqBody = {"email": email, "password": password};

      var response = await http.post(
        Uri.parse(register),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(reqBody),
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        if (jsonResponse['message'] == 'User Registered Successfully') {
          print("Registeration Successfully");
          return true;
        } else {
          print('Registeration Failed ${jsonResponse['message']}');
          return false;
        }
      } else {
        print('Server error : ${response.statusCode}');
        print('Server error : ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error registering: $e');
      return false;
    }
  }
}
