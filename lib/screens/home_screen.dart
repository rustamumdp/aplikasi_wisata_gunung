import 'package:flutter/material.dart';
import 'package:aplikasi_wisata_gunung/data/gunung_data.dart';
import 'package:aplikasi_wisata_gunung/widgets/item_card.dart';

import '../models/gunung.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO : 1. Buat appBar dengan judul wisata candi
      appBar: AppBar(title: Text('Gunung Indonesia'),),
      // TODO : 2. Body dengan gridview.builder
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2
          ),
          padding: EdgeInsets.all(8.0),
          itemCount: gunungList.length,
          // TODO : 3. Buat Itemcard sebagai return dari gridview.builder
          itemBuilder: (context, index){
            Gunung gunung = gunungList[index];
            return ItemCard(gunung: gunung);
          }),

    );
  }
}