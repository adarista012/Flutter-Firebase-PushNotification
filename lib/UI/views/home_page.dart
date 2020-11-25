import 'package:PushNotifications/UI/views/widgets/custom_app_bar.dart';
import 'package:PushNotifications/global.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        height: 200,
        child: Text(
          'home',
          style: textBrownMidle.copyWith(fontSize: 20),
        ),
      ),
      body: Center(
        child: Text('hola mundo', style: textBrownMidle),
      ),
    );
  }
}
