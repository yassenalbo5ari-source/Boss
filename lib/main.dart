import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const FootFetchBossyApp());
}

class FootFetchBossyApp extends StatelessWidget {
  const FootFetchBossyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FootFetch - Bossy Edition',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0F0F0F),
        primaryColor: Colors.redAccent,
      ),
      home: const BossyMainScreen(),
    );
  }
}

class BossyMainScreen extends StatefulWidget {
  const BossyMainScreen({Key? key}) : super(key: key);

  @override
  State<BossyMainScreen> createState() => _BossyMainScreenState();
}

class _BossyMainScreenState extends State<BossyMainScreen> {
  final List<String> _orders = [
    "I will slap you",
    "أبزق عليك",
    "Take my shoes off",
    "Smell my feet",
    "Kiss my feet",
    "Clean my shoes",
    "Say I'm sorry",
    "You are a bad boy",
  ];

  String _currentResponse = "اختر أمراً لتستقبل التوجيه الصارم...";
  Color _responseColor = Colors.white70;

  void _executeOrder(String order) {
    HapticFeedback.heavyImpact();
    setState(() {
      _currentResponse = "الأمر الصادر: \"$order\"\n\nالتنفيذ الفوري جارٍ... أطع الأوامر بدقة ولا تتردد.";
      _responseColor = Colors.redAccent;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FootFetch - Bossy AI'),
        centerTitle: true,
        backgroundColor: const Color(0xFF1A1A1A),
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF181818),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.redAccent.withOpacity(0.3), width: 1.5),
                ),
                child: Center(
                  child: Text(
                    _currentResponse,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: _responseColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Color(0xFF141414),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'اختر الأمر الموجه إليك:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _orders.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF222222),
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  side: const BorderSide(color: Colors.white10),
                                ),
                              ),
                              onPressed: () => _executeOrder(_orders[index]),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    _orders[index],
                                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                  ),
                                  const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.redAccent),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
