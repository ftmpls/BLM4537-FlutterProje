import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../components/appbarwidget.dart';
import '../components/itembuttomnavbar.dart';
import '../anasayfa/newestitemwidget.dart';
import 'cartpage.dart';

class itemPage extends StatefulWidget {
  final String product_id;
  final String product_detail_name;
  final num product_detail_price;
  final String product_detail_picture;

  const itemPage(
      {Key? key,
      required this.product_id,
      required this.product_detail_name,
      required this.product_detail_price,
      required this.product_detail_picture})
      : super(key: key);

  @override
  State<itemPage> createState() => _itemPageState();
}

class _itemPageState extends State<itemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView(
          children: [
            AppBarWidget(),
            Padding(
                padding: EdgeInsets.all(16),
                child: Image.asset(
                  widget.product_detail_picture,
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RatingBar.builder(
                          initialRating: 4,
                          minRating: 1,
                          itemCount: 5,
                          itemSize: 18,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.red,
                          ),
                          direction: Axis.horizontal,
                          onRatingUpdate: (index) {},
                        ),
                        Text(
                          "\$${widget.product_detail_price}",
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.product_detail_name,
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        // Container(
                        //   width: 90,
                        //   padding: EdgeInsets.all(5),
                        //   decoration: BoxDecoration(
                        //       color: Colors.red,
                        //       borderRadius: BorderRadius.circular(8)),
                        // child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       Icon(
                        //         CupertinoIcons.minus,
                        //         color: Colors.white,
                        //       ),
                        //       Text(
                        //         "2",
                        //         style: TextStyle(
                        //             color: Colors.white,
                        //             fontSize: 18,
                        //             fontWeight: FontWeight.bold),
                        //       ),
                        //       Icon(
                        //         CupertinoIcons.plus,
                        //         color: Colors.white,
                        //       ),
                        //     ]),
                        // )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Taste our pizza at low pizza ,this is famous pizza in italia,Taste our pizza at low pizza ,this is famous pizza in italia",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Delivery Time",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Icon(
                                CupertinoIcons.clock,
                                color: Colors.red,
                              ),
                            ),
                            Text(
                              "30 minutes",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35)),
                          child: MaterialButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Cart()));
                              },
                              color: Colors.red,
                              textColor: Colors.white,
                              elevation: 0.2,
                              child: new Text("Buy now ")),
                        ),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.add_shopping_cart,
                            color: Colors.red,
                          ),
                          onPressed: () => sepeteEkle(widget.product_id)),
                      IconButton(
                          icon: Icon(Icons.favorite_border),
                          color: Colors.red,
                          onPressed: () {}),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      //bottomNavigationBar: ItemBottomNavbar(),
    );
  }

  Future<void> sepeteEkle(String id) async {
    try {
      final QuerySnapshot varmiKontrol = await FirebaseFirestore.instance
          .collection('cart')
          .where('prod_id', isEqualTo: id)
          .get();
      if (varmiKontrol.docs.isNotEmpty) {
        if (varmiKontrol.docs[0]['prod_id'] == id) {
          print('bu veri zaten var!');
          await FirebaseFirestore.instance
              .collection('cart')
              .doc(varmiKontrol.docs[0]['id'])
              .update({'quantity': FieldValue.increment(1)});
        }
      } else {
        print(id);
        var key =
            FirebaseFirestore.instance.collection('cart').doc().id.toString();
        print(key);

        await FirebaseFirestore.instance.collection('cart').doc(key).set({
          'id': key,
          'prod_id': widget.product_id,
          'name': widget.product_detail_name,
          'picture': widget.product_detail_picture,
          'price': widget.product_detail_price,
          'quantity': 1,
        });
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
