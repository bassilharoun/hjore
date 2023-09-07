import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hjore1/hjore.dart';
import 'package:http/http.dart'as http;
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

class categeories extends StatefulWidget {


  @override
  State<categeories> createState() => _categeoriesState();
}


class _categeoriesState extends State<categeories> {

  List title=[
    'الهندسة المدنية',
    "هندسة العمارة",
    "الهندسة الكهربائية",
    "الهندسة الميكانيكية",
    "هندسة الحاسوب",
    "هندسة الميكاترونيكس",
    "هندسة الاتصالات",
    "هندسة الإلكترونيات",
    "الهندسة الطبية",
    "الهندسة الصناعية",
    "الهندسة الزراعية",
    "الهندسة الكيميائية",
    "هندسة الاوتورونكس",
    "هندسة لإنتاج و التعدين",
    "هندسة التكييف و التبريد",
    "هندسة السلامة العامة",
    "التصميم",
    "الفنيين",
    "المقالات",
    "احدث الوظائف"
  ];
  Future<List> getData() async {
    String myUrl = 'https://hjore.com/wp-json/wp/v2/categories/';
    http.Response response = await http.get(Uri.parse(myUrl));
    print(response.body);

    return json.decode(response.body);

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('الوظائف'),
        centerTitle: true,
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
          child: ListView(
            children:[
          GestureDetector(
            onTap: (){
              final route = MaterialPageRoute(builder: (context) => Hjore(title[0], 'https://hjore.com/wp-json/wp/v2/posts?categories=85&per_page=100'));
              Navigator.push(
                context,
                route,
              );
            },
            child: GestureDetector(

              child: ListTile(
                contentPadding: EdgeInsets.all(10.0), // تعديل هنا لزيادة الحجم العام للعناصر

                trailing: Image.asset('img/madanie.png', width: 40, height: 40), // الصورة على اليمين وحجمها ثابت (40x40)
              title: Text('الهندسة المدنية', textAlign: TextAlign.center,style: TextStyle(fontSize: 20)), // النص في المنتصف
        ),
            ),
          ),
              Divider(color: Colors.blue), // إضافة خط أزرق بين العناصر

              GestureDetector(
                onTap: (){
                  final route = MaterialPageRoute(builder: (context) => Hjore(title[1], 'https://hjore.com/wp-json/wp/v2/posts?categories=87&per_page=100'));
                  Navigator.push(
                    context,
                    route,
                  );
                },
                child: ListTile(
                  contentPadding: EdgeInsets.all(10.0), // تعديل هنا لزيادة الحجم العام للعناصر

                  trailing: Image.asset('img/mimaria.png', width: 40, height: 40),
          title: Text('هندسة العمارة', textAlign: TextAlign.center,style: TextStyle(fontSize: 20)),
        ),
              ),
              Divider(color: Colors.blue), // إضافة خط أزرق بين العناصر

              GestureDetector(
                onTap: (){
                  final route = MaterialPageRoute(builder: (context) => Hjore(title[2], 'https://hjore.com/wp-json/wp/v2/posts?categories=86&per_page=100'));
                  Navigator.push(
                    context,
                    route,
                  );
                },

                child: ListTile(
                  contentPadding: EdgeInsets.all(10.0), // تعديل هنا لزيادة الحجم العام للعناصر

                  trailing: Image.asset('img/kahraba.png', width: 40, height: 40),
                  title: Text('الهندسة الكهربائية', textAlign: TextAlign.center,style: TextStyle(fontSize: 20)),
                ),
              ),
              Divider(color: Colors.blue), // إضافة خط أزرق بين العناصر

              GestureDetector(
                onTap: (){

                    final route = MaterialPageRoute(builder: (context) => Hjore(title[3], 'https://hjore.com/wp-json/wp/v2/posts?categories=83&per_page=100'));
                    Navigator.push(
                      context,
                      route,
                    );

                },
                child: ListTile(
                  contentPadding: EdgeInsets.all(10.0), // تعديل هنا لزيادة الحجم العام للعناصر

                  trailing: Image.asset('img/mikanik.png', width: 40, height: 40),
                  title: Text('الهندسة الميكانيكية', textAlign: TextAlign.center,style: TextStyle(fontSize: 20)),
                ),
              ),
              Divider(color: Colors.blue), // إضافة خط أزرق بين العناصر
              GestureDetector(
                onTap: (){
                  final route = MaterialPageRoute(builder: (context) => Hjore(title[4], 'https://hjore.com/wp-json/wp/v2/posts?categories=89&per_page=100'));
                  Navigator.push(
                    context,
                    route,
                  );
                },
                child: ListTile(
                  contentPadding: EdgeInsets.all(10.0), // تعديل هنا لزيادة الحجم العام للعناصر

                  trailing: Image.asset('img/computer.png', width: 40, height: 40),
                  title: Text('هندسة الحاسوب', textAlign: TextAlign.center,style: TextStyle(fontSize: 20)),
                ),
              ),
              Divider(color: Colors.blue), // إضافة خط أزرق بين العناصر
              GestureDetector(
                onTap: (){
                  final route = MaterialPageRoute(builder: (context) => Hjore(title[5], 'https://hjore.com/wp-json/wp/v2/posts?categories=84&per_page=100'));
                  Navigator.push(
                    context,
                    route,
                  );
                },
                child: ListTile(
                  contentPadding: EdgeInsets.all(10.0), // تعديل هنا لزيادة الحجم العام للعناصر

                  trailing: Image.asset('img/mekatroneks.png', width: 40, height: 40),
                  title: Text('هندسة الميكاترونيكس', textAlign: TextAlign.center,style: TextStyle(fontSize: 20)),
                ),
              ),
              Divider(color: Colors.blue), // إضافة خط أزرق بين العناصر

              GestureDetector(
                onTap: (){
                  final route = MaterialPageRoute(builder: (context) => Hjore(title[6], 'https://hjore.com/wp-json/wp/v2/posts?categories=111&per_page=100'));
                  Navigator.push(
                    context,
                    route,
                  );
                },
                child: ListTile(
                  contentPadding: EdgeInsets.all(10.0), // تعديل هنا لزيادة الحجم العام للعناصر

                  trailing: Image.asset('img/etesalat.png', width: 40, height: 40),
                  title: Text('هندسة الإتصالات', textAlign: TextAlign.center,style: TextStyle(fontSize: 20)),
                ),
              ),
              Divider(color: Colors.blue), // إضافة خط أزرق بين العناصر

              GestureDetector(
                onTap: (){
                  final route = MaterialPageRoute(builder: (context) => Hjore(title[7], 'https://hjore.com/wp-json/wp/v2/posts?categories=90&per_page=100'));
                  Navigator.push(
                    context,
                    route,
                  );
                },
                child: ListTile(
                  contentPadding: EdgeInsets.all(10.0), // تعديل هنا لزيادة الحجم العام للعناصر

                  trailing: Image.asset('img/elictron.png', width: 40, height: 40),
                  title: Text('هندسة الإلكترونيات', textAlign: TextAlign.center,style: TextStyle(fontSize: 20)),
                ),
              ),
              Divider(color: Colors.blue), // إضافة خط أزرق بين العناصر

              GestureDetector(
                onTap: (){
                  final route = MaterialPageRoute(builder: (context) => Hjore(title[8], 'https://hjore.com/wp-json/wp/v2/posts?categories=109&per_page=100'));
                  Navigator.push(
                    context,
                    route,
                  );
                },
                child: ListTile(
                  contentPadding: EdgeInsets.all(10.0), // تعديل هنا لزيادة الحجم العام للعناصر

                  trailing: Image.asset('img/teb.png', width: 40, height: 40),
                  title: Text('الهندسة الطبية ', textAlign: TextAlign.center,style: TextStyle(fontSize: 20)),
                ),
              ),
              Divider(color: Colors.blue), // إضافة خط أزرق بين العناصر

              GestureDetector(
                onTap: (){
                  final route = MaterialPageRoute(builder: (context) => Hjore(title[9], 'https://hjore.com/wp-json/wp/v2/posts?categories=82&per_page=100'));
                  Navigator.push(
                    context,
                    route,
                  );
                },
                child: ListTile(
                  contentPadding: EdgeInsets.all(10.0), // تعديل هنا لزيادة الحجم العام للعناصر

                  trailing: Image.asset('img/sinaa.png', width: 40, height: 40),
                  title: Text('الهندسة الصناعية ', textAlign: TextAlign.center,style: TextStyle(fontSize: 20)),
                ),
              ),
              Divider(color: Colors.blue), // إضافة خط أزرق بين العناصر

              GestureDetector(
                onTap: (){
                  final route = MaterialPageRoute(builder: (context) => Hjore(title[10], 'https://hjore.com/wp-json/wp/v2/posts?categories=91&per_page=100'));
                  Navigator.push(
                    context,
                    route,
                  );
                },
                child: ListTile(
                  contentPadding: EdgeInsets.all(10.0), // تعديل هنا لزيادة الحجم العام للعناصر

                  trailing: Image.asset('img/zeraa.png', width: 40, height: 40),
                  title: Text('الهندسة الزراعية ', textAlign: TextAlign.center,style: TextStyle(fontSize: 20)),
                ),
              ),
              Divider(color: Colors.blue), // إضافة خط أزرق بين العناصر

              GestureDetector(
                onTap: (){
                  final route = MaterialPageRoute(builder: (context) => Hjore(title[11], 'https://hjore.com/wp-json/wp/v2/posts?categories=88&per_page=100'));
                  Navigator.push(
                    context,
                    route,
                  );
                },
                child: GestureDetector(
                  onTap: (){
                    final route = MaterialPageRoute(builder: (context) => Hjore(title[11], 'https://hjore.com/wp-json/wp/v2/posts?categories=88&per_page=100'));
                    Navigator.push(
                      context,
                      route,
                    );
                  },
                  child: ListTile(
                    contentPadding: EdgeInsets.all(10.0), // تعديل هنا لزيادة الحجم العام للعناصر

                    trailing: Image.asset('img/kimia.png', width: 40, height: 40),
                    title: Text('الهندسة الكيميائية ', textAlign: TextAlign.center,style: TextStyle(fontSize: 20)),
                  ),
                ),
              ),
              Divider(color: Colors.blue), // إضافة خط أزرق بين العناصر

              GestureDetector(
                onTap: (){
                  final route = MaterialPageRoute(builder: (context) => Hjore(title[12], 'https://hjore.com/wp-json/wp/v2/posts?categories=110&per_page=100'));
                  Navigator.push(
                    context,
                    route,
                  );
                },
                child: ListTile(
                  contentPadding: EdgeInsets.all(10.0), // تعديل هنا لزيادة الحجم العام للعناصر

                  trailing: Image.asset('img/autotroniks.png', width: 40, height: 40),
                  title: Text('هندسة الاوتورونكس ', textAlign: TextAlign.center,style: TextStyle(fontSize: 20)),
                ),
              ),
              Divider(color: Colors.blue), // إضافة خط أزرق بين العناصر
              GestureDetector(
                onTap: (){
                  final route = MaterialPageRoute(builder: (context) => Hjore(title[13], 'https://hjore.com/wp-json/wp/v2/posts?categories=95&per_page=100'));
                  Navigator.push(
                    context,
                    route,
                  );
                },
                child: ListTile(
                  contentPadding: EdgeInsets.all(10.0), // تعديل هنا لزيادة الحجم العام للعناصر

                  trailing: Image.asset('img/intaj.png', width: 40, height: 40),
                  title: Text('هندسة الإنتاج والتعدين ', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
                ),
              ),
              Divider(color: Colors.blue), // إضافة خط أزرق بين العناصر
              GestureDetector(
                onTap: (){
                  final route = MaterialPageRoute(builder: (context) => Hjore(title[14], 'https://hjore.com/wp-json/wp/v2/posts?categories=94&per_page=100'));
                  Navigator.push(
                    context,
                    route,
                  );
                },
                child: ListTile(
                  contentPadding: EdgeInsets.all(10.0), // تعديل هنا لزيادة الحجم العام للعناصر

                  trailing: Image.asset('img/takeef.png', width: 40, height: 40),
                  title: Text('هندسة التكييف و التبريد ', textAlign: TextAlign.center,style: TextStyle(fontSize: 20)),
                ),
              ),
              Divider(color: Colors.blue), // إضافة خط أزرق بين العناصر
              GestureDetector(
                onTap: (){
                  final route = MaterialPageRoute(builder: (context) => Hjore(title[15], 'https://hjore.com/wp-json/wp/v2/posts?categories=92&per_page=100'));
                  Navigator.push(
                    context,
                    route,
                  );
                },
                child: ListTile(
                  contentPadding: EdgeInsets.all(10.0), // تعديل هنا لزيادة الحجم العام للعناصر

                  trailing: Image.asset('img/salamaamma.png', width: 40, height: 40),
                  title: Text('هندسة السلامة العامة ', textAlign: TextAlign.center,style: TextStyle(fontSize: 20)),
                ),
              ),
              Divider(color: Colors.blue), // إضافة خط أزرق بين العناصر
              GestureDetector(
                onTap: (){
                  final route = MaterialPageRoute(builder: (context) => Hjore(title[16], 'https://hjore.com/wp-json/wp/v2/posts?categories=114&per_page=100'));
                  Navigator.push(
                    context,
                    route,
                  );
                },
                child: ListTile(
                  contentPadding: EdgeInsets.all(10.0), // تعديل هنا لزيادة الحجم العام للعناصر

                  trailing: Image.asset('img/tasmem.png', width: 40, height: 40),
                  title: Text('التصميم', textAlign: TextAlign.center,style: TextStyle(fontSize: 20)),
                ),
              ),
              Divider(color: Colors.blue), // إضافة خط أزرق بين العناصر
              GestureDetector(
                onTap: (){
                  final route = MaterialPageRoute(builder: (context) => Hjore(title[17], 'https://hjore.com/wp-json/wp/v2/posts?categories=119&per_page=100'));
                  Navigator.push(
                    context,
                    route,
                  );
                },
                child: ListTile(
                  contentPadding: EdgeInsets.all(10.0), // تعديل هنا لزيادة الحجم العام للعناصر

                  trailing: Image.asset('img/hirafeen.png', width: 40, height: 40),
                  title: Text('الفنيين', textAlign: TextAlign.center,style: TextStyle(fontSize: 20)),
                ),
              ),
              Divider(color: Colors.blue), // إضافة خط أزرق بين العناصر
              GestureDetector(
                onTap: (){
                  final route = MaterialPageRoute(builder: (context) => Hjore(title[18], 'https://hjore.com/wp-json/wp/v2/posts?categories=112&per_page=100'));
                  Navigator.push(
                    context,
                    route,
                  );
                },
                child: ListTile(
                  contentPadding: EdgeInsets.all(10.0), // تعديل هنا لزيادة الحجم العام للعناصر

                  trailing:Image.asset('img/book1.png', width: 40, height: 40),
                  title: Text('المقالات', textAlign: TextAlign.center,style: TextStyle(fontSize: 20)),
                ),
              ),
        // قائمة العناصر الأخرى
        ],
          )


    ),
      ),
    );
  }
}
