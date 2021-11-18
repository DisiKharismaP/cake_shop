import 'package:cake_shop/screen/done_payment_screen.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.pink[200],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          'Payment',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color.fromARGB(255, 248, 227, 236),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 20.0, right: 20, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(child: Image.asset("assets/images/payment.gif")),
                      Text('Full Name', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.pink[300])),
                      SizedBox(height: 10),
                      TextField(
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            hintText: 'Type here..',
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(),
                            isDense: true),
                      ),
                      SizedBox(height: 20),
                      Text('Phone Number', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.pink[300])),
                      SizedBox(height: 10),
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: 'Type here..',
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(),
                            isDense: true),
                      ),
                      SizedBox(height: 20),
                      Text('Email Address', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.pink[300])),
                      SizedBox(height: 10),
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: 'Type here..',
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(),
                            isDense: true),
                      ),
                      SizedBox(height: 20),
                      Text('Home Address', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.pink[300])),
                      SizedBox(height: 10),
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: 'Type here..',
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(),
                            isDense: true),
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.pink[200],
                                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 55),
                                elevation: 5,
                              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0),
                            ),),

                            onPressed: () {
                              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                  DonePaymentScreen()), (Route<dynamic> route) => false);
                            },
                            child: Text(
                              'Done',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            )),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
