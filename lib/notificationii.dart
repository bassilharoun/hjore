import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:hjore1/hjore.dart';
import 'package:hjore1/ishaar.dart';
import 'package:hjore1/mosharek.dart';
import 'package:hjore1/post.dart';

// إنشاء كائن لحزمة إشعارات Flutter Local Notifications
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
final StreamController<ReceivedNotification> didReceiveLocalNotificationStream =
StreamController<ReceivedNotification>.broadcast();
class ReceivedNotification {
  ReceivedNotification({
     this.id,
     this.title,
    this.body,
    this.payload,
  });

  final int id;
  final String title;
  final String body;
  final String payload;
}
String selectedNotificationPayload;

/// A notification action which triggers a url launch event
String urlLaunchActionId = 'id_1';

/// A notification action which triggers a App navigation event
String navigationActionId = 'id_3';

/// Defines a iOS/MacOS notification category for text input actions.
String darwinNotificationCategoryText = 'textCategory';

/// Defines a iOS/MacOS notification category for plain actions.
String darwinNotificationCategoryPlain = 'plainCategory';

@pragma('vm:entry-point')
Future<void> notificationTapBackground(NotificationResponse notificationResponse) async {
  // ignore: avoid_print
  debugPrint('my paylod ');
  await Get.to(Post1(notificationResponse.payload,'hhh'));
  print('notification(${notificationResponse.id}) action tapped: '
      '${notificationResponse.actionId} with'
      ' payload: ${notificationResponse.payload}');
  if (notificationResponse.input?.isNotEmpty ?? false) {
    // ignore: avoid_print
    print(
        'notification action tapped with input: ${notificationResponse.input}');
  }
}

final StreamController<String> selectNotificationStream =
StreamController<String>.broadcast();
// دالة لإعداد إعدادات الإشعارات
Future<void> setupNotifications() async {

  const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
  final InitializationSettings initializationSettings = InitializationSettings(android: initializationSettingsAndroid);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
  );


}
void configureSelect(){
  selectNotificationStream.stream.listen((String paylod) async {
    debugPrint('my paylod $paylod');
    await Get.to(ssssddd());
  });
}
// دالة لإظهار إشعار
Future<void> showNotification(String title, String message) async {


  const AndroidNotificationDetails androidPlatformChannelSpecifics =
  AndroidNotificationDetails('your_channel_id', 'your_channel_name',
      importance: Importance.max, priority: Priority.high);
  const NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);
  await flutterLocalNotificationsPlugin.show(

    0,
    title,
    message,
    platformChannelSpecifics,
    payload:    'jj', // استخدم معرف الصفحة هنا
      // يمكنك تحديد بيانات إضافية للاستخدام في المستقبل
  );
}

// عنصر القائمة
class ListItem {
  final String title;
  final String description;

  ListItem(this.title, this.description);
}

// صفحة التطبيق
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<ListItem> items = [];
  bool _notificationsEnabled = false;

  @override
  void initState() {
    super.initState();
    setupNotifications();
  }

  Future<void> _isAndroidPermissionGranted() async {
    if (Platform.isAndroid) {
      final bool granted = await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
          ?.areNotificationsEnabled() ??
          false;

      setState(() {
        _notificationsEnabled = granted;
      });
    }
  }

  Future<void> _requestPermissions() async {
    if (Platform.isIOS || Platform.isMacOS) {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
          MacOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
    } else if (Platform.isAndroid) {
      final AndroidFlutterLocalNotificationsPlugin androidImplementation =
      flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>();

      final bool granted = await androidImplementation?.requestPermission();
      setState(() {
        _notificationsEnabled = granted ?? false;
      });
    }
  }

  void _configureDidReceiveLocalNotificationSubject() {
    didReceiveLocalNotificationStream.stream
        .listen((ReceivedNotification receivedNotification) async {
      await showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title:
              Text('kkkkj'),
          content: Text('sdfsf'),
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () async {
                Navigator.of(context, rootNavigator: true).pop();
                await Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) =>
                        ssssddd(),
                  ),
                );
              },
              child: const Text('Ok'),
            )
          ],
        ),
      );
    });
  }

  void _configureSelectNotificationSubject() {
    selectNotificationStream.stream.listen((String payload) async {
      await Navigator.of(context).push(MaterialPageRoute<void>(
        builder: (BuildContext context) => ssssddd(),
      ));
    });
  }

  void addItem() {
    setState(() {
      // إضافة عنصر جديد إلى القائمة
      items.add(ListItem('عنصر جديد', 'وصف العنصر الجديد'));
      // إظهار إشعار عند إضافة العنصر الجديد
      showNotification('عنصر جديد', 'تمت إضافة عنصر جديد إلى القائمة');
    });
  }
  void navigateToPage(String pageId) {
    // استخدام المعرف لتحديد الصفحة المطلوبة للانتقال إليها
    if (pageId == 'my_page') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyApp()),
      );
    }
  }


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('تطبيق القائمة'),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(items[index].title),
              subtitle: Text(items[index].description),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){showNotification('s','ss');},
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}