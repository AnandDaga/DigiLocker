import 'package:flutter/material.dart';

class DocImagePage extends StatefulWidget {
  const DocImagePage({super.key, required this.docName, required this.text});
  final String docName;
  final String text;
  @override
  State<DocImagePage> createState() => _DocImagePageState();
}

class _DocImagePageState extends State<DocImagePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.arrow_back_ios),
          ),
          foregroundColor: Color.fromARGB(255, 55, 14, 201),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            widget.docName,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: 725,
            child: Column(
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    height: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(128, 128, 128, 0.5),
                          spreadRadius: 3,
                          blurRadius: 20,
                          offset: const Offset(0, 3),
                        ),
                        BoxShadow(
                          color: Colors.white,
                          spreadRadius: 0,
                          blurRadius: 0,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Row(
                          children: [
                            SizedBox(
                              width: 70,
                              height: 70,
                              child: Image.asset("assets/others.png"),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                            height: 210,
                            width: 350,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(103, 104, 103, 103),
                                  spreadRadius: 5,
                                  blurRadius: 2,
                                  offset: const Offset(2, 1),
                                ),
                                BoxShadow(
                                  color: Colors.white,
                                  spreadRadius: 0,
                                  blurRadius: 0,
                                  offset: const Offset(0, 0),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Add Document",
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  const SizedBox(width: 10),
                                  const Icon(Icons.add_box_outlined, size: 30),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 60,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 35),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Document updated?",
                                  style: TextStyle(fontSize: 15),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 55, 14, 201),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Icon(
                                      Icons.camera_alt_outlined,
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 55, 14, 201),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Icon(
                                      Icons.photo_rounded,
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 55, 14, 201),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Icon(
                                      Icons.delete_rounded,
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
