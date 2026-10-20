
import 'package:flutter/material.dart';

void main() => runApp(RabhnaM());

class RabhnaM extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ربحنا-M',
      theme: ThemeData(primarySwatch: Colors.green),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ربحنا-M'), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            _btn(context, 'ابحث عن عمل', Icons.work, FindWorkScreen(), Colors.blue),
            _btn(context, 'ابحث عن عامل', Icons.person_search, FindWorkerScreen(), Colors.orange),
            _btn(context, 'اربح معنا', Icons.monetization_on, EarnScreen(), Colors.green),
            Spacer(),
            _btn(context, 'تواصل معنا', Icons.message, ContactScreen(), Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _btn(BuildContext c, String t, IconData i, Widget s, Color col) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      width: double.infinity,
      height: 60,
      child: ElevatedButton.icon(
        icon: Icon(i, color: Colors.white),
        label: Text(t, style: TextStyle(fontSize: 18, color: Colors.white)),
        style: ElevatedButton.styleFrom(backgroundColor: col),
        onPressed: () => Navigator.push(c, MaterialPageRoute(builder: (_) => s)),
      ),
    );
  }
}

class FindWorkScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: Text('ابحث عن عمل')), body: Center(child: Text('هنا اضافة السيرة الذاتية')));
}

class FindWorkerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: Text('ابحث عن عامل')), body: Center(child: Text('هنا اضافة تفاصيل العمل')));
}

class EarnScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: Text('اربح معنا')), body: Center(child: Text('اعلانات + العاب + الرصيد\n\nحول النقاط الى فلوس يوم 22 من كل شهر\nاول سحب 22/11/2026')));
}

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: Text('تواصل معنا')), body: Center(child: Text('ارسل رسالة للادمن')));
}
