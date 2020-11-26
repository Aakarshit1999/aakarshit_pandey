import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get_it/get_it.dart';
void main() {
  setupLocator();
  runApp(MyApp());
}
_launchURL() async {
  const url = 'https://github.com/Aakarshit1999/Aakarshit-Pandey';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
_launchURL2() async {
  const url = 'https://www.linkedin.com/in/aakarshit-pandey-19901817b/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
GetIt locator = GetIt.asNewInstance();
void setupLocator() {
  locator.registerSingleton(CallsAndMessagesService());
}
class CallsAndMessagesService {
  void call(String number) => launch("tel:$number");
  void sendSms(String number) => launch("sms:$number");
  void sendEmail(String email) => launch("mailto:$email");
}

class MyApp extends StatelessWidget {
  final CallsAndMessagesService _service = locator<CallsAndMessagesService>();

  final String number = "9870539134";
  final String email = "aakarshit6143@gmail.com";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('images/gold-skull-dark-background-4k-l4-1360x768.jpg'),
                ),
                Text(
                  'Aakarshit',
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 40.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'FLUTTER DEVELOPER',
                  style: TextStyle(
                    fontFamily: 'Source Sans Pro',
                    color: Colors.teal.shade100,
                    fontSize: 20.0,
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                  width: 150.0,
                  child: Divider(
                    color: Colors.teal.shade100,
                  ),
                ),
                FlatButton(
                  onPressed: () => _service.call(number),
                  child: Card(
                      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                      child: ListTile(
                        leading: Icon(
                          Icons.phone,
                          color: Colors.teal,
                        ),
                        title: Text(
                          '+91 9870539134',
                          style: TextStyle(
                            color: Colors.teal.shade900,
                            fontFamily: 'Source Sans Pro',
                            fontSize: 20.0,
                          ),
                        ),
                      )),
                ),
                FlatButton(
                  onPressed: () => _service.sendEmail(email),
                  child: Card(
                      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                      child: ListTile(
                        leading: Icon(
                          Icons.email,
                          color: Colors.teal,
                        ),
                        title: Text(
                          'aakarshit6143@gmail.com',
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.teal.shade900,
                              fontFamily: 'Source Sans Pro'),
                        ),
                      )),
                ),
                FlatButton(
                  onPressed: () => _launchURL(),
                  child: Card(
                      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                      child: ListTile(
                        leading: Icon(
                          Icons.account_box,
                          color: Colors.teal,
                        ),
                        title: Text(
                          'GITHUB',
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.teal.shade900,
                              fontFamily: 'Source Sans Pro'),
                        ),
                      )),
                ),
                FlatButton(
                  onPressed: () => _launchURL2(),
                  child: Card(
                      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                      child: ListTile(
                        leading: Icon(
                          Icons.link,
                          color: Colors.teal,
                        ),
                        title: Text(
                          'LinkedIN',
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.teal.shade900,
                              fontFamily: 'Source Sans Pro'),
                        ),
                      )),
                )
              ],
            )),
      ),
    );
  }
}


