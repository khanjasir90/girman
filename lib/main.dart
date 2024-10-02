import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:girman/core/theme.dart';
import 'package:girman/features/home/presentation/view/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
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