import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_background/flutter_background.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:hjore1/categiories.dart';
import 'package:hjore1/fav.dart';
import 'package:hjore1/ishaar.dart';
import 'package:hjore1/mosharek.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

import 'notificationii.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';


final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();
Future<void> configureSelect() async {
  debugPrint('my paylod ');
  await Get.to(MyScreen1());
}

Future<void> initializeNotifications() async {
   const AndroidInitializationSettings initializationSettingsAndroid =
  AndroidInitializationSettings('@mipmap/ic_launcher');
  final DarwinInitializationSettings initializationSettingsDarwin =
  DarwinInitializationSettings(
    requestAlertPermission: false,
    requestBadgePermission: false,
    requestSoundPermission: false,
    onDidReceiveLocalNotification:
        (int id, String title, String body, String payload) async {
      didReceiveLocalNotificationStream.add(
        ReceivedNotification(
          id: id,
          title: title,
          body: body,
          payload: payload,
        ),
      );
    },
  );

  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsDarwin,
  );





  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse:
        notificationTapBackground,
    onDidReceiveBackgroundNotificationResponse:
        notificationTapBackground,
  );
}
class MyScreen2 extends StatefulWidget {
  @override
  State<MyScreen2> createState() => _MyScreen2State();
}

class _MyScreen2State extends State<MyScreen2> {
  final String phoneNumber = '+123456789';
 // رقم الهاتف المطلوب
  void openWhatsApp() async {
    String url = 'https://wa.me/$phoneNumber';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  int previousItemCount = 0;
  i() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    print (await load1() );
  }

  static final String oneSignalAppId = "530f1a81-4db2-4fff-bb29-b7e6bbe39438";
  Future<void> initPlatformState()async{
    OneSignal.initialize(oneSignalAppId);

  }

  Timer timer;
  @override
  void initState() {
    super.initState();
    initPlatformState();
    i();
    startTimer();



      // استدعاء دالة للتحقق من زيادة عدد العناصر
  }
  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 5), (timer) async {

     if(await load1()==true)
     {
        fetchDataAndCompareItemCount1();
      }
     if(await load2()==true)
     {
       fetchDataAndCompareItemCount2();
     }if(await load3()==true)
     {
       fetchDataAndCompareItemCount3();
     }if(await load4()==true)
     {
       fetchDataAndCompareItemCount4();
     }if(await load5()==true)
     {
       fetchDataAndCompareItemCount5();
     }if(await load6()==true)
     {
       fetchDataAndCompareItemCount6();
     }if(await load7()==true)
     {
       fetchDataAndCompareItemCount7();
     }if(await load8()==true)
     {
       fetchDataAndCompareItemCount8();
     }if(await load9()==true)
     {
       fetchDataAndCompareItemCount9();
     }if(await load10()==true)
     {
       fetchDataAndCompareItemCount10();
     }if(await load11()==true)
     {
       fetchDataAndCompareItemCount11();
     }if(await load12()==true)
     {
       fetchDataAndCompareItemCount12();
     }if(await load13()==true)
     {
       fetchDataAndCompareItemCount13();
     }if(await load14()==true)
     {
       fetchDataAndCompareItemCount14();
     }if(await load15()==true)
     {
       fetchDataAndCompareItemCount15();
     }if(await load16()==true)
     {
       fetchDataAndCompareItemCount16();
     }if(await load17()==true)
     {
       fetchDataAndCompareItemCount17();
     }if(await load18()==true)
     {
       fetchDataAndCompareItemCount18();
     }if(await load19()==true)
     {
       fetchDataAndCompareItemCount19();
     }

    });
  }

