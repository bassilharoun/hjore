import 'package:custom_switch_button/custom_switch_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<bool> buttonStates = List.generate(20, (index) => false);

class ssssddd extends StatefulWidget {
  const ssssddd({Key key}) : super(key: key);

  @override
  State<ssssddd> createState() => _ssssdddState();
}

class _ssssdddState extends State<ssssddd> {
  @override
  void initState() {
    super.initState();
    loadButtonStates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: ListView(
            children: [
              buildButtonWithText('الهندسة المدنية', 0),
              buildButtonWithText('هندسة العمارة', 1),
              buildButtonWithText('الهندسة الكهربائية', 2),
              buildButtonWithText('الهندسة الميكانيكية', 3),
              buildButtonWithText('هندسة الحاسوب', 4),
              buildButtonWithText('هندسة الميكاترونيكس', 5),
              buildButtonWithText('هندسة الاتصالات', 6),
              buildButtonWithText('هندسة الإلكترونيات', 7),
              buildButtonWithText('الهندسة الطبية', 8),
              buildButtonWithText('الهندسة الصناعية', 9),
              buildButtonWithText('الهندسة الزراعية', 10),
              buildButtonWithText('الهندسة الكيميائية', 11),
              buildButtonWithText('هندسة الاوتورونكس', 12),
              buildButtonWithText('هندسة لإنتاج و التعدين', 13),
              buildButtonWithText('هندسة التكييف و التبريد', 14),
              buildButtonWithText('هندسة السلامة العامة', 15),
              buildButtonWithText('التصميم', 16),
              buildButtonWithText('الفنيين', 17),
              buildButtonWithText('المقالات', 18),

              // قم بإنشاء الأزرار الباقية بنفس الطريقة
              // ...
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButtonWithText(String buttonText, int index) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          GestureDetector(
            onTap: (){
              setState(() {
                buttonStates[index] =!buttonStates[index];
                saveButtonState(index, buttonStates[index]);
              });
            },
            child: Center(
              child: CustomSwitchButton(
                backgroundColor: Colors.blueGrey,
                unCheckedColor: Colors.white,
                animationDuration: Duration(milliseconds: 400),
                checkedColor: Colors.lightGreen,
                checked: buttonStates[index],
              ),
            ),




          ),
          SizedBox(width: 30),
          Text(
            buttonText,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> saveButtonState(int index, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('buttonState_$index', value);
  }

  Future<void> loadButtonStates() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for (int i = 0; i < buttonStates.length; i++) {
      bool buttonState = prefs.getBool('buttonState_$i');
      if (buttonState != null) {
        setState(() {
          buttonStates[i] = buttonState;
        });
      }
    }
  }
}
