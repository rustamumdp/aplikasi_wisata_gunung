import 'package:flutter/material.dart';
import 'package:aplikasi_wisata_gunung/models/gunung.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/gunung_data.dart';
import '../widgets/item_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FavoriteScreen(),
    );
  }
}

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key});
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<Gunung> favoriteMountains = [];

  @override
  void initState() {
    super.initState();
    // Assume you have a function to get the list of favorite mountains
    loadFavoriteMountains();
  }

  Future<void> loadFavoriteMountains() async {
    // Replace this with your actual logic to load favorite mountains
    // For demonstration, we are using a sample list of favorite mountains
    //List<Gunung> favorites = gunungList.where((mountain) => mountain.isFavorite).toList();
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Mengambil daftar gunung favorit dari SharedPreferences
    List<String>? favoriteMountainNames =
        prefs.getStringList('favoriteMountainNames') ?? [];

    // Menghapus gunung dari daftar favorite
    //favoriteMountainNames.remove(gunungList);

    // Menyimpan kembali daftar favorit yang sudah diupdate
    prefs.setStringList('favoriteMountainNames', favoriteMountainNames);

    // Memuat ulang daftar gunung favorit
    //await loadFavoriteMountains();

    // Menyaring gunung yang sesuai dengan daftar favorit
    List<Gunung> favorites = gunungList
        .where((mountain) => favoriteMountainNames.contains(mountain.name))
        .toList();

    setState(() {
      favoriteMountains = favorites;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gunung Favorit'),
      ),
      body: favoriteMountains.isEmpty
          ? Center(
        child: Text('Tidak ada gunung favorit.'),
      )
      //     : ListView.builder(
      //   itemCount: favoriteMountains.length,
      //   itemBuilder: (context, index) {
      //     return ListTile(
      //       title: Text(favoriteMountains[index].name),
      //       subtitle: Text(favoriteMountains[index].location),
      //       // Add more details or actions as needed
      //     );
      //   },
      // ),
          : GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        padding: EdgeInsets.all(8.0),
        itemCount: favoriteMountains.length,
        itemBuilder: (context, index) {
          Gunung gunung = favoriteMountains[index];
          return ItemCard(gunung: gunung);
        },
      ),
    );
  }
}
