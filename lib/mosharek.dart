import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyScreen extends StatelessWidget {
  final String facebookUrl = 'https://www.facebook.com/profile.php?id=100094139841369';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: Center(
        child: IconButton(
          icon: Icon(Icons.facebook),
          onPressed: () => _launchFacebookApp(),
        ),
      ),
    );
  }

  _launchFacebookApp() async {
    if (await canLaunch(facebookUrl)) {
      await launch(facebookUrl);
    } else {
      throw 'Could not launch $facebookUrl';
    }
  }
}

class MyScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('img/IMG-20230613-WA0003.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            SizedBox(height: 16),
            // باقي العناصر الأخرى هنا


            Center(
              child: Image.asset(
                'img/logo-removebg-preview.png', // مسار الصورة الرئيسية
                width: 300, // عرض الصورة الرئيسية
                height: 400, // ارتفاع الصورة الرئيسية
              ),
            ),
            SizedBox(height: 16), // المسافة بين الصورة الرئيسية والأيقونات

            Wrap(
              spacing: 16, // المسافة بين الصور الصغيرة الأفقية
              runSpacing: 16, // المسافة بين الصور الصغيرة العمودية
              children: [
                GestureDetector(
                  onTap: () async {
                    String url = 'https://wa.me/+962796643149';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Image.asset(
                    'img/whatsapp_logo_icon_147205.png', // مسار الصورة الصغيرة 1
                    width: 50, // عرض الصورة الصغيرة
                    height: 50, // ارتفاع الصورة الصغيرة
                  ),
                ),
                GestureDetector(

                  onTap: () async {
                    final url = 'https://t.me/+j-k9fRXfpzAzMzdk';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Image.asset(
                    'img/Telegram_logo.svg.png', // مسار الصورة الصغيرة 2
                    width: 50, // عرض الصورة الصغيرة
                    height: 50, // ارتفاع الصورة الصغيرة
                  ),
                ),
                GestureDetector(
                  onTap: ()async{
                    final url = 'https://www.linkedin.com/in/home-for-the-jordanain-engineer-group-8b925b175/';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Image.asset(
                    'img/linkedin-icon-1024x1024-z5dvl47c.png', // مسار الصورة الصغيرة 3
                    width: 50, // عرض الصورة الصغيرة
                    height: 50, // ارتفاع الصورة الصغيرة
                  ),
                ),
                GestureDetector(
                  onTap: ()async{
                   // const url = 'mailto:Hjorejobs@gmail.com';
                    final Uri _emailLaunchUri = Uri(
                      scheme: 'mailto',
                      path: 'mailto:hjorejobs@gmail.com',
                    );


                    if (await canLaunchUrl(_emailLaunchUri)) {
                      await launchUrl(_emailLaunchUri);
                    } else {
                      throw 'Could not launch ';
                    }
                  },
                  child: Image.asset(
                    'gg/GMAIL.png', // مسار الصورة الصغيرة 3
                    width: 50, // عرض الصورة الصغيرة
                    height: 50, // ارتفاع الصورة الصغيرة
                  ),
                ),
                // إضافة المزيد من الصور الصغيرة هنا
              ],
            ),
            Wrap(
              spacing: 16, // المسافة بين الصور الصغيرة الأفقية
              runSpacing: 16,
              children: [
                GestureDetector (
                  onTap: () async {
                    final url = 'https://www.facebook.com/profile.php?id=100094139841369';
                    if (await canLaunch(url)) {
                    await launch(url);
                    } else {
                    throw 'Could not launch $url';
                    }
                      },
                  child: Image.asset(
                    'img/Facebook-logo.png', // مسار الصورة الصغيرة 3
                    width:85, // عرض الصورة الصغيرة
                    height: 75, // ارتفاع الصورة الصغيرة
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    final url = 'https://instagram.com/jobs_for_eng?igshid=ZDc4ODBmNjlmNQ==';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Image.asset(
                    'img/Instagram-Logo.wine.png', // مسار الصورة الصغيرة 3
                    width: 100, // عرض الصورة الصغيرة
                    height: 75, // ارتفاع الصورة الصغيرة
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
