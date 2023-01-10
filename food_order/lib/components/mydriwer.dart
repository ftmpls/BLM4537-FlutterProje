import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDriwerWidget extends StatelessWidget {
  const MyDriwerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        DrawerHeader(
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(color: Colors.red),
          child: UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.red),
            accountName: Text(
              "Programmer",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            accountEmail: Text(
              "fatmaunal98@gmail.com",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("images/avatar.jpg"),
            ),
          ),
        ),
        ListTile(
          leading: Icon(
            CupertinoIcons.home,
            color: Colors.red,
          ),
          title: Text(
            "Home",
            style: TextStyle(
                color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        ListTile(
          leading: Icon(
            CupertinoIcons.cart_fill,
            color: Colors.red,
          ),
          title: Text(
            "My Orders",
            style: TextStyle(
                color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        ListTile(
          leading: Icon(
            CupertinoIcons.heart_fill,
            color: Colors.red,
          ),
          title: Text(
            "My Favorites",
            style: TextStyle(
                color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        ListTile(
          leading: Icon(
            CupertinoIcons.settings,
            color: Colors.red,
          ),
          title: Text(
            "Settings",
            style: TextStyle(
                color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.exit_to_app,
            color: Colors.red,
          ),
          title: Text(
            "Log Out",
            style: TextStyle(
                color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ]),
    );
  }
}
