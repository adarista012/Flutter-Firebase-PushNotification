import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsProvider {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final _messagesStreamController = StreamController<String>.broadcast();
  Stream<String> get messages => _messagesStreamController.stream;

  initNotifications() {
    _firebaseMessaging.requestNotificationPermissions();
    _firebaseMessaging.getToken().then(
      (token) {
        print("====== FCM Token ======");
        print(token);

        //eB7pF-WoSsmnvHCvE4QEdL:APA91bG_bm_D9Y45bg4_E2VfEEXFPy05HwsQHKOCGhvIrsMBv0DgXF0rRZMOlxRCiBoUvll9DQpEPLlMPmia9A83R9WgaYjg22rsRdonN8a2STUeXLfrrBShigdBp8M6lcPgqFCfNe5y
      },
    );
    _firebaseMessaging.configure(
      onMessage: (data) async {
        print('====== On Message =====');
        print(data);

        var args = 'no-data';
        if (Platform.isAndroid) {
          args = data['data']["lastName"] ?? 'no-data';
        }
        _messagesStreamController.sink.add(args);
      },
      onLaunch: (data) async {
        print('===== On Launch =====');
        print(data);
      },
      onResume: (data) async {
        print('===== On Resume =====');
        print(data);

        final arg = data['data']["name"];
        //print(arg.toString());

        _messagesStreamController.sink.add(arg);
      },
    );
  }

  dispose() {
    _messagesStreamController?.close();
  }
}
