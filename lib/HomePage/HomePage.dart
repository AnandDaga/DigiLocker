import 'package:carousel_slider/carousel_slider.dart';
import 'package:digilocker/HomePage/DocImagePage.dart';
import 'package:digilocker/menuItems/about.dart';
import 'package:digilocker/menuItems/myProfile.dart';
import 'package:digilocker/menuItems/settings.dart';
import 'package:digilocker/utilities/navDrawer.dart';

import "package:flutter/material.dart";
import 'dart:math' as math;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final imageList = ["assets/navback.png", "assets/img1.jpg"];
  final docList = [
    "empty",
    "aadhar",
    "pan",
    "voter",
    "driving",
    "vaccine",
    "passport",
    "birth",
    "income",
  ];
  String firstName = "Loading...";
  String lastName = "Loading...";
  String email = "Loading...";
  String docName = "Loading...";

  Future<String> getDocInfo(String doc) async {
    return "empty";
  }

  Container headingContainer({text, double? size}) {
    return Container(
      height: 40,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "$text",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: size,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          (text == "Quick Links")
              ? Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: Color.fromARGB(255, 55, 14, 201),
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  child: Text(
                    "View All",
                    style: TextStyle(
                      color: Color.fromARGB(255, 55, 14, 201),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
              : (text != "What's New")
              ? const Text(
                "View all",
                style: TextStyle(
                  color: Color.fromARGB(255, 55, 14, 201),
                  fontSize: 12,
                ),
              )
              : Text(" "),
        ],
      ),
    );
  }

  SizedBox quickLinks({text, icon, Function? ontap}) {
    return SizedBox(
      width: 147,
      height: 50,
      child: GestureDetector(
        onTap: (() => ontap!()),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.black54),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: Color.fromARGB(31, 158, 158, 158),
                child: Icon(
                  icon,
                  size: 20,
                  color: Color.fromARGB(101, 0, 0, 0),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                text,
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox extractedContainer({text, image, doc, isSaved}) {
    bool showDoc = false;
    return SizedBox(
      width: 320,
      height: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 280,
            height: 170,
            child: ElevatedButton(
              onPressed: () {
                MaterialPageRoute route = MaterialPageRoute(
                  builder:
                      (context) => DocImagePage(docName: '$doc', text: text),
                );
                Navigator.push(context, route);
              },
              style: ButtonStyle(
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                foregroundColor: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.pressed)) {
                    return Colors.white;
                  } else {
                    return Colors.white;
                  }
                }),
                backgroundColor: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.pressed)) {
                    return Colors.white;
                  } else {
                    return Colors.white;
                  }
                }),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 70,
                        width: 70,
                        child: Image.asset("$image", fit: BoxFit.contain),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "$text",
                            style: const TextStyle(
                              letterSpacing: 0.8,
                              fontFamily: "Poppins-Regular",
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "XXXX XXXX XXXX",
                            style: TextStyle(
                              color: Colors.black45,
                              fontFamily: "Lato-Reg",
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  FutureBuilder(
                    future: getDocInfo(doc),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text(
                          "Save Now",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      } else {
                        if (snapshot.data == "empty") {
                          return Container(
                            height: 45,
                            width: 219,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 55, 14, 201),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(
                              child: Text(
                                "Save Now",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Container(
                            height: 45,
                            width: 219,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 55, 14, 201),
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                color: Color.fromARGB(255, 55, 14, 201),
                                width: 1,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "View Now",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 55, 14, 201),
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          );
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox extractedBox({text, image}) {
    return SizedBox(
      height: 200,
      width: 230,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 185,
            width: 195,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(130, 158, 158, 158),
                  spreadRadius: 0,
                  blurRadius: 0,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 23),
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Color.fromARGB(255, 55, 14, 201),
                  child: Container(
                    height: 100,
                    width: 100,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Image.asset("$image", fit: BoxFit.cover),
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "$text",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      letterSpacing: 0.8,
                      fontFamily: "Poppins-Reg",
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Color.fromARGB(255, 55, 14, 201),
        title: Row(
          children: [
            Transform.rotate(
              angle: math.pi / 0.299,
              child: const Icon(
                Icons.account_balance_wallet_outlined,
                color: Color.fromARGB(255, 55, 14, 201),
                size: 30,
              ),
            ),
            SizedBox(width: 8),
            Text(
              "|  PocketID",
              style: TextStyle(
                color: Color.fromARGB(255, 55, 14, 201),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      drawer: NavDrawer(email: email, userName: firstName),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  SizedBox(height: 25),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Hi,",
                                      style: TextStyle(
                                        color: const Color.fromARGB(
                                          255,
                                          0,
                                          0,
                                          0,
                                        ),
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 3),
                                    Text(
                                      '${firstName}',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 55, 14, 201),
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),

                                Text(
                                  "Welcome back to PocketID",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(flex: 1),

                        CircleAvatar(
                          radius: 23,
                          backgroundColor: Color.fromARGB(255, 55, 14, 201),
                          child: Container(
                            height: 37,
                            width: 37,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: FutureBuilder(
                              future: getDocInfo("Profile"),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const CircularProgressIndicator();
                                } else {
                                  if (snapshot.data == "empty") {
                                    return Container();
                                  } else {
                                    return Image.network(
                                      "${snapshot.data}",
                                      fit: BoxFit.cover,
                                    );
                                  }
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              headingContainer(text: "What's New", size: 15),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  height: 200,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 55, 14, 201),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ListView(
                    children: [
                      CarouselSlider(
                        items: [
                          SizedBox(
                            height: 250,
                            child: Image.asset(imageList[0], fit: BoxFit.cover),
                          ),
                          SizedBox(
                            height: 250,
                            child: Image.asset(imageList[1], fit: BoxFit.cover),
                          ),
                        ],

                        options: CarouselOptions(
                          autoPlay: true,
                          height: 200,
                          viewportFraction: 1.0,
                          autoPlayCurve: Curves.easeInOut,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration: const Duration(
                            milliseconds: 1800,
                          ),
                        ),
                      ),

                      // TO DO : Document container
                      // TO DO : other document container
                    ],
                  ),
                ),
              ),
              headingContainer(text: "Issued Documents", size: 15),
              SizedBox(
                height: 190,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    extractedContainer(
                      text: "Aadhar Card",
                      image: "assets/aadhaar.png",
                      doc: "aadhar",
                      isSaved: 1,
                    ),
                    extractedContainer(
                      text: "Pan Card",
                      image: "assets/pan.png",
                      doc: "pan",
                      isSaved: 2,
                    ),
                    extractedContainer(
                      text: "Driving License",
                      image: "assets/others.png",
                      doc: "driving",
                      isSaved: 3,
                    ),
                    extractedContainer(
                      text: "Covid Vaccine",
                      image: "assets/others.png",
                      doc: "vaccine",
                      isSaved: 4,
                    ),
                    //TO DO remaining element
                  ],
                ),
              ),
              headingContainer(text: "Other Documents", size: 15),
              SizedBox(
                height: 220,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(width: 15),
                    extractedBox(
                      text: "Vehicle Registration",
                      image: "assets/vregistration.jpg",
                    ),
                    extractedBox(
                      text: "Birth Certificate",
                      image: "assets/birthcertificate.png",
                    ),
                    extractedBox(
                      text: "Income Certificate",
                      image: "assets/income-certificate.jpg",
                    ),
                  ],
                ),
              ),
              headingContainer(text: "Quick Links", size: 18),
              Padding(
                padding: EdgeInsets.all(10),
                child: SizedBox(
                  height: 50,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(width: 10),
                      quickLinks(
                        text: "My Profile",
                        icon: Icons.person_add_alt_1_outlined,
                        ontap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyProfile(),
                            ),
                          );
                        },
                      ),
                      SizedBox(width: 25),
                      quickLinks(
                        text: "Forget Pin",
                        icon: Icons.help_outline_rounded,
                        ontap: () {},
                      ),
                      SizedBox(width: 25),
                      quickLinks(
                        text: "About",
                        icon: Icons.info_outline_rounded,
                        ontap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => About()),
                          );
                        },
                      ),
                      SizedBox(width: 25),
                      quickLinks(
                        text: "Settings",
                        icon: Icons.settings_outlined,
                        ontap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Settings()),
                          );
                        },
                      ),
                      SizedBox(width: 25),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DocContainer extends StatelessWidget {
  const DocContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[];
        },
        body: ListView.builder(
          itemCount: 30,
          padding: EdgeInsets.all(10),
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 50,
              child: Center(child: Text('Item $index')),
            );
          },
        ),
      ),
    );
  }
}
