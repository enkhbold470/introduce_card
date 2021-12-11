

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pages/home_page.dart';
import 'package:http/http.dart' as http;
var json;


void publishMqtt() async{

  var request = http.Request('GET', Uri.parse('https://api.thingspeak.com/channels/1535706/feeds.json?api_key=TR2X177RLXKZVLL9&results=2'));


  http.StreamedResponse response = await request.send();
  var data = await response.stream.bytesToString();

  if (response.statusCode == 200) {
    json = jsonDecode(data)["feeds"][0]["field1"];
    print("response : $json");

  }
  else {
    print(response.reasonPhrase);
  }

}

void get() async{

  var request = http.Request('GET', Uri.parse('https://api.thingspeak.com/channels/1535706/feeds.json?api_key=TR2X177RLXKZVLL9&results=2'));


  http.StreamedResponse response = await request.send();
  var data = await response.stream.bytesToString();

  if (response.statusCode == 200) {
    json = jsonDecode(data)["feeds"][0]["field1"];
    print("response : $json");

  }
  else {
    print(response.reasonPhrase);
  }

}
void zeroGet() async {

  var request = http.Request('GET', Uri.parse('https://api.thingspeak.com/update?api_key=KHL4JZO6K2CZXA15&field1=0'));

  http.StreamedResponse response = await request.send();
  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  }
  else {
    print(response.reasonPhrase);
  }

}
void oneGet() async {

  var request = http.Request('GET', Uri.parse('https://api.thingspeak.com/update?api_key=KHL4JZO6K2CZXA15&field1=1'));

  http.StreamedResponse response = await request.send();


  if (response.statusCode == 200) {

    print(await response.stream.bytesToString());

  }
  else {
    print(response.reasonPhrase);
  }


}

void main() {
    runApp(
        MyApp()
    );
}


class MyApp extends StatelessWidget {


  @override


  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      //title: 'Гэрийн',
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Montserrat',
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: MyHomePage(),

    );
  }
}
