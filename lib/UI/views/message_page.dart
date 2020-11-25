import 'package:PushNotifications/UI/views/widgets/custom_app_bar.dart';
import 'package:PushNotifications/global.dart';
import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: CustomAppBar(
        height: 200,
        child: Text(
          'Page Message',
          style: textBrownMidle.copyWith(fontSize: 20),
        ),
      ),
      body: Center(
        child: Text(args, style: textBrownMidle),
      ),
    );
  }
}
