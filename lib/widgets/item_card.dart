import 'package:flutter/material.dart';
import 'package:aplikasi_wisata_gunung/screens/detail_screen.dart';

import '../models/gunung.dart';

class ItemCard extends StatelessWidget {
  // TODO : 1. Deklarasikan variabel yang dibutuhkan dan padang pada konstruktor

  ItemCard({super.key, required this.gunung});
  final Gunung gunung;

  @override
  Widget build(BuildContext context) {
    // TODO : 6. Implementasi routing ke Detailscreen
    return InkWell(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailScreen(gunung: gunung))
        );
      },
      child: Card(
        // TODO : 2. Tetapkan parameter shape, margin, dan elevator dari cari
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.all(4),
        elevation: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TODO : 3. Buat Image sebagai anak dari column
            Expanded(
              // TODO : 7. Implementasi Hero animation
              child: Hero(
                tag: gunung.imageAsset,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset
                    (gunung.imageAsset,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // TODO : 4. Buat Text sebagai anak dari column
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                top: 8,
              ),
              child: Text(gunung.name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),),
            ),
            // TODO : 5. Buat Tect drbagai anak dari column
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                bottom: 8,
              ),
              child: Text(gunung.type,
                style: TextStyle(
                  fontSize: 12,
                ),),
            ),
          ],
        ),
      ),
    );
  }
}