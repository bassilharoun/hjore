import 'dart:convert';
import 'package:dotted_border/dotted_border.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hjore1/post.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Hjore extends StatefulWidget {
  String title;
  String api;
  Hjore(String t,a){
    title=t;
    api=a;
  }
  @override
  State<Hjore> createState() => _HjoreState(title,api);
}

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class _HjoreState extends State<Hjore> {
  List<Map<String, dynamic>> _items = [];

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
  Future<void> _loadItems() async {
    List<Map<String, dynamic>> items = await MySharedPreferences.getItems();
    setState(() {
      _items = items;
    });
  }

  String title;
  String api;
  _HjoreState(String t,a){
    title=t;
    api=a;
  }
  int res;
  Future<List> getData() async {
    String myUrl =api;
    http.Response response = await http.get(Uri.parse(myUrl));
    print(response.body);

    String totalCount = response.headers['x-wp-total'];
    int res1=int.parse(totalCount);
    res=res1;
    print('عدد العناصر: $totalCount');

    return json.decode(response.body);
  }
  List<bool> isButtonPressedList;
  @override
  void initState() {
    isButtonPressedList= List<bool>.filled(20000, false);

    super.initState();
    getData().then((data) {
      setState(() {

      });
    });

  }
  Future<bool> _checkTitleExists(String title, int index) async {
    List<Map<String, dynamic>> items = await MySharedPreferences.getItems();
    for (var item in items) {
      if (item.containsKey('title') && item['title'] == title) {
        setState(() {
          isButtonPressedList[index]=true;
        });

        return true;
      }
    }
    return false;
  }


  @override
  Widget build(BuildContext context) {

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
              builder: (BuildContext context, AsyncSnapshot<List> snapshot) {

                if (snapshot.hasData) {
                  List Data = snapshot.data;
                  return Container(
                    child: ListView.builder(
                      itemCount: Data.length,
                      itemBuilder: (BuildContext context, index) {


                        List <bool> f=List.generate(Data.length, (index) => false);
                        var image = Data[index]['custom'] == null ? "" : Data[index]['custom']['featured_image'] ;
                        var date = Data[index]['date'];
                        var time = Data[index]['time'];
                        String d= Data[index]['title']['rendered'];
                        _checkTitleExists( d,index);


                        double le;
                        if(d.length>55){
                          le=14;
                        }
                        else{
                          le=18;
                        }



                        return Column(

                          children: [
                            Container(
                              height: 125,
                              decoration: BoxDecoration(
                                color: Color(0x80FFFFFF),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  final route = MaterialPageRoute(builder: (context) => Post1(Data[index]['_links']['self'][0]['href'],title), );
                                  Navigator.push(context, route);
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,

                                  children: [
                                    Container(

                                      child: Row(

                                        children: [
                                          Expanded(
                                            child: Align(
                                              alignment: Alignment.topLeft,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                  if(d.length<=25)
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 35,
                                                        ),
                                                        Text(

                                                          d.replaceAll(RegExp(' +'), ' '),
                                                          locale: Locale('ar', 'AR'),
                                                          textDirection: TextDirection.rtl,
                                                          softWrap: true,
                                                          textAlign: TextAlign.right,
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                          ),
                                                        ),
                                                      ],
                                                    )


                                                  else Text(

                                                    d.replaceAll(RegExp(' +'), ' '),
                                                    locale: Locale('ar', 'AR'),
                                                    softWrap: true,
                                                    textDirection: TextDirection.rtl,
                                                    textAlign: TextAlign.right,
                                                    style: TextStyle(
                                                      fontSize: le,
                                                    ),
                                                  ),
                                                  SizedBox(height: 4),
                                                  Row(

                                                    children: [
                                                      SizedBox(width: 8),
                                                      Icon(
                                                        Icons.access_time,
                                                        size: 16,
                                                        color: Colors.grey,
                                                      ),
                                                      SizedBox(width: 4),
                                                      Text(
                                                        timeago.format(DateTime.parse(Data[index]['modified']), locale: 'ar'),
                                                        style: TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.grey,
                                                        ),
                                                        textDirection: TextDirection.rtl, // تعيين اتجاه النص من اليمين إلى اليسار
                                                      ),
                                                      SizedBox(width: 6),

                                                      GestureDetector(
                                                        onTap: () {
                                                          _addItem(Data[index]['title']['rendered'], Data[index]['custom']['featured_image'], Data[index]['_links']['self'][0]['href'],title);
                                                          setState(() {
                                                            isButtonPressedList[index] != isButtonPressedList[index]; // تغيير حالة الزر للعنصر المحدد
                                                          });
                                                        },
                                                        child: Icon(
                                                          Icons.favorite,
                                                          color: (isButtonPressedList[index] )? Colors.red : Colors.grey, // تحديد لون الزر بناءً على حالة الزر للعنصر
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 20),
                                          if (Data[index]['custom'] == null)
                                            Container()
                                          else
                                            DottedBorder(
                                              padding: EdgeInsets.all(5),


                                              color: Colors.green,
                                              strokeWidth: 2,

                                              child: Container(
                                                width: 65, // حجم الإطار المخطط
                                                height: 65,

                                                child: ClipRRect(
                                                  child: Image.network(
                                                    image,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          SizedBox(width: 10),

                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 20)
                          ],
                        );
                      },
                    ),

                  );
                }
                else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error loading data'),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(), // عرض CircularProgressIndicator أثناء تحميل البيانات
                  );
                }
              }),
        ),
      ),
    );
  }
}
