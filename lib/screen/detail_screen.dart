import 'package:cake_shop/model/cake.dart';
import 'package:cake_shop/model/cart.dart';
import 'package:cake_shop/screen/cart_screen.dart';
import 'package:cake_shop/screen/checkout_screen.dart';
import 'package:cake_shop/util/badge.dart';
import 'package:cake_shop/util/widget.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class DetailScreen extends StatefulWidget {
  final Cake cakes;

  const DetailScreen({required this.cakes});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 25),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.cakes.cakeBackground),
                        fit: BoxFit.cover),),
                  child: Image.asset(
                    widget.cakes.cakeImage,
                    width: double.infinity,
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                            onPressed: () {
                              Navigator.pop(context);}
                        ),
                        Stack(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context){
                                    return CartScreen();
                                  })).then((value) => setState((){}));
                                },
                                icon: Icon(Icons.shopping_cart_outlined,
                                    color: Colors.black)
                            ),
                            cartList.length > 0
                                ? Badge(numberValue: (cartList.length).toString())
                                : Container()
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              transform: Matrix4.translationValues(0.0, -15.0, 0.0),
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.cakes.cakeName,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 24),
                              ),
                            ],
                          ),
                          Text(rupiahCurrencyFormat.format(widget.cakes.cakePrice),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16)
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text('Description'),
                      SizedBox(height: 8),
                      Text(
                        widget.cakes.cakeDescription,
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ElevatedButton(
                                onPressed: (){
                                  addToCart(widget.cakes.cakeId, context);
                                },
                                style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.all(14.0),
                                    primary: Color.fromARGB(0, 255, 255, 255)),
                                child: Icon(Icons.add_shopping_cart_outlined)
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(left: 15),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.pink[200],
                                      padding: EdgeInsets.all(16.0)),
                                  onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return CheckoutScreen();
                                    }));
                                  },
                                  child: Text(
                                      'Buy Now',
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ));
  }

  void addToCart(cakeId, context) {
    bool isItemExist = false;
    if (cartList.firstWhereOrNull((cartItem) => cartItem.cakeId == cakeId) != null) {
      isItemExist = true;
    }
    if (isItemExist) {
      final snackBar = SnackBar(content: Text('Item already in cart !'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      setState(() {
        cartList.add(Cart(cakeId: cakeId));
      });
      final snackBar = SnackBar(content: Text('Item added to cart !'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
