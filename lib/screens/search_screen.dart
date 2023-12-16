import 'package:flutter/material.dart';
import 'package:aplikasi_wisata_gunung/data/gunung_data.dart';

import '../models/gunung.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // TODO : 1. Deklarasikan variabel yang dibutuhkan
  List<Gunung> _filteredGunung = gunungList;
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO : 2. Buat appBar dengal judul pencarian gunung
      appBar: AppBar(title: Text('Pencarian Gunung'),),
      // TODO : 3. Buat body berupa column
      body: Column(
        children: [
          // TODO : 4. Buat Textfield pencarian sebagai anak dari column
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.deepPurple[50],
              ),
              child: TextField(
                autofocus: false,
                decoration: InputDecoration(
                  hintText: 'Cari Gunung...',
                  prefixIcon: Icon(Icons.search),
                  border : InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color : Colors.deepPurple),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12),
                ),
              ),
            ),
          ),
          // TODO : 5. Buat listview hasil pencarian sebagai anak dari column
          Expanded(
            child: ListView.builder(
              itemCount: _filteredGunung.length,
              itemBuilder: (context, index){
                final gunung = _filteredGunung[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding : EdgeInsets.all(8),
                        width: 100,
                        height: 100,
                        child: ClipRRect(
                            borderRadius : BorderRadius.circular(10),
                            child: Image.asset(gunung.imageAsset, fit: BoxFit.cover,)),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(gunung.name, style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold,
                          ),),
                          SizedBox(height : 4),
                          Text(gunung.location),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),


    );
  }
}