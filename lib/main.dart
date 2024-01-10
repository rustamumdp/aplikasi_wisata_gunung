import 'package:flutter/material.dart';
import 'package:aplikasi_wisata_gunung/data/gunung_data.dart';
import 'package:aplikasi_wisata_gunung/screens/SignInScreen.dart';
import 'package:aplikasi_wisata_gunung/screens/SignUpScreen.dart';
import 'package:aplikasi_wisata_gunung/screens/detail_screen.dart';
import 'package:aplikasi_wisata_gunung/screens/favorite_screen.dart';
import 'package:aplikasi_wisata_gunung/screens/home_screen.dart';
import 'package:aplikasi_wisata_gunung/screens/profile_screen.dart';
import 'package:aplikasi_wisata_gunung/screens/search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/' : (context) => MainScreen(),
        // '/detail' : (context) => DetailScreen(gunung: gunung),
        '/signin' : (context) => SignInScreen(),
        '/signup' : (context) => SignUpScreen(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Gunung Indonesia',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.greenAccent),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent).copyWith(
          primary: Colors.greenAccent,
          surface: Colors.greenAccent[50],
        ),
        useMaterial3: true,
      ),
      // home : ProfilScreen(),
      // home: DetailScreen(gunung: gunungList[0]),
      // home: SignUpScreen(),
      // home : SearchScreen(),
      // home: HomeScreen(),
      // home: MainScreen(),
    );
  }
}
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // TODO : 1. Deklerasikan variabel
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    SearchScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO : 2. Buat Properti body berupa widget yang ditampilkan
      body: _children[_currentIndex],
      // TODO : 3. Buat properti bottomNavigationBar dengan nilai theme
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            canvasColor: Colors.greenAccent[50]
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.black,),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.black,),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite, color: Colors.black,),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.black,),
              label: 'Profile',
            ),
          ],
          onTap: (index){
            setState(() {
              _currentIndex = index;
            });
          },
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.lightGreen,
          showSelectedLabels: true,
          showUnselectedLabels: true,
        ),
      ),
    );
  }
}