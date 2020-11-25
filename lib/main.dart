import 'UI/views/home_page.dart';

import 'package:PushNotifications/provider/push_notifiations_provider.dart';
import 'package:flutter/material.dart';

import 'UI/views/message_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();
  @override
  void initState() {
    super.initState();

    final pushprovider = new PushNotificationsProvider();
    pushprovider.initNotifications();

    pushprovider.messages.listen(
      (args) {
        //Navigator.pushNamed(context, MaterialPageRoute());
        print('argumento del push');
        print(args);
        navigatorKey.currentState.pushNamed('message', arguments: args);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        scaffoldBackgroundColor: Colors.white,
        backgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomePage(),
        'message': (BuildContext context) => MessagePage(),
      },
    );
  }
}
/*
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /*
  final _firebaseMessaging = FirebaseMessaging();
  String _message = 'Generating Message...';
  String _token = 'Generating Token...';

  void initState() {
    super.initState();
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print(",,");
        final snack = SnackBar(
          content: Text(message.toString()),
          action: SnackBarAction(
            label: "ok",
            onPressed: () => null,
          ),
        );
        Scaffold.of(context).showSnackBar(snack);
        setState(() {
          _message = '$message';
          final snack = SnackBar(
            content: Text(_message),
            action: SnackBarAction(
              label: "ok",
              onPressed: () => null,
            ),
          );
          Scaffold.of(context).showSnackBar(snack);
        });
      },
      onLaunch: (Map<String, dynamic> message) async {
        setState(() {
          _message = '$message';
          AlertDialog(
            content: Text(_message),
          );
        });
      },
      onResume: (Map<String, dynamic> message) async {
        setState(() {
          _message = '$message';
          AlertDialog(
            content: Text(_message),
          );
        });
      },
    );

    _firebaseMessaging.getToken().then((String token) {
      assert(token != null);
      setState(() {
        _token = '$token';
        print(_token);
      });
    });
  }
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'push notifications',
          style: textBrownMidle,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("sdg"),
            Divider(),
            Text(
              pushprovider.toString(),
              style: textBrownMidle,
            )
          ],
        ),
      ),
    );
  }
}
*/
