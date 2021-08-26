import 'package:cake_shop/model/cake.dart';
import 'package:cake_shop/screen/cart_screen.dart';
import 'package:cake_shop/screen/detail_screen.dart';
import 'package:cake_shop/screen/info_screen.dart';
import 'package:cake_shop/util/widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[200],
        elevation: 0,
        title: Text('Cake Shop',
            style: TextStyle(
                fontSize: 24,
                fontWeight:
                FontWeight.bold,
                color: Colors.white)),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CartScreen();
                }));
              },
              icon: Icon(Icons.shopping_cart_outlined, color: Colors.white,)
          ),
          IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return InfoScreen();
                }));
              },
              icon: Icon(Icons.storefront, color: Colors.white,)
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(left: 10, top: 20),
        child: Material(
          color: Colors.transparent,
          child: Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              children: cakeList.map((cake) {
                return InkWell(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return DetailScreen(cakes: cake);
                        }));
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              padding: EdgeInsets.all(2),
                              child: Image.asset(cake.cakeImage, width: 300, height: 130,),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(cake.cakeBackground),
                                      fit: BoxFit.cover),),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 4, left: 4),
                          child: Text(
                              cake.cakeName,
                              style: TextStyle(
                                  fontSize: 16)
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 4, left: 4),
                          child: Text(
                              rupiahCurrencyFormat.format(cake.cakePrice),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
