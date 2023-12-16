class Gunung {
  final String name;
  final String location;
  final String description;
  final String height;
  final String type;
  final String imageAsset;
  final List<String> imageUrls;
  bool isFavorite;

  Gunung({
    required this.name,
    required this.location,
    required this.description,
    required this.height,
    required this.type,
    required this.imageAsset,
    required this.imageUrls,
    this.isFavorite = false,
  });

}

