import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Cart_products extends StatefulWidget {
  @override
  _Cart_productsState createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('cart').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          List<DocumentSnapshot> tripPhotos;
          tripPhotos = snapshot.data.docs;
          return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                return Single_cart_product(
                  cart_prod_id: tripPhotos[index]['id'],
                  cart_prod_name: tripPhotos[index]["name"],
                  cart_prod_picture: tripPhotos[index]["picture"],
                  cart_prod_qty: tripPhotos[index]["quantity"],
                  cart_prod_price: tripPhotos[index]["price"],
                );
              });
        });
  }
}

// ignore: camel_case_types
class Single_cart_product extends StatelessWidget {
  final cart_prod_id;
  final cart_prod_name;

  final cart_prod_picture;

  final cart_prod_price;

  final cart_prod_qty;

  Single_cart_product({
    this.cart_prod_id,
    this.cart_prod_name,
    this.cart_prod_picture,
    // ignore: non_constant_identifier_names
    this.cart_prod_price,
    // ignore: non_constant_identifier_names

    // ignore: non_constant_identifier_names
    this.cart_prod_qty,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: ListTile(
          // ignore: unnecessary_new
          leading: new Image.asset(
            cart_prod_picture,
            width: 80.0,
            height: 180.0,
          ),
          // ignore: unnecessary_new
          title: new Text(
            cart_prod_name,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          // ignore: unnecessary_new
          subtitle: new Column(
            children: <Widget>[
              new Container(
                alignment: Alignment.topLeft,
                child: new Text(
                  "\$${cart_prod_price}",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
              ),
            ],
          ),
          // ignore: unnecessary_new
          trailing: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  child: InkWell(
                onTap: () {
                  print("up");
                  FirebaseFirestore.instance
                      .collection('cart')
                      .doc(cart_prod_id)
                      .update({'quantity': FieldValue.increment(1)});
                },
                child: Icon(
                  Icons.arrow_drop_up,
                  size: 21,
                ),
              )),
              Text(
                cart_prod_qty.toString(),
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              Container(
                  child: InkWell(
                onTap: () {
                  print("down");

                  FirebaseFirestore.instance
                      .collection('cart')
                      .doc(cart_prod_id)
                      .update({'quantity': FieldValue.increment(-1)});
                  print(cart_prod_qty - 1);
                  if (cart_prod_qty - 1 < 1) {
                    FirebaseFirestore.instance
                        .collection('cart')
                        .doc(cart_prod_id)
                        .delete();
                  }
                },
                child: Icon(
                  Icons.arrow_drop_down,
                  size: 21,
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> sepetSil() async {
    try {
      await FirebaseFirestore.instance
          .collection('cart')
          .doc(cart_prod_id)
          .update({'quantity': FieldValue.increment(-1)});

      if (cart_prod_qty - 1 < 1) {
        await FirebaseFirestore.instance
            .collection('cart')
            .doc(cart_prod_id)
            .delete();
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
