import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp() : super();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal.shade300,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Icons.align_vertical_center

              CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('images/enkhy.jpeg'),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '科技大学的学生张伟',
                style: TextStyle(
                  fontFamily: 'LongCang',
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '电子科技工程',
                style: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  fontSize: 30,
                  color: Colors.teal.shade100,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
                width: 250,
                child: Divider(
                  color: Colors.teal.shade100,
                  thickness: 2,
                ),
              ),
              Card(
                // color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: ListTile(
                  contentPadding: EdgeInsets.all(10.0),
                  leading: Icon(
                    Icons.phone,
                    size: 50,
                    color: Colors.teal,
                  ),
                  title: Text(
                    "+976 8666 xxxx",
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Source Sans Pro',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: ListTile(
                  contentPadding: EdgeInsets.all(10.0),
                  leading: Icon(
                    Icons.email,
                    size: 50,
                    color: Colors.teal,
                  ),
                  title: Text(
                    'en163902@icloud.com',
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Source Sans Pro',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
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
