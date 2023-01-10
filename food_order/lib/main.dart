import 'package:flutter/material.dart';
import 'package:food_order/pages/homepage.dart';
import 'package:food_order/pages/itemPage.dart';

import 'anasayfa/anasayfa.dart';
import 'pages/cartpage.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  //final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // routes: {
        //   "/": (context) => KayitFormu(),
        //   "cartPage": (context) => CartPage(),
        //   "itemPage": ((context) => itemPage())
        // },

        home: MyHomePage()
        //
        );
  }
}
