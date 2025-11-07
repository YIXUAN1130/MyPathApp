import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 初始化 Firebase
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    runApp(MyApp(firebaseInitialized: true));
  } catch (e) {
    debugPrint('❌ Firebase false: $e');
    runApp(MyApp(firebaseInitialized: false));
  }
}

class MyApp extends StatelessWidget {
  final bool firebaseInitialized;
  const MyApp({Key? key, required this.firebaseInitialized}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase Check',
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: firebaseInitialized
              ? const Text(
            '✅ Firebase right！',
            style: TextStyle(fontSize: 22, color: Colors.green),
          )
              : const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
