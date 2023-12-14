class Gunung {
  final String nama;
  final String lokasi;
  final String deskripsi;
  final int ketinggian;
  final String tipe;
  final String fotoAsset;
  final List<String> fotoUrls;
  bool favorit;

  Gunung({
    required this.nama,
    required this.lokasi,
    required this.deskripsi,
    required this.ketinggian,
    required this.tipe,
    required this.fotoAsset,
    required this.fotoUrls,
    this.favorit = false,
  });
}
