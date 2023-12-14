import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ProfileScreenState ();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // TODO: 1. Deklarasikan variabel yang dibutuhkan
  bool isSignedIn = false;
  String fullName = '';
  String userName = '';
  int favoriteCandiCount = 0;

  //TODO: 5. Implementasi fungsi signin
  void signIn (){
    setState(() {
      isSignedIn = !isSignedIn;
    });
  }
  //TODO: 6. Implementasi fungai signout
  void signOut (){
    setState(() {
      isSignedIn = !isSignedIn;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        body: Stack(
            children: [
              Container(
                height: 200, width: double.infinity, color: Colors.blueGrey,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    // TODO: 2. Buat bagian ProfilHeader yang berisi gambar profil
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 200 - 50),
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.blueGrey, width: 2),
                                shape: BoxShape.circle,
                              ),
                              child: CircleAvatar(
                                radius: 50,
                                backgroundImage: AssetImage('images/placeholder_image'),
                              ),
                            ),
                            if(isSignedIn)
                              IconButton(
                                onPressed: (){},
                                icon: Icon(Icons.camera_alt, color: Colors.deepPurple[50],),),
                          ],
                        ),
                      ),
                    ),
                    // TODO: 3. Buat bagian Profilnfo yang berisi info profil
                    SizedBox(height: 20,),
                    Divider(color: Colors.blueGrey[100],),
                    SizedBox(height: 4,),
                    Row(
                      children: [
                        SizedBox(width: MediaQuery.of(context).size.width / 3,
                          child: Row(
                            children: [
                              Icon(Icons.lock, color: Colors.blueGrey,),
                              SizedBox(width: 8,),
                              Text('Pengguna', style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold,
                              ),)
                            ],
                          ),),
                        Expanded(
                            child: Text(': $fullName', style: TextStyle(
                                fontSize: 18),)),
                      ],
                    ),


                    SizedBox(height: 4,),
                    Divider(color: Colors.blueGrey[100],),
                    SizedBox(height: 4,),
                    Row(
                      children: [
                        SizedBox(width: MediaQuery.of(context).size.width / 3,
                          child: Row(
                            children: [
                              Icon(Icons.person, color: Colors.lightBlue,),
                              SizedBox(width: 8,),
                              Text('Nama', style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold,
                              ),)
                            ],
                          ),),
                        Expanded(
                            child: Text(': $fullName', style: TextStyle(
                                fontSize: 18),)),
                        if(isSignedIn) Icon(Icons.edit),

                      ],
                    ),

                    SizedBox(height: 4,),
                    Divider(color: Colors.blueGrey[100],),
                    SizedBox(height: 4,),
                    Row(
                      children: [
                        SizedBox(width: MediaQuery.of(context).size.width / 3,
                          child: Row(
                            children: [
                              Icon(Icons.favorite, color: Colors.red,),
                              SizedBox(width: 8,),
                              Text('Favorite', style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold,
                              ),)
                            ],
                          ),),
                        Expanded(
                            child: Text(': $fullName', style: TextStyle(
                                fontSize: 18),)),
                        if(isSignedIn) Icon(Icons.edit),

                      ],
                    ),
                    // TODO: 4. Buat bagian ProfilActions yang berisi TextButton sign in/out
                    SizedBox(height: 4,),
                    Divider(color: Colors.blueGrey[100],),
                    SizedBox(height: 20,),
                    isSignedIn ? TextButton(
                        onPressed: signOut,
                        child: Text('Sign Out'))
                        : TextButton(
                        onPressed: signIn,
                        child: Text('Sign In'))
                  ],
                ),
              ),
            ],
            ),
        );
    }
}