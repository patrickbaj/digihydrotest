import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Notif {
  static Future initialize(FlutterLocalNotificationsPlugin localNotif) async {
    var androidInitialize =
        new AndroidInitializationSettings('mipmap/launcher_icon');
    //var iOSInitialize = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
      android: androidInitialize, /*iOS: IOSInitialize*/
    );
    await localNotif.initialize(initializationSettings);
  }

  static Future showNotif(
      {var id = 0,
      required String title,
      required String body,
      var payload,
      required FlutterLocalNotificationsPlugin fln}) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        new AndroidNotificationDetails(
      'DigiHydro',
      'channel_name',
      playSound: true,
      sound: RawResourceAndroidNotificationSound('dhnotif'),
      importance: Importance.max,
      priority: Priority.high,
    );

    var not = NotificationDetails(
      android:
          androidPlatformChannelSpecifics, /*iOS: IOSNotificationDetails()*/
    );
    await fln.show(0, title, body, not);
  }
}
