import 'package:flutter/material.dart';
import 'package:aplikasi_wisata_gunung/models/gunung.dart';

import '../data/gunung_data.dart';

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
    List<Gunung> favorites = gunungList.where((mountain) => mountain.isFavorite).toList();

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
          : ListView.builder(
        itemCount: favoriteMountains.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(favoriteMountains[index].name),
            subtitle: Text(favoriteMountains[index].location),
            // Add more details or actions as needed
          );
        },
      ),
    );
  }
}
