import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:girman/core/theme.dart';
import 'package:girman/features/home/presentation/view/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      appId: '1:941020888058:android:14ac6c7e5832d51d6ec243',
      apiKey: 'AIzaSyCAeJHYqrD5mZsMnzvYoKW79XGCBsgfqDM',
      projectId: 'girman-1befb',
      messagingSenderId: '941020888058',
      storageBucket: 'girman-1befb.appspot.com',
    ),
  );
  runApp(const GirmanApp());
}

class GirmanApp extends StatelessWidget {
  const GirmanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const HomePage(),
    );
  }
}