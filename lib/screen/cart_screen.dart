import 'package:cake_shop/model/cake.dart';
import 'package:cake_shop/model/cart.dart';
import 'package:cake_shop/screen/checkout_screen.dart';
import 'package:cake_shop/util/widget.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();

}

class _CartScreenState extends State<CartScreen> {
  bool isFbCheckoutVisible = false;

  @override
  Widget build(BuildContext context) {
    if (cartList.length > 0) {
      isFbCheckoutVisible = true;
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.pink[200],
        leading: IconButton(
          icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text('Cart',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)
        ),
      ),
      floatingActionButton: Visibility(
        visible: isFbCheckoutVisible,
        child: Container(
          padding: EdgeInsets.only(left: 16),
          margin: EdgeInsets.only(left: 16),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return CheckoutScreen();
              }));
            },
            style: ElevatedButton.styleFrom(
                primary: Colors.pink[300]),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Checkout'), Icon(Icons.arrow_forward_ios)],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.pink[50],
          child: cartList.length > 0
              ? Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: ListView.builder(
              itemBuilder: (context, index) {
                var cake = findCake(cartList[index]);
                return Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10)),
                          child: Container(
                            child: Image.asset(cake.cakeImage),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(cake.cakeBackground),
                                  fit: BoxFit.cover),),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cake.cakeName,
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Text(rupiahCurrencyFormat
                                  .format(cake.cakePrice))
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                            onPressed: () {
                              deleteItemCart(cake.cakeId);
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Colors.grey,
                            )),
                      )
                    ],
                  ),
                );
              },
              itemCount: cartList.length,
            ),
          )
              : Center(child: Text('Empty cart, please add some item')),
        ),
      ),
    );
  }

  Cake findCake(Cart cartItem) {
    return cakeList.firstWhere((cake) => cake.cakeId == cartItem.cakeId);
  }

  deleteItemCart(int cakeId) {
    setState(() {
      cartList.removeWhere((cartItem) => cartItem.cakeId == cakeId);
      if (cartList.length == 0) {}
    });
  }
}
