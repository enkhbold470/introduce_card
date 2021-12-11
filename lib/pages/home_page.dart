
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';


import '../main.dart';


class MyHomePage extends StatefulWidget {
  @override

  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  //get mainAxisAlignment => null;

  @override
  Widget build(BuildContext context) {



    // print("strJson = $strJson");
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 70,

        actions: <Widget>[
          Container(
            child: IconButton(
              icon: const Icon(Icons.info),
              tooltip: 'Info',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InfoRoute()),
                );
              },
            ),
          ),
        ],

        //backgroundColor: Theme.of(context).canvasColor,
        title: Text(
          'Гэрийн автоматжуулалт',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            fontFamily: 'Hero',
            color: Colors.white,
            // color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
      ),
      backgroundColor: Theme
          .of(context)
          .canvasColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightGreen,
                  fixedSize: Size(300, 90),
                ),
                child: Text(
                  'Гэрэл асаах',
                  style: TextStyle(
                    fontFamily: 'Hero',
                    fontSize: 30,
                  ),
                ),
                onPressed: ()  {
                  //get();
                  //oneGet();
                  print("On Pressed");
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  fixedSize: Size(300, 90),
                ),
                child: Text(
                  'Гэрэл унтраах',
                  style: TextStyle(
                    fontFamily: 'Hero',
                    fontSize: 30,
                  ),
                ),
                onPressed: () {

                    //get();
                    //zeroGet();
                    print("Off Pressed");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Хөгжүүлэгчтэй холбогдох"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Icons.align_vertical_center

            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/images/enkhy.png'),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Enkhbold Ganbold',
              style: TextStyle(
                fontFamily: 'Hero',
                fontSize: 40,
                //color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Embedded system engineer',
              style: TextStyle(
                fontFamily: 'Hero',
                fontSize: 15,
                //color: Colors.black38,
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
              width: 250,
              child: Divider(
                //color: Colors.black38,
                thickness: 1,
              ),
            ),
            TextButton(
              onPressed: () {
                print("Phone number Pressed");
              },
              child: Card(
                //phone number card
                // color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: ListTile(
                  contentPadding: EdgeInsets.all(10.0),
                  leading: Icon(
                    Icons.phone,
                    size: 50,
                    color: Colors.green,
                  ),
                  title: Text(
                    "+976 8666 2476",
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Hero',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                print("email pressed");
              },
              child: Card(
                //Email card
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: ListTile(
                  contentPadding: EdgeInsets.all(10.0),
                  leading: Icon(
                    Icons.email,
                    size: 50,
                    color: Colors.green,
                  ),
                  title: Text(
                    'enkhbold@ttfrobotics.com',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Hero',
                      //color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                print("Instagram link pressed");
                //  _launchURL;
              },
              child: Card(
                //Instagram card

                shadowColor: Colors.green,
                // margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: ListTile(
                  contentPadding: EdgeInsets.all(10.0),
                  leading: Icon(
                    Icons.center_focus_weak,
                    size: 50,
                    color: Colors.green,
                  ),
                  title: Text(
                    'IG: @en.khy',
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Hero',
                      //color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
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
// connection succeeded
void onConnected() {
  print('Connected');
}

// unconnected
void onDisconnected() {
  print('Disconnected');
}

// subscribe to topic succeeded
void onSubscribed(String topic) {
  print('Subscribed topic: $topic');
}

// subscribe to topic failed
void onSubscribeFail(String topic) {
  print('Failed to subscribe $topic');
}

// unsubscribe succeeded
void onUnsubscribed(String topic) {
  print('Unsubscribed topic: $topic');
}


// PING response received
void pong() {
  print('Ping response client callback invoked');
}

Future<MqttServerClient> connect() async {
  MqttServerClient client = MqttServerClient.withPort('oef4d1a4.ap-southeast-1.emqx.cloud', '12345', 15799);
  client.logging(on: true);
  client.onConnected = onConnected;
  client.onDisconnected = onDisconnected;
  client.onUnsubscribed = onUnsubscribed;
  client.onSubscribed = onSubscribed;
  client.onSubscribeFail = onSubscribeFail;
  client.pongCallback = pong;
  client.subscribe("esp/test", MqttQos.atLeastOnce);

  final connMessage = MqttConnectMessage()
      .authenticateAs('enkhy', 'enkhy')
      .keepAliveFor(60)
      .withWillTopic('esp/test')
      .withWillMessage('Will message')
      .startClean()
      .withWillQos(MqttQos.atLeastOnce);
  client.connectionMessage = connMessage;
  try {
    await client.connect();
  } catch (e) {
    print('Exception: $e');
    client.disconnect();
  }

  const pubTopic = 'esp/test';
  final builder = MqttClientPayloadBuilder();
  builder.addString('Hello MQTT');
  client.publishMessage(pubTopic, MqttQos.atLeastOnce, builder.payload);


  return client;
}
