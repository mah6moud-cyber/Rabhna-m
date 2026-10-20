import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ربحناM',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Cairo', // مناسب للتطبيقات العربية
      ),
      home: const MainNavigationScreen(),
    );
  }
}

// ---------------------------------------------------------------------------
// الشاشة الرئيسية التي تحتوي على القائمة السفلية للتنقل بين الأقسام
// ---------------------------------------------------------------------------
class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({Key? key}) : super(key: key);

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  // القوائم والشاشات الخاصة بالتطبيق
  final List<Widget> _screens = [
    const EmploymentScreen(), // قسم التوظيف (ابحث عن عمل / عامل)
    const EarnScreen(),       // قسم اربح معنا (إعلانات وألعاب)
    const ContactScreen(),    // قسم تواصل معنا
    const AdminScreen(),      // لوحة التحكم الخاصة بك (الـ 30% والـ 70%)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue.shade800,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'التوظيف'),
          BottomNavigationBarItem(icon: Icon(Icons.monetization_on), label: 'اربح معنا'),
          BottomNavigationBarItem(icon: Icon(Icons.contact_mail), label: 'تواصل معنا'),
          BottomNavigationBarItem(icon: Icon(Icons.admin_panel_settings), label: 'التحكم'),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// 1 & 2. قسم التوظيف (ابحث عن عمل وعامل)
// ---------------------------------------------------------------------------
class EmploymentScreen extends StatefulWidget {
  const EmploymentScreen({Key? key}) : super(key: key);

  @override
  State<EmploymentScreen> createState() => _EmploymentScreenState();
}

class _EmploymentScreenState extends State<EmploymentScreen> {
  List<String> resumes = ["أحمد - مبرمج فلاتر محترف", "محمد - مصمم واجهات مستخدم"];
  List<String> jobDetails = ["مطلوب مصمم للعمل الفوري بمشروع تجاري", "مطلوب مسوق إلكتروني لشركة شحن"];

  final TextEditingController _resumeController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('قسم التوظيف - ربحناM'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'ابحث عن عمل', icon: Icon(Icons.person_search)),
              Tab(text: 'ابحث عن عامل', icon: Icon(Icons.group_search)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // واجهة ابحث عن عمل
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: _resumeController,
                    decoration: const InputDecoration(
                      labelText: 'إضافة السيرة الذاتية (اسمك وخبرتك)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (_resumeController.text.isNotEmpty) {
                        setState(() {
                          resumes.add(_resumeController.text);
                          _resumeController.clear();
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('تم حفظ السيرة الذاتية ونشرها بنجاح!')),
                        );
                      }
                    },
                    child: const Text('حفظ ونشر في "ابحث عن عامل"'),
                  ),
                  const SizedBox(height: 20),
                  const Text('تفاصيل الأعمال المتاحة حالياً:', style: TextStyle(fontWeight: FontWeight.bold)),
                  Expanded(
                    child: ListView.builder(
                      itemCount: jobDetails.length,
                      itemBuilder: (context, index) => Card(child: ListTile(title: Text(jobDetails[index]))),
                    ),
                  )
                ],
              ),
            ),
            // واجهة ابحث عن عامل
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: _jobController,
                    decoration: const InputDecoration(
                      labelText: 'إضافة تفاصيل العمل المطلوبة',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (_jobController.text.isNotEmpty) {
                        setState(() {
                          jobDetails.add(_jobController.text);
                          _jobController.clear();
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('تم حفظ تفاصيل العمل ونشرها بنجاح!')),
                        );
                      }
                    },
                    child: const Text('حفظ ونشر في "ابحث عن عمل"'),
                  ),
                  const SizedBox(height: 20),
                  const Text('السير الذاتية للمتقدمين المتاحة حالياً:', style: TextStyle(fontWeight: FontWeight.bold)),
                  Expanded(
                    child: ListView.builder(
                      itemCount: resumes.length,
                      itemBuilder: (context, index) => Card(child: ListTile(title: Text(resumes[index]))),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// 3. قسم اربح معنا (إعلانات، ألعاب، وسحب فودافون كاش)
// ---------------------------------------------------------------------------
class EarnScreen extends StatefulWidget {
  const EarnScreen({Key? key}) : super(key: key);

  @override
  State<EarnScreen> createState() => _EarnScreenState();
}

class _EarnScreenState extends State<EarnScreen> {
  int _userPoints = 1250;
  double _userMoney = 3.75; // محسوبة تلقائياً بناءً على نسبة الـ 30% للمستخدم

  final TextEditingController _phoneController = TextEditingController();
  String _selectedWallet = 'فودافون كاش';

  void _watchAd() {
    setState(() {
      _userPoints += 100;
      _userMoney += 0.30; // نقاط إضافية وأموال تضاف فوراً
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('شكرًا لمشاهدة الإعلان! كسبت 100 نقطة.')),
    );
  }

  void _playGame() {
    setState(() {
      _userPoints += 250;
      _userMoney += 0.75;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('مبروك الفوز في اللعبة! كسبت 250 نقطة.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('اربح معنا')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // رصيد المستخدم والتنبيهات الدائمة
            Card(
              color: Colors.amber.shade100,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text('رصيدك الحالي: $_userPoints نقطة', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 5),
                    Text('القيمة المستحقة لك (30%): \$$_userMoney', style: const TextStyle(fontSize: 16, color: Colors.green, fontWeight: FontWeight.bold)),
                    const Divider(),
                    const Text(
                      'سيتم تحويل النقاط إلى فلوس يوم 22 من كل شهر.\nقد يتم قبول طلب السحب من 1 يوم إلى 5 أيام عمل.\nعلمًا بأن أول عملية سحب تكون يوم 22/11/2026.\nعليك مشاهدة الإعلانات ولعب الألعاب يومياً.\nلا تقلق نقاطك في أمان.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12, color: Colors.black80),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // أزرار كسب النقاط من المنصات والألعاب
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50), backgroundColor: Colors.redAccent),
              icon: const Icon(Icons.ondemand_video),
              label: const Text('اربح من مشاهدة الإعلانات'),
              onPressed: _watchAd,
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50), backgroundColor: Colors.purple),
              icon: const Icon(Icons.sports_esports),