Future<bool> load1() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.getBool('buttonState_0') ?? false;
}
  Future<bool> load2() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool button =    prefs.getBool('buttonState_1') ?? false;
    return button;

  }
  Future<bool> load3() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool('buttonState_2') ?? false;
  }
  Future<bool> load4() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool('buttonState_3') ?? false;
  }
  Future<bool> load5() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool('buttonState_4') ?? false;
  }
  Future<bool> load6() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool('buttonState_5') ?? false;
  }
  Future<bool> load7() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool('buttonState_6') ?? false;
  }
  Future<bool> load8() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool('buttonState_7') ?? false;
  }
  Future<bool> load9() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool('buttonState_8') ?? false;
  }
  Future<bool> load10() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool('buttonState_9') ?? false;
  }
  Future<bool> load11() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool('buttonState_10') ?? false;
  }
  Future<bool> load12() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool('buttonState_11') ?? false;
  }
  Future<bool> load13() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool('buttonState_12') ?? false;
  }
  Future<bool> load14() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool('buttonState_13') ?? false;
  }
  Future<bool> load15() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool('buttonState_14') ?? false;
  }
  Future<bool> load16() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool('buttonState_15') ?? false;
  }
  Future<bool> load17() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool('buttonState_16') ?? false;
  }
  Future<bool> load18() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool('buttonState_17') ?? false;
  }
  Future<bool> load19() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool('buttonState_18') ?? false;
  }


  Future<void> fetchDataAndCompareItemCount1() async {
    // استبدل `apiUrl` برابط API الخاص بك
    String apiUrl;
   apiUrl = 'https://hjore.com/wp-json/wp/v2/posts?categories=85';
String t;
String v;

    int currentPage = 1;
    bool hasMorePages = true;
    final response1= await http.get(Uri.parse('$apiUrl&&page=$currentPage'));
    final data1 = jsonDecode(response1.body);
    t=data1[0]['title']['rendered'];
    v=data1[0]['custom']['categories'][0]['name'];
    var x = response1.headers['x-wp-total'];
    int totalItems=int.parse(x);




    print(totalItems);

    final prefs = await SharedPreferences.getInstance();
    final storedItemCount = prefs.getInt('item_count1') ?? 0;

    if (totalItems > storedItemCount) {
      sendNotification(v,t,data1[0]['_links']['self'][0]['href']);
      await prefs.setInt('item_count1', totalItems);
    }
    if(totalItems<storedItemCount){
      await prefs.setInt('item_count1', totalItems);
    }
  }
  Future<void> fetchDataAndCompareItemCount2() async {
    // استبدل `apiUrl` برابط API الخاص بك
    String apiUrl;
    apiUrl = 'https://hjore.com/wp-json/wp/v2/posts?categories=87';
    String t;
    String v;

    int currentPage = 1;
    bool hasMorePages = true;
    final response1= await http.get(Uri.parse('$apiUrl&&page=$currentPage'));
    final data1 = jsonDecode(response1.body);
    t=data1[0]['title']['rendered'];
    v=data1[0]['custom']['categories'][0]['name'];
    String api1=data1[0][''];

    var x = response1.headers['x-wp-total'];
    int totalItems=int.parse(x);




    print(totalItems);

    final prefs = await SharedPreferences.getInstance();
    final storedItemCount = prefs.getInt('item_count2') ?? 0;
    if(storedItemCount==0){
      await prefs.setInt('item_count2', totalItems);

    }
    if (totalItems > storedItemCount) {
      sendNotification(v,t,data1[0]['_links']['self'][0]['href']);
      await prefs.setInt('item_count2', totalItems);
    }
    if(totalItems<storedItemCount){
      await prefs.setInt('item_count2', totalItems);
    }
  }
  Future<void> fetchDataAndCompareItemCount3() async {
    // استبدل `apiUrl` برابط API الخاص بك
    String apiUrl;
    apiUrl = 'https://hjore.com/wp-json/wp/v2/posts?categories=86';
    String t;
    String v;
    int currentPage = 1;
    bool hasMorePages = true;
    final response1= await http.get(Uri.parse('$apiUrl&&page=$currentPage'));
    final data1 = jsonDecode(response1.body);
    t=data1[0]['title']['rendered'];
    v=data1[0]['custom']['categories'][0]['name'];
    var x = response1.headers['x-wp-total'];
    int totalItems=int.parse(x);




    print(totalItems);

    final prefs = await SharedPreferences.getInstance();
    final storedItemCount = prefs.getInt('item_count3') ?? 0;
    if(storedItemCount==0){
      await prefs.setInt('item_count3', totalItems);

    }
    if (totalItems > storedItemCount) {
      sendNotification(v,t,data1[0]['_links']['self'][0]['href']);
      await prefs.setInt('item_count3', totalItems);
    }
    if(totalItems<storedItemCount){
      await prefs.setInt('item_count3', totalItems);
    }
  }
  Future<void> fetchDataAndCompareItemCount4() async {
    // استبدل `apiUrl` برابط API الخاص بك
    String apiUrl;
    apiUrl = 'https://hjore.com/wp-json/wp/v2/posts?categories=83';
    String t;
    String v;
    int currentPage = 1;
    bool hasMorePages = true;
    final response1= await http.get(Uri.parse('$apiUrl&&page=$currentPage'));
    final data1 = jsonDecode(response1.body);
    t=data1[0]['title']['rendered'];
    v=data1[0]['custom']['categories'][0]['name'];
    var x = response1.headers['x-wp-total'];
    int totalItems=int.parse(x);




    print(totalItems);

    final prefs = await SharedPreferences.getInstance();
    final storedItemCount = prefs.getInt('item_count4') ?? 0;
    if(storedItemCount==0){
      await prefs.setInt('item_count4', totalItems);

    }
    if (totalItems > storedItemCount) {
      sendNotification(v,t,data1[0]['_links']['self'][0]['href']);
      await prefs.setInt('item_count4', totalItems);
    }
    if(totalItems<storedItemCount){
      await prefs.setInt('item_count4', totalItems);
    }
  }
  Future<void> fetchDataAndCompareItemCount5() async {
    // استبدل `apiUrl` برابط API الخاص بك
    String apiUrl;
    apiUrl = 'https://hjore.com/wp-json/wp/v2/posts?categories=89';
    String t;
    String v;
    int currentPage = 1;
    bool hasMorePages = true;
    final response1= await http.get(Uri.parse('$apiUrl&&page=$currentPage'));
    final data1 = jsonDecode(response1.body);
    t=data1[0]['title']['rendered'];
    v=data1[0]['custom']['categories'][0]['name'];
    var x = response1.headers['x-wp-total'];
    int totalItems=int.parse(x);




    print(totalItems);

    final prefs = await SharedPreferences.getInstance();
    final storedItemCount = prefs.getInt('item_count5') ?? 0;
    if(storedItemCount==0){
      await prefs.setInt('item_count5', totalItems);

    }
    if (totalItems > storedItemCount) {
      sendNotification(v,t,data1[0]['_links']['self'][0]['href']);
      await prefs.setInt('item_count5', totalItems);
    }
    if(totalItems<storedItemCount){
      await prefs.setInt('item_count5', totalItems);
    }
  }
  Future<void> fetchDataAndCompareItemCount6() async {
    // استبدل `apiUrl` برابط API الخاص بك
    String apiUrl;
    apiUrl = 'https://hjore.com/wp-json/wp/v2/posts?categories=84';
    String t;
    String v;
    int currentPage = 1;
    bool hasMorePages = true;
    final response1= await http.get(Uri.parse('$apiUrl&&page=$currentPage'));
    final data1 = jsonDecode(response1.body);
    t=data1[0]['title']['rendered'];
    v=data1[0]['custom']['categories'][0]['name'];
    var x = response1.headers['x-wp-total'];
    int totalItems=int.parse(x);




    print(totalItems);

    final prefs = await SharedPreferences.getInstance();
    final storedItemCount = prefs.getInt('item_count6') ?? 0;
    if(storedItemCount==0){
      await prefs.setInt('item_count6', totalItems);

    }
    if (totalItems > storedItemCount) {
      sendNotification(v,t,data1[0]['_links']['self'][0]['href']);
      await prefs.setInt('item_count6', totalItems);
    }
    if(totalItems<storedItemCount){
      await prefs.setInt('item_count6', totalItems);
    }
  }
  Future<void> fetchDataAndCompareItemCount7() async {
    // استبدل `apiUrl` برابط API الخاص بك
    String apiUrl;
    apiUrl = 'https://hjore.com/wp-json/wp/v2/posts?categories=111';
    String t;
    String v;
    int currentPage = 1;
    bool hasMorePages = true;
    final response1= await http.get(Uri.parse('$apiUrl&&page=$currentPage'));
    final data1 = jsonDecode(response1.body);
    t=data1[0]['title']['rendered'];
    v=data1[0]['custom']['categories'][0]['name'];
    var x = response1.headers['x-wp-total'];
    int totalItems=int.parse(x);




    print(totalItems);

    final prefs = await SharedPreferences.getInstance();
    final storedItemCount = prefs.getInt('item_count7') ?? 0;
    if(storedItemCount==0){
      await prefs.setInt('item_count7', totalItems);

    }
    if (totalItems > storedItemCount) {
      sendNotification(v,t,data1[0]['_links']['self'][0]['href']);
      await prefs.setInt('item_count7', totalItems);
    }
    if(totalItems<storedItemCount){
      await prefs.setInt('item_count7', totalItems);
    }
  }
  Future<void> fetchDataAndCompareItemCount8() async {
    // استبدل `apiUrl` برابط API الخاص بك
    String apiUrl;
    apiUrl = 'https://hjore.com/wp-json/wp/v2/posts?categories=90';
    String t;
    String v;
    int currentPage = 1;
    bool hasMorePages = true;
    final response1= await http.get(Uri.parse('$apiUrl&&page=$currentPage'));
    final data1 = jsonDecode(response1.body);
    t=data1[0]['title']['rendered'];
    v=data1[0]['custom']['categories'][0]['name'];
    var x = response1.headers['x-wp-total'];
    int totalItems=int.parse(x);




    print(totalItems);

    final prefs = await SharedPreferences.getInstance();
    final storedItemCount = prefs.getInt('item_count8') ?? 0;
    if(storedItemCount==0){
      await prefs.setInt('item_count8', totalItems);

    }
    if (totalItems > storedItemCount) {
      sendNotification(v,t,data1[0]['_links']['self'][0]['href']);
      await prefs.setInt('item_count8', totalItems);
    }
    if(totalItems<storedItemCount){
      await prefs.setInt('item_count8', totalItems);
    }
  }
  Future<void> fetchDataAndCompareItemCount9() async {
    // استبدل `apiUrl` برابط API الخاص بك
    String apiUrl;
    apiUrl = 'https://hjore.com/wp-json/wp/v2/posts?categories=109';
    String t;
    String v;
    int currentPage = 1;
    bool hasMorePages = true;
    final response1= await http.get(Uri.parse('$apiUrl&&page=$currentPage'));
    final data1 = jsonDecode(response1.body);
    t=data1[0]['title']['rendered'];
    v=data1[0]['custom']['categories'][0]['name'];
    var x = response1.headers['x-wp-total'];
    int totalItems=int.parse(x);




    print(totalItems);

    final prefs = await SharedPreferences.getInstance();
    final storedItemCount = prefs.getInt('item_count9') ?? 0;
    if(storedItemCount==0){
      await prefs.setInt('item_count9', totalItems);

    }
    if (totalItems > storedItemCount) {
      sendNotification(v,t,data1[0]['_links']['self'][0]['href']);
      await prefs.setInt('item_count9', totalItems);
    }
    if(totalItems<storedItemCount){
      await prefs.setInt('item_count9', totalItems);
    }
  }
  Future<void> fetchDataAndCompareItemCount10() async {
    // استبدل `apiUrl` برابط API الخاص بك
    String apiUrl;
    apiUrl = 'https://hjore.com/wp-json/wp/v2/posts?categories=82';
    String t;
    String v;
    int currentPage = 1;
    bool hasMorePages = true;
    final response1= await http.get(Uri.parse('$apiUrl&&page=$currentPage'));
    final data1 = jsonDecode(response1.body);
    t=data1[0]['title']['rendered'];
    v=data1[0]['custom']['categories'][0]['name'];
    var x = response1.headers['x-wp-total'];
    int totalItems=int.parse(x);




    print(totalItems);

    final prefs = await SharedPreferences.getInstance();
    final storedItemCount = prefs.getInt('item_count10') ?? 0;
    if(storedItemCount==0){
      await prefs.setInt('item_count10', totalItems);

    }
    if (totalItems > storedItemCount) {
      sendNotification(v,t,data1[0]['_links']['self'][0]['href']);
      await prefs.setInt('item_count10', totalItems);
    }
    if(totalItems<storedItemCount){
      await prefs.setInt('item_count10', totalItems);
    }
  }
  Future<void> fetchDataAndCompareItemCount11() async {
    // استبدل `apiUrl` برابط API الخاص بك
    String apiUrl;
    apiUrl = 'https://hjore.com/wp-json/wp/v2/posts?categories=91';
    String t;
    String v;
    int currentPage = 1;
    bool hasMorePages = true;
    final response1= await http.get(Uri.parse('$apiUrl&&page=$currentPage'));
    final data1 = jsonDecode(response1.body);
    t=data1[0]['title']['rendered'];
    v=data1[0]['custom']['categories'][0]['name'];
    var x = response1.headers['x-wp-total'];
    int totalItems=int.parse(x);




    print(totalItems);

    final prefs = await SharedPreferences.getInstance();
    final storedItemCount = prefs.getInt('item_count10') ?? 0;
    if(storedItemCount==0){
      await prefs.setInt('item_count10', totalItems);

    }
    if (totalItems > storedItemCount) {
      sendNotification(v,t,data1[0]['_links']['self'][0]['href']);
      await prefs.setInt('item_count10', totalItems);
    }
    if(totalItems<storedItemCount){
      await prefs.setInt('item_count10', totalItems);
    }
  }
  Future<void> fetchDataAndCompareItemCount12() async {
    // استبدل `apiUrl` برابط API الخاص بك
    String apiUrl;
    apiUrl = 'https://hjore.com/wp-json/wp/v2/posts?categories=88';
    String t;
    String v;
    int currentPage = 1;
    bool hasMorePages = true;
    final response1= await http.get(Uri.parse('$apiUrl&&page=$currentPage'));
    final data1 = jsonDecode(response1.body);
    t=data1[0]['title']['rendered'];
    v=data1[0]['custom']['categories'][0]['name'];
    var x = response1.headers['x-wp-total'];
    int totalItems=int.parse(x);




    print(totalItems);

    final prefs = await SharedPreferences.getInstance();
    final storedItemCount = prefs.getInt('item_count12') ?? 0;
    if(storedItemCount==0){
      await prefs.setInt('item_count12', totalItems);

    }
    if (totalItems > storedItemCount) {
      sendNotification(v,t,data1[0]['_links']['self'][0]['href']);
      await prefs.setInt('item_count12', totalItems);
    }
    if(totalItems<storedItemCount){
      await prefs.setInt('item_count12', totalItems);
    }
  }
  Future<void> fetchDataAndCompareItemCount13() async {
    // استبدل `apiUrl` برابط API الخاص بك
    String apiUrl;
    apiUrl = 'https://hjore.com/wp-json/wp/v2/posts?categories=110';
    String t;
    String v;
    int currentPage = 1;
    bool hasMorePages = true;
    final response1= await http.get(Uri.parse('$apiUrl&&page=$currentPage'));
    final data1 = jsonDecode(response1.body);
    t=data1[0]['title']['rendered'];
    v=data1[0]['custom']['categories'][0]['name'];
    var x = response1.headers['x-wp-total'];
    int totalItems=int.parse(x);




    print(totalItems);

    final prefs = await SharedPreferences.getInstance();
    final storedItemCount = prefs.getInt('item_count13') ?? 0;
    if(storedItemCount==0){
      await prefs.setInt('item_count13', totalItems);

    }
    if (totalItems > storedItemCount) {
      sendNotification(v,t,data1[0]['_links']['self'][0]['href']);
      await prefs.setInt('item_count13', totalItems);
    }
    if(totalItems<storedItemCount){
      await prefs.setInt('item_count13', totalItems);
    }
  }
  Future<void> fetchDataAndCompareItemCount14() async {
    // استبدل `apiUrl` برابط API الخاص بك
    String apiUrl;
    apiUrl = 'https://hjore.com/wp-json/wp/v2/posts?categories=95';
    String t;
    String v;
    int currentPage = 1;
    bool hasMorePages = true;
    final response1= await http.get(Uri.parse('$apiUrl&&page=$currentPage'));
    final data1 = jsonDecode(response1.body);
    t=data1[0]['title']['rendered'];
    v=data1[0]['custom']['categories'][0]['name'];
    var x = response1.headers['x-wp-total'];
    int totalItems=int.parse(x);




    print(totalItems);

    final prefs = await SharedPreferences.getInstance();
    final storedItemCount = prefs.getInt('item_count14') ?? 0;
    if(storedItemCount==0){
      await prefs.setInt('item_count14', totalItems);

    }
    if (totalItems > storedItemCount) {
      sendNotification(v,t,data1[0]['_links']['self'][0]['href']);
      await prefs.setInt('item_count14', totalItems);
    }
    if(totalItems<storedItemCount){
      await prefs.setInt('item_count14', totalItems);
    }
  }
  Future<void> fetchDataAndCompareItemCount15() async {
    // استبدل `apiUrl` برابط API الخاص بك
    String apiUrl;
    apiUrl = 'https://hjore.com/wp-json/wp/v2/posts?categories=94';
    String t;
    String v;
    int currentPage = 1;
    bool hasMorePages = true;
    final response1= await http.get(Uri.parse('$apiUrl&&page=$currentPage'));
    final data1 = jsonDecode(response1.body);
    t=data1[0]['title']['rendered'];
    v=data1[0]['custom']['categories'][0]['name'];
    var x = response1.headers['x-wp-total'];
    int totalItems=int.parse(x);




    print(totalItems);

    final prefs = await SharedPreferences.getInstance();
    final storedItemCount = prefs.getInt('item_count15') ?? 0;
    if(storedItemCount==0){
      await prefs.setInt('item_count15', totalItems);

    }
    if (totalItems > storedItemCount) {
      sendNotification(v,t,data1[0]['_links']['self'][0]['href']);
      await prefs.setInt('item_count15', totalItems);
    }
    if(totalItems<storedItemCount){
      await prefs.setInt('item_count15', totalItems);
    }
  }
  Future<void> fetchDataAndCompareItemCount16() async {
    // استبدل `apiUrl` برابط API الخاص بك
    String apiUrl;
    apiUrl = 'https://hjore.com/wp-json/wp/v2/posts?categories=92';
    String t;
    String v;
    int currentPage = 1;
    bool hasMorePages = true;
    final response1= await http.get(Uri.parse('$apiUrl&&page=$currentPage'));
    final data1 = jsonDecode(response1.body);
    t=data1[0]['title']['rendered'];
    v=data1[0]['custom']['categories'][0]['name'];
    var x = response1.headers['x-wp-total'];
    int totalItems=int.parse(x);




    print(totalItems);

    final prefs = await SharedPreferences.getInstance();
    final storedItemCount = prefs.getInt('item_count16') ?? 0;
    if(storedItemCount==0){
      await prefs.setInt('item_count16', totalItems);

    }
    if (totalItems > storedItemCount) {
      sendNotification(v,t,data1[0]['_links']['self'][0]['href']);
      await prefs.setInt('item_count16', totalItems);
    }
    if(totalItems<storedItemCount){
      await prefs.setInt('item_count16', totalItems);
    }
  }
  Future<void> fetchDataAndCompareItemCount17() async {
    // استبدل `apiUrl` برابط API الخاص بك
    String apiUrl;
    apiUrl = 'https://hjore.com/wp-json/wp/v2/posts?categories=114';
    String t;
    String v;
    int currentPage = 1;
    bool hasMorePages = true;
    final response1= await http.get(Uri.parse('$apiUrl&&page=$currentPage'));
    final data1 = jsonDecode(response1.body);
    t=data1[0]['title']['rendered'];
    v=data1[0]['custom']['categories'][0]['name'];
    var x = response1.headers['x-wp-total'];
    int totalItems=int.parse(x);




    print(totalItems);

    final prefs = await SharedPreferences.getInstance();
    final storedItemCount = prefs.getInt('item_count17') ?? 0;
    if(storedItemCount==0){
      await prefs.setInt('item_count17', totalItems);

    }
    if (totalItems > storedItemCount) {
      sendNotification(v,t,data1[0]['_links']['self'][0]['href']);
      await prefs.setInt('item_count17', totalItems);
    }
    if(totalItems<storedItemCount){
      await prefs.setInt('item_count17', totalItems);
    }
  }
  Future<void> fetchDataAndCompareItemCount18() async {
    // استبدل `apiUrl` برابط API الخاص بك
    String apiUrl;
    apiUrl = 'https://hjore.com/wp-json/wp/v2/posts?categories=119';
    String t;
    String v;
    int currentPage = 1;
    bool hasMorePages = true;
    final response1= await http.get(Uri.parse('$apiUrl&&page=$currentPage'));
    final data1 = jsonDecode(response1.body);
    t=data1[0]['title']['rendered'];
    v=data1[0]['custom']['categories'][0]['name'];
    var x = response1.headers['x-wp-total'];
    int totalItems=int.parse(x);




    print(totalItems);

    final prefs = await SharedPreferences.getInstance();
    final storedItemCount = prefs.getInt('item_count18') ?? 0;
    if(storedItemCount==0){
      await prefs.setInt('item_count18', totalItems);

    }
    if (totalItems > storedItemCount) {
      sendNotification(v,t,data1[0]['_links']['self'][0]['href']);
      await prefs.setInt('item_count18', totalItems);
    }
    if(totalItems<storedItemCount){
      await prefs.setInt('item_count18', totalItems);
    }
  }
  Future<void> fetchDataAndCompareItemCount19() async {
    // استبدل `apiUrl` برابط API الخاص بك
    String apiUrl;
    apiUrl = 'https://hjore.com/wp-json/wp/v2/posts?categories=112';
    String t;
    String v;
    int currentPage = 1;
    bool hasMorePages = true;
    final response1= await http.get(Uri.parse('$apiUrl&&page=$currentPage'));
    final data1 = jsonDecode(response1.body);
    t=data1[0]['title']['rendered'];
    v=data1[0]['custom']['categories'][0]['name'];
    var x = response1.headers['x-wp-total'];
    int totalItems=int.parse(x);




    print(totalItems);

    final prefs = await SharedPreferences.getInstance();
    final storedItemCount = prefs.getInt('item_count19') ?? 0;
    if(storedItemCount==0){
      await prefs.setInt('item_count19', totalItems);

    }
    if (totalItems > storedItemCount) {
      sendNotification(v,t,data1[0]['_links']['self'][0]['href']);
      await prefs.setInt('item_count19', totalItems);
    }
    if(totalItems<storedItemCount){
      await prefs.setInt('item_count19', totalItems);
    }
  }




  Future<void> sendNotification(String title,String re,String ap) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
        'your_channel_id', 'your_channel_name',
        importance: Importance.max, priority: Priority.high);

    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(

        0, title, re, platformChannelSpecifics,
        payload: ap);

  }
  @override
  Widget build(BuildContext context) {
    double r=80;
    double s=40;
    double t=22;
    return Container(
      child: SafeArea(

        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('img/uuu.png'),
                fit: BoxFit.cover,
              ),
            ),
            child:Column(
              children: [
                Expanded(
                  child: Container(),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 0, 255, 0.1), // لون شفاف قريب من الأزرق
                      borderRadius: BorderRadius.circular(10), // حواف دائرية بنصف قطر 10
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            final route = MaterialPageRoute(builder: (context) => MyScreen1());
                            Navigator.push(context, route);
                            // إجراء عند النقر على الصورة الرابعة
                          },
                          child: Container(
                            width: s,
                            height: s,
                            child: Align(
                              alignment: Alignment.center,
                              child: Image.asset(
                                'img/share.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(width: t), // تباعد باد بين العناصر


                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    final route = MaterialPageRoute(builder: (context) => ExamplePage());
                                    Navigator.push(context, route);
                                    // إجراء عند النقر على الصورة الأولى
                                  },
                                  child: Container(
                                    width: s,
                                    height: s,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Image.asset(
                                        'gg/Mofadal.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8,)

                              ],
                            ),
                        SizedBox(width: t), // تباعد باد بين العناصر
                        GestureDetector( onTap: () async {
                          String phoneNumber = '+962796643149'; // قم بتعيين الرقم المراد وضعه في تطبيق المكالمات
                         final whatsappUrl = "https://wa.me/$phoneNumber";
                         if (await canLaunch(whatsappUrl)) {
                          await launch(whatsappUrl);
                          } else {
                          throw 'Could not launch $whatsappUrl';
                          }
                        },
                          child: Container(
                            width: r,
                            height: r,
                            child: Align(
                              alignment: Alignment.center,
                              child: Image.asset(
                                'img/ialaan.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: t), // تباعد باد بين العناصر

                        Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    final route = MaterialPageRoute(builder: (context) => ssssddd());
                                    Navigator.push(context, route);
                                  },
                                  child: Container(
                                    width: s,
                                    height: s,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Image.asset(
                                        'img/ishaar.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),

                        ),
                                SizedBox(height: 8,)
                              ],
                            ),

                        SizedBox(width: t),
                        GestureDetector(
                          onTap: () {
                            final route = MaterialPageRoute(builder: (context) => categeories());
                            Navigator.push(context, route);
                            // إجراء عند النقر على الصورة الثانية
                          },
                          child: Container(
                            width: s,
                            height: s,
                            child: Align(
                              alignment: Alignment.center,
                              child: Image.asset(
                                'img/jobs.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
// تباعد باد بين العناصر
                      ],
                    ),
                  )

                ),
              ],
            )






          ),
        ),
      ),
    );
  }
}
