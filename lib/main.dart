import "package:digilocker/SplashScreen/SplashScreen.dart";
import "package:digilocker/utilities/themeChanger.dart";
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider<ThemeProvider>(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, provider, child) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          title: "PocketID",
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          home: SplashScreen(),
        );
      },
    );
  }
}
