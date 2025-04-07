import 'package:carousel_slider/carousel_slider.dart';

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

  Future<String> getDocInfo(String doc) async{

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
              onPressed: () {},              
              style: ButtonStyle(
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),                    
                  )
                ),
                foregroundColor: WidgetStateProperty.resolveWith(
                  (states) {
                    if(states.contains(WidgetState.pressed)){
                      return Colors.white;
                    }else{
                      return Colors.white;
                    }
                  },                
                ),
                backgroundColor: WidgetStateProperty.resolveWith(
                  (states) {
                    if(states.contains(WidgetState.pressed)){
                      return Colors.white;
                    }else{
                      return Colors.white;
                    }
                  },                
                ),              
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
                        child: Image.asset("$image", fit: BoxFit.fitHeight),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "$text",
                            style: TextStyle(
                              letterSpacing: 0.8,
                              fontFamily: "Poppins-Regular",

                              ///color: Colors.white,
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
                        }
                        else{
                          return Container(
                            height: 45,
                            width: 219,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 55, 14, 201),
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                color: Color.fromARGB(255, 55, 14, 201),
                                width:1,
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
          )
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
                color: Colors.white,
                size: 30,
              ),
            ),
            SizedBox(width: 8),
            Text(
              "|  PocketID",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
      // drawer: NewDrawer(
      //   username: firstName,
      //   email: email,
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  SizedBox(height: 10),
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
                                Text(
                                  "Hello,",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 3),
                                const Text(
                                  "Anand",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
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
                  ),
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
                      child: CircularProgressIndicator(),
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
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ListView(
                    children: [
                      CarouselSlider(
                        items: [
                          SizedBox(
                            height: 250,
                            child: Image.asset(
                              imageList[0],
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            height: 250,
                            child: Image.asset(
                              imageList[1],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                        options: CarouselOptions(
                          autoPlay: true,
                          height: 200,
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
                    //TO DO remaining element
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
                        ontap: () {},
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
                        ontap: () {},
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
