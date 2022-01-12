import 'package:flutter/material.dart';
import 'package:razor_pay/my_container.dart';
import 'package:razor_pay/my_home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Mycontainer(),
    );
  }
}
