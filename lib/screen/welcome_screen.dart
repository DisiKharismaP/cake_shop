import 'package:cake_shop/screen/home_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: 200),
        color: Color.fromARGB(255, 248, 227, 236),
        child: Column(
          children: [
            Image.asset(
              "assets/images/giflogocake.gif",
              fit: BoxFit.cover,
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                    return HomeScreen();
                  }));
                },
                style: ElevatedButton.styleFrom(
                  elevation: 5,
                  primary: Colors.pink[200],
                  padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(15.0),
                  ),
                ),
                child: Text(
                  'Enter Shop',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
            ),
            SizedBox(height: 20.0)
          ],
        ),
      ),
    );
  }
}
