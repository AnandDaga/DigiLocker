import "package:digilocker/SplashScreen/SplashScreen.dart";
import "package:flutter/material.dart";

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "PocketID",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      darkTheme: ThemeData.light(),
      home: SplashScreen(),
    );
  }
}

