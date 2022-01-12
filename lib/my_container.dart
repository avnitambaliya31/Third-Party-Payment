import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:razor_pay/my_home_page.dart';

class Mycontainer extends StatefulWidget {
  Mycontainer({Key? key}) : super(key: key);

  @override
  _MycontainerState createState() => _MycontainerState();
}

class _MycontainerState extends State<Mycontainer> {
  List<Map<String, dynamic>> containerData = [
    {
      "Name": "Virat Kohli",
      "Phone": "+91 1234567890",
      "Email": "kohli@gmail.com"
    },
    {
      "Name": "M.S. Dhoni",
      "Phone": "+91 4567891230",
      "Email": "dhoni@gmail.com"
    },
    {
      "Name": "Ravindra Jadeja",
      "Phone": "+91 9875641230",
      "Email": "jadeja@gmail.com"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.indigo[400],
        centerTitle: true,
        title: const Text(
          "Payment Select",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView(
                children: containerData.map((e) {
                  return Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(CupertinoPageRoute(
                                builder: (_) => MyHomePage(
                                      name: e["Name"],
                                      email: e["Email"],
                                      phone: e["Phone"],
                                    )));
                          },
                          child: Container(
                            height: 100,
                            width: 380,
                            color: Colors.white,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 20.0, top: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.person),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        e["Name"],
                                        style: const TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.phone,
                                        size: 15,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        e["Phone"],
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.email,
                                        size: 15,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        e["Email"],
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      )
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
