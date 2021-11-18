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
      body: Container(
        width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Color.fromARGB(255, 248, 227, 236),
        padding: EdgeInsets.only(bottom: 20.0),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             SingleChildScrollView(
               child: Column(
                  children: [
                    SizedBox(height: 20.0),
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
                  ],
                ),
             )
            ],
          ),
        ),
      ),
    );
  }
}
