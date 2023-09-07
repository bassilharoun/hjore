import 'dart:convert';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:hjore1/post.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

class ExamplePage extends StatefulWidget {
  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  TextEditingController _textFieldController = TextEditingController();
  List<Map<String, dynamic>> _items = [];

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  Future<void> _loadItems() async {
    List<Map<String, dynamic>> items = await MySharedPreferences.getItems();
    setState(() {
      _items = items;
    });
  }

  Future<void> _addItem() async {
    String newItem = _textFieldController.text;
    if (newItem.isNotEmpty) {
      Map<String, dynamic> item = {'title': newItem, 'description': 'This is item $newItem'};
      await MySharedPreferences.addItem(item);
      await _loadItems();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('المفضلة'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('img/IMG-20230613-WA0003.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          children: [

            Expanded(
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> item = _items[index];
                  return Dismissible(
                      key: Key(item.toString()), // مفتاح يحدد العنصر المحذوف
                  onDismissed: (direction) {
                  _removeItem(index); // استدعاء دالة لحذف العنصر من قائمة SharedPreferences
                  },
                  background: Container(color: Colors.red), // تعيين لون الخلفية عند سحب العنصر
                  child: GestureDetector(
                  onTap: () {
                  final route = MaterialPageRoute(builder: (context) => Post1(item['link'],item['t']));
                  Navigator.push(context, route);
                  },
                    child: Column(
                      children: [
                        Container(
                      height: 125,
                      decoration: BoxDecoration(
                        color: Color(0x80FFFFFF),
                        borderRadius: BorderRadius.circular(10),),
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
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(

                                              item['title'],
                                              softWrap: true,
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                fontSize: 18,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ), SizedBox(width: 20,),
                                    if (item['image'] == false)
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
                                              item['image'],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20)

                      ],
                    ),)
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> _removeItem(int index) async {
    List<Map<String, dynamic>> currentItems = await MySharedPreferences.getItems();
    currentItems.removeAt(index); // حذف العنصر من القائمة
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> itemsJson = currentItems.map((item) => jsonEncode(item)).toList();
    prefs.setStringList(MySharedPreferences.key, itemsJson); // حفظ القائمة المحدثة في SharedPreferences
    await _loadItems(); // إعادة تحميل العناصر بعد الحذف
  }

}
