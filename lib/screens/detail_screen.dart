import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:aplikasi_wisata_gunung/models/gunung.dart';


class  DetailScreen extends StatefulWidget {
  final Gunung gunung;

  DetailScreen ({super.key, required this.gunung});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isFavorite = false;
  bool isSignedIn = false;

  @override
  void initState() {
    super.initState();
    // Memeriksa status sign-in dan daftar gunung favorit saat inisialisasi
    checkSignInStatus();
    loadFavoriteMountains();
  }

  Future<void> checkSignInStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool signedIn = prefs.getBool('isSignedIn') ?? false;

    setState(() {
      isSignedIn = signedIn;
    });
  }

  Future<void> loadFavoriteMountains() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  // Mengambil daftar gunung favorit dari SharedPreferences
  List<String>? favoriteMountainNames =
      prefs.getStringList('favoriteMountainNames') ?? [];

  // Periksa apakah gunung saat ini ada dalam daftar favorit
  bool isCurrentlyFavorite = favoriteMountainNames.contains(widget.gunung.name);

  setState(() {
    isFavorite = isCurrentlyFavorite;
  });
}


  Future<void> _toggleFavorite() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  // memeriksa apakah pengguna sudah sign in
  if (!isSignedIn) {
    // jika belum sign in, arahkan ke halaman sign in
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushReplacementNamed(context, '/signin');
    });
    return;
  }

  // Mengambil daftar gunung favorit dari SharedPreferences
  List<String>? favoriteMountainNames =
      prefs.getStringList('favoriteMountainNames') ?? [];

  bool favoriteStatus = !isFavorite;

  if (favoriteStatus) {
    // Jika gunung ditambahkan ke favorit, tambahkan ke daftar
    favoriteMountainNames.add(widget.gunung.name);
  } else {
    // Jika gunung dihapus dari favorit, hapus dari daftar
    favoriteMountainNames.remove(widget.gunung.name);
  }

  // Simpan daftar gunung favorit ke SharedPreferences
  prefs.setStringList('favoriteMountainNames', favoriteMountainNames);

  setState(() {
    isFavorite = favoriteStatus;
  });
}





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //detailheader
            Stack(
              children:[
                //image utama
                Hero(
                  tag: widget.gunung.imageAsset,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal :16),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset('${widget.gunung.imageAsset}',
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.greenAccent[100]?.withOpacity(0.8),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                        )

                    ),
                  ),

                ),


              ],
            ),
            //detailinfo
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16,),
                  //info atas
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.gunung.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: (){
                          _toggleFavorite();
                        },
                        icon: Icon(isSignedIn && isFavorite
                            ? Icons.favorite
                            :Icons.favorite_border,
                          color: isSignedIn && isFavorite ? Colors.red : null,),
                      ),
                    ],
                  ),
                  //info tegah
                  SizedBox(height: 16,),
                  Row(children: [
                    Icon(Icons.place, color: Colors.orange,),
                    SizedBox(width: 8,),
                    SizedBox(width: 75,
                      child: Text('Letak', style: TextStyle(
                          fontWeight: FontWeight.bold),),),
                    Text(': ${widget.gunung.location}',),
                  ],),
                  Row(children: [
                    Icon(Icons.arrow_upward, color: Colors.blue,),
                    SizedBox(width: 8,),
                    SizedBox(width: 75,
                      child: Text('Ketinggian', style: TextStyle(
                          fontWeight: FontWeight.bold),),),
                    Text(': ${widget.gunung.height}'),
                  ],),
                  Row(children: [
                    Icon(Icons.landscape, color: Colors.green,),
                    SizedBox(width: 8,),
                    SizedBox(width: 75,
                      child: Text('Jenis', style: TextStyle(
                        fontWeight: FontWeight.bold,),),),
                    Text(': ${widget.gunung.type}'),
                  ],),
                  SizedBox(height: 16,),
                  Divider(color: Colors.deepPurple.shade100,),
                  SizedBox(height: 5,),
                  //info bawah
                  SizedBox(height: 5,),
                  Row(
                    children: [
                      Text(
                        'Deskripsi', style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16,),
                  Container(
                    height: 200,  // Ubah tinggi container sesuai kebutuhan Anda
                    child: SingleChildScrollView(  // Widget untuk memungkinkan scrolling
                      child: Text(
                        widget.gunung.description,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //detail gallery
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(color: Colors.deepPurple.shade100,),
                  Text('Galeri', style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold,
                  ),),
                  SizedBox(height: 10,),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.gunung.imageUrls.length,
                      itemBuilder: (context, index){
                        return Padding
                          (padding: EdgeInsets.only(right: 8),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  imageUrl: widget.gunung.imageUrls[index],
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
                  SizedBox(height: 4,),
                  Text('Slide', style: TextStyle(
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