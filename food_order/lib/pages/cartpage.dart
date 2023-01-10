import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'itemPage.dart';
import 'cartpage_product.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  num total = 0;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.red,
        title: Text('Cart'),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
          new IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {})
        ],
      ),
      body: Cart_products(),
      bottomNavigationBar: Container(
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Expanded(
                  child: ListTile(
                title: new Text(
                  "Total",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: StreamBuilder(
                  stream:
                      FirebaseFirestore.instance.collection("cart").snapshots(),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.data == null) {
                      return Text("null");
                    }
                    List<DocumentSnapshot> tripPhotos;
                    tripPhotos = snapshot.data.docs;

                    if (snapshot.hasError) return Text('Something went wrong');
                    if (snapshot.connectionState == ConnectionState.waiting)
                      return CircularProgressIndicator();

                    // NB: I set the value of total = 0; so that anytime the stream
                    // builder is called, total starts from 0.
                    total = 0;

                    tripPhotos.forEach((result) {
                      total += result['price'] * result['quantity'];
                    });

                    return Text(
                      '${total.toString()}\$',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    );
                  },
                ),
              )),
              Expanded(
                child: new MaterialButton(
                  onPressed: () {},
                  child: new Text(
                    "Check out",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.red,
                ),
              ),
            ],
          )),
    );
  }
}
