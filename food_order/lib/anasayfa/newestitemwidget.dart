import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_order/pages/itemPage.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    //firebase baslangic
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('yemekler').snapshots(),
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

          return GridView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data.docs.length,
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Single_prod(
                    prod_id: tripPhotos[index]['id'],
                    prod_name: tripPhotos[index]['name'],
                    prod_picture: tripPhotos[index]['picture'],
                    prod_price: tripPhotos[index]['price'],
                  ),
                );
              });
        });
  }
}

class Single_prod extends StatelessWidget {
  final String prod_id;
  final String prod_name;
  final String prod_picture;
  final num prod_price;

  Single_prod({
    required this.prod_id,
    required this.prod_name,
    required this.prod_picture,
    required this.prod_price,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: prod_id,
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (context) => new itemPage(
                      product_id: prod_id,
                      product_detail_name: prod_name,
                      product_detail_price: prod_price,
                      product_detail_picture: prod_picture,
                    ))),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridTile(
                  footer: Container(
                      color: Colors.white70,
                      child: new Row(
                        children: <Widget>[
                          Expanded(
                            child: new Text(
                              prod_name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16.0),
                            ),
                          ),
                          new Text(
                            "\$${prod_price}",
                            style: TextStyle(color: Colors.red),
                          )
                        ],
                      )),
                  child: Image.asset(
                    prod_picture,
                    //fit: BoxFit.cover,
                  )),
            ),
          ),
        ));
  }
}
