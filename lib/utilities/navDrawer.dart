import 'dart:math' as math;
import 'package:digilocker/menuItems/about.dart';
import 'package:digilocker/menuItems/myProfile.dart';
import 'package:digilocker/menuItems/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({super.key, required this.email, required this.userName});

  final String email;
  final String userName;

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: Container(
              child: Stack(
                children: [
                  Container(color: Color.fromARGB(255, 55, 14, 201)),
                  Transform.translate(
                    offset: Offset(16, 20),
                    child: CircleAvatar(
                      radius: 58,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Transform.rotate(
                            angle: math.pi / .299,
                            child: Icon(
                              Icons.account_balance_wallet_outlined,
                              color: Colors.white,
                              size: 50,
                            ),
                          ),
                          Text(
                            'PocketID',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(250, 25),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(26, 0, 0, 0),
                            blurRadius: 2.0,
                            spreadRadius: -2.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(50),
                        color: Color.fromARGB(56, 255, 255, 255),
                      ),
                      child: GestureDetector(
                        onTap: () {},
                        child: Icon(Icons.nightlight_outlined),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          //MyProfile
          ListTile(
            leading: Icon(Icons.person_outline_rounded, size: 30),
            title: Text(
              'My Profile',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
            ),
            onTap:
              () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyProfile()),
                ),
              },
          ), 
          //About
          ListTile(
            leading: Icon(Icons.info_outline_rounded, size: 30),
            title: Text(
              'About',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
            ),
            onTap:
              () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const About()),
                ),
              },
          ),
          //Settings
          ListTile(
            leading: Icon(Icons.settings_outlined, size: 30),
            title: Text(
              'Settings',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
            ),
            onTap:
              () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Settings()),
                ),
              },
          ),
          //Help
          ListTile(
            leading: Icon(Icons.help_outline_rounded, size: 30),
            title: Text(
              'Help',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
            ),
            onTap:
              () => {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const Settings()),
                // ),
              },
          ),
          //LogOut
          ListTile(
            leading: Icon(Icons.logout, size: 30),
            title: Text(
              'Log out',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),
            ),
            onTap:
              () => {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const Settings()),
                // ),
              },
          ),
        ],
      ),
    );
  }
}
