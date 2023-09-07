
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hjore1/categiories.dart';
import 'package:hjore1/fav.dart';
import 'package:hjore1/ishaar.dart';
import 'package:hjore1/not1.dart';
import 'package:hjore1/post.dart';
import 'package:hjore1/wajeha.dart';
import 'package:phone_number_mask/phone_number_mask.dart';

import 'hjore.dart';
import 'mosharek.dart';
import 'notificationii.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();


     await initializeNotifications();
  // قم بالتعامل مع رقم الهاتف كما تريد



  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,

    home: MyScreen2(),
  ));
}


