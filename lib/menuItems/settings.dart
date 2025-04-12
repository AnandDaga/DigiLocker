import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  Container settingsContainer(IconData icon, text, Color color, Color color2) {
    return Container(
      height: 75,
      child: Row(
        children: [
          Container(
            height: 54,
            width: 54,
            decoration: BoxDecoration(
              color: color2,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(icon, color: color),
          ),
          SizedBox(width: 20),
          Text(text, style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Settings',
          style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(height: 20),
            // Row(
            //   children: [
            //     Text(
            //       'Settings',
            //       style: TextStyle(
            //         fontSize: 30,
            //         fontWeight: FontWeight.bold,
            //         color: Colors.grey[800],
            //       ),
            //     ),
            //   ],
            // ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  "General app and account settings",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            settingsContainer(
              Icons.lock_outline,
              'Change Pin',
              Colors.green,
              Color.fromARGB(40, 76, 175, 79),
            ),
            const SizedBox(height: 10),
            settingsContainer(
              Icons.password,
              'Change Password',
              Colors.blue,
              Color.fromARGB(60, 255, 153, 0),
            ),
          ],
        ),
      ),
    );
  }
}
