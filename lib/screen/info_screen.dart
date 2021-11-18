import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);

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
          'Info',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color.fromARGB(255, 248, 227, 236),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 50.0),
                  child: Column(
                    children: [
                      Text('Cake Shop',
                          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.pink[300])
                      ),
                      Image.asset("assets/images/payment.gif", width: 300.0, height: 300.0),
                      SizedBox(height: 10),
                      Text('Location : Wonderland'),
                      SizedBox(height: 5),
                      Text('Since : 2005'),
                      SizedBox(height: 5),
                      Text('Founder : DC.K.P'),
                      SizedBox(height: 30),
                      Text('Slogan',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.pink[300])
                      ),
                      SizedBox(height: 10),
                      Text('"Our Cakes come from Wonderland so We Neverland!"'),
                      SizedBox(height: 30),
                      Text('Credit',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.pink[300])
                      ),
                      SizedBox(height: 10),
                      Text('Bakery Corperated'),
                      SizedBox(height: 5),
                      Text('RED Company'),
                      SizedBox(height: 5),
                      Text('Eggso Entertainment'),
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
