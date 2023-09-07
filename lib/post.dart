import 'dart:convert';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:phone_number_mask/phone_number_mask.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
class MySharedPreferences {
  static const String key = 'test'; // مفتاح SharedPreferences

  // إضافة عنصر إلى قائمة SharedPreferences
  static Future<void> addItem(Map<String, dynamic> item) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // استرجاع القائمة الحالية من SharedPreferences
    List<String> itemsJson = prefs.getStringList(key) ?? [];

    // تحويل العنصر إلى سلسلة JSON وإضافته إلى القائمة
    itemsJson.add(jsonEncode(item));

    // حفظ القائمة المحدثة في SharedPreferences
    prefs.setStringList(key, itemsJson);
  }

  // استرجاع العناصر من SharedPreferences
  static Future<List<Map<String, dynamic>>> getItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> itemsJson = prefs.getStringList(key) ?? [];

    List<Map<String, dynamic>> items = itemsJson
        .map<Map<String, dynamic>>((item) => jsonDecode(item))
        .toList();

    return items;
  }
}

class Post1 extends StatefulWidget {
  String nurl;
  String title;

  Post1(String url,title1){
    nurl=url;
    title=title1;
  }
  @override
  State<Post1> createState() => _Post1State(nurl,title);
}

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

class _Post1State extends State<Post1> {
  String myUrl ;
 String title;

  _Post1State(String url,title1){
    myUrl=url;
    title=title1;

  }
  void sharePage() async {
    final String post1Link = 'myapp://post1'; // رابط صفحة Post1 المشاركة

    if (await canLaunch(post1Link)) {
      await launch(post1Link);
    } else {
      print('Could not launch $post1Link');
    }
  }
  List<Map<String, dynamic>> _items = [];

  Future<void> _loadItems() async {
    List<Map<String, dynamic>> items = await MySharedPreferences.getItems();
    setState(() {
      _items = items;
    });
  }

  Future<void> _addItem(String title, image, link,String t) async {
    String newItem = 'sssss';

    if (newItem.isNotEmpty) {
      Map<String, dynamic> item = {
        'title': title,
        'image': image,
        'link': link,
        't':t,
      };

      // استخراج العناصر الحالية من SharedPreferences
      List<Map<String, dynamic>> currentItems = await MySharedPreferences.getItems();

      // التحقق مما إذا كان العنصر موجودًا بالفعل في القائمة
      bool itemExists = currentItems.any((element) => element['link'] == link);
      if (!itemExists) {
        // إدراج العنصر الجديد في بداية القائمة
        currentItems.insert(0, item);

        // حفظ القائمة المحدثة في SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        Fluttertoast.showToast(
          msg: 'تمت إضافة العنصر بنجاح',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
        List<String> itemsJson = currentItems.map((item) => jsonEncode(item)).toList();
        prefs.setStringList(MySharedPreferences.key, itemsJson);

        await _loadItems();
      }
      else {
        Fluttertoast.showToast(
          msg: 'العنصر موجود مسبقًا',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
      }
    }
  }
  bool x=false;


  Future<Map> getData() async {
    http.Response response = await http.get(Uri.parse(myUrl));
    return json.decode(response.body);
  }  @override
  void initState() {
// TODO: implement initState
    super.initState();
    getData();
  }
  Future<void> addItemToSharedPreferences(Map<String, dynamic> item) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> items = prefs.getStringList('items') ?? [];
    items.add(jsonEncode(item)); // تحويل العنصر إلى سلسلة JSON وإضافته إلى القائمة
    prefs.setStringList('items', items);
  }

