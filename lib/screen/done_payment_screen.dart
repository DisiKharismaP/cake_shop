import 'package:cake_shop/screen/home_screen.dart';
import 'package:flutter/material.dart';

class DonePaymentScreen extends StatelessWidget {
  const DonePaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.pink[200],
        centerTitle: true,
        title: Text(
          'Done Payment',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.pink[50],
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 100.0, horizontal: 30.0),
                  child: Column(
                    children: [
                      Image.asset("assets/images/cake.gif", width: 300.0, height: 300.0),
                      SizedBox(height: 20),
                      Text('Thank You for Purchasing Our Imaginary Cakes <3',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.pink[300])
                      ),
                      SizedBox(height: 50),
                      ElevatedButton(
                          onPressed: (){
                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                HomeScreen()), (Route<dynamic> route) => false);
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 5,
                            primary: Colors.pink[200],
                            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(15.0),
                            ),
                          ),
                          child: Text(
                            'Back to Home',
                            style: TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
