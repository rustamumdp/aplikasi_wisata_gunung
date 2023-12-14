import 'package:flutter/material.dart';
import 'package:aplikasi_wisatagunung/models/gunung.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DetailScreen extends StatelessWidget {
  final Gunung gunung;

  DetailScreen({Key? key, required this.gunung}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Detail Header
            Stack(
              children: [
                Image.asset(gunung.fotoAsset),
              ],
            ),

            // Detail Info
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  // Info Atas (nama gunung dan tombol favorit)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        gunung.nama,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite_border),
                      )
                    ],
                  ),

                  // Info Tengah (lokasi, ketinggian, dan tipe)
                  const SizedBox(height: 16,),
                  Row(
                    children: [
                      const Icon(Icons.place, color: Colors.red,),
                      const SizedBox(width: 8,),
                      const SizedBox(
                        width: 70,
                        child: Text('Lokasi', style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),),
                      ),
                      Text(': ${gunung.lokasi}'),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.height, color: Colors.red,),
                      const SizedBox(width: 8,),
                      const SizedBox(
                        width: 70,
                        child: Text('Ketinggian', style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),),
                      ),
                      Text(': ${gunung.ketinggian} meter'),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.category, color: Colors.red,),
                      const SizedBox(width: 8,),
                      const SizedBox(
                        width: 70,
                        child: Text('Tipe', style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),),
                      ),
                      Text(': ${gunung.tipe}'),
                    ],
                  ),
                  const SizedBox(height: 16,),
                  Divider(color: Colors.deepPurple.shade100,),
                  const SizedBox(height: 16,),
                ],
              ),
            ),

            // Detail Gallery
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(color: Colors.deepPurple.shade100,),
                  const Text("Galeri", style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold,
                  ),),
                  const SizedBox(height: 10,),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: gunung.fotoUrls.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: Colors.deepPurple.shade100,
                                  width: 2,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  imageUrl: gunung.fotoUrls[index],
                                  width: 120,
                                  height: 120,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Container(
                                    width: 120,
                                    height: 120,
                                    color: Colors.deepPurple[50],
                                  ),
                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 4,),
                  const Text("Tap untuk memperbesar", style: TextStyle(
                    fontSize: 12, color: Colors.black54,
                  ),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