  bool isButtonPressedList=false;
  Future<bool> _checkTitleExists(String title, ) async {
    List<Map<String, dynamic>> items = await MySharedPreferences.getItems();
    for (var item in items) {
      if (item.containsKey('title') && item['title'] == title) {
        setState(() {
          isButtonPressedList=true;
        });

        return true;
      }
    }
    return false;
  }
  @override
  Widget build(BuildContext context) {

    TextStyle customTextStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.red,
    );
    return Scaffold(
      appBar: AppBar(

        centerTitle: true,
        title: Text(title),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('img/IMG-20230613-WA0003.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: FutureBuilder(
            future: getData(),
            builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {

              if (snapshot.hasData) {
                Map<String, dynamic> data = Map<String, dynamic>.from(snapshot.data);
                final String text=data['content']['rendered'];
                print(extractTenDigitNumber(text));

                bool isEmail(String text) {
                  final regex = RegExp(
                      r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}\b');
                  return regex.hasMatch(text);
                }
                String formattedText = text.replaceAllMapped(
                  RegExp(r'\b\d{12}\b'),
                      (match) {
                    String number = match.group(0);
                    if (number.contains('9') && number.contains('6') && number.contains('2')) {
                      return '<span style="color: blue;">$number</span>';
                    } else {
                      return number;
                    }
                  },
                );
                String formattedText1 = formattedText.replaceAllMapped(
                  RegExp(r'\b\d{10}\b'),
                      (match) {
                    String number = match.group(0);
                    if (number.contains('0') && number.contains('7')) {
                      return '<span style="color: blue;">$number</span>';
                    } else {
                      return number;
                    }
                  },
                );



                return Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(data['title']['rendered'], style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),textAlign: TextAlign.right,),
                        SizedBox(height: 10,),
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20), // تعديل قيمة الـ borderRadius حسب الزاوية المطلوبة

                            child: Image.network(data['custom']['featured_image'],
                              fit: BoxFit.cover, // لتغطية الصورة داخل الـ ClipRRect
                            ),
                        ),
                    GestureDetector(
                                     onTap: (){
    final phoneNumber = extractPhoneNumber(data['content']['rendered']);
    print(phoneNumber);
    final phoneNumber1=extractTenDigitNumber(text);

    if (phoneNumber!=Null) {
    launch("tel:$phoneNumber"); // فتح تطبيق المكالمات مع الرقم المحدد
    }
    else if (phoneNumber!=Null) {
      launch("tel:$phoneNumber1"); // فتح تطبيق المكالمات مع الرقم المحدد
    }
    }
                      ,
                      child: Directionality(
                        textDirection: TextDirection.rtl, // تحديد اتجاه النص إلى اليمين لليسار

                        child: SingleChildScrollView(
                          child: Html(




                           data: formattedText1,
                            onLinkTap: (url, attributes, element) {
                              if (url.startsWith('mailto:')) {
                                launch(url); // فتح تطبيق البريد
                              }
                            }
                            ,

                          ),
                        ),
                      ),
                    ),



                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: (){Navigator.pop(context);},
                                icon: Icon(Icons.arrow_back_outlined,color: Colors.black12,size: 50,),
                              ),
                              SizedBox(width: 20,),
                              IconButton(
                                onPressed: (){

                                  _addItem(data['title']['rendered'],data['custom']['featured_image'],data['_links']['self'][0]['href'],title).then((value) {
                                    setState(() {
                                      _checkTitleExists(data['title']['rendered']);
                                    });
                                  });


                                  ;},
                                icon:isButtonPressedList ==false?Icon(Icons.favorite,color: Colors.white,size: 50,):Icon(Icons.favorite,color: Colors.red,size: 50,),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 50,)


                      ],
                    ),
                  ),
                );
              }else if (snapshot.hasError) {
                return Center(
                  child: Text('Error loading data'),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(), // عرض CircularProgressIndicator أثناء تحميل البيانات
                );
              }
            },

          ),
        ),
      ),
    );
  }}
  String extractPhoneNumber(String text) {
    final regex = RegExp(r'\+\d+'); // تعبير الاستقطاب للبحث عن الأرقام التي تبدأ بـ "+"
    final matches = regex.allMatches(text);
    if (matches.isNotEmpty) {
      final match = matches.first;
      return match.group(0);
    }}
String extractTenDigitNumber(String text) {
  final regex = RegExp(r'\b\d{10}\b'); // تعبير الاستقطاب للبحث عن الأرقام المؤلفة من عشر خانات
  final match = regex.firstMatch(text);
  if (match != null) {
    return match.group(0);
  } else {
    return null;
  }
}


