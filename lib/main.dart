import 'package:aplikasi_wisatagunung/data/gunung_data.dart';
import 'package:aplikasi_wisatagunung/screens/SignInScreen.dart';
import 'package:aplikasi_wisatagunung/screens/SignUpScreen.dart';
import 'package:aplikasi_wisatagunung/screens/detail_screen.dart';
import 'package:aplikasi_wisatagunung/screens/profile_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // tes

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Wisata Gunung',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.blueGrey),
          titleTextStyle: TextStyle(
            color: Colors.lightBlue,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple).copyWith(
          primary: Colors.blueGrey,
          surface: Colors.blueGrey[50],
        ),
        useMaterial3: true,
      ),
      // home: SignUpScreen(),
      // home: SignInScreen(),
      // home: ProfileScreen(),
      home: DetailScreen(gunung: gunungList[0],),

    );
  }
}