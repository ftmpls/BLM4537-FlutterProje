import 'package:flutter/material.dart';

import 'package:food_order/signuppage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kayit Ekrani'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 33, 60, 101),
      ),
      body: SignUpScreen(),
    );
  }
}
