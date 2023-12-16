import 'package:aplikasi_wisatagunung/models/gunung.dart';

import '../models/gunung.dart';

var gunungList = [
  Gunung(
    nama: 'Gunung Rinjani',
    lokasi: 'Lombok, Nusa Tenggara Barat',
    deskripsi:
    'Gunung Rinjani adalah gunung berapi kedua tertinggi di Indonesia dan terletak di Pulau Lombok, Nusa Tenggara Barat. Dengan ketinggian 3.726 meter di atas permukaan laut, Rinjani menawarkan pemandangan indah dan danau kawah yang spektakuler. Pendakian ke puncak gunung ini adalah pengalaman yang menantang dan menawarkan pemandangan matahari terbit yang luar biasa.',
    ketinggian: 3726,
    tipe: 'Stratovolcano',
    fotoAsset: 'images/rinjani.jpeg',
    fotoUrls: [
      'https://www.trekkingrinjani.com/mendakigunungrinjani/images/puncak-gunung-rinjani6.jpg'
      'https://asset.kompas.com/crops/WYcYPfavcrfsNzSm6bXugeuKloA=/0x0:740x493/750x500/data/photo/2021/03/27/605e9f16e805f.jpg',
      'https://cdn0-production-images-kly.akamaized.net/SThgojesidJM61qgD4ByaeUK7gk=/0x0:960x541/1200x675/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/2856425/original/065394900_1563418788-rinjani.jpg',
      'https://mmc.tirto.id/image/otf/500x0/2018/08/07/gunung-rinjani-istock_ratio-16x9.jpg',
    ],
    favorit: false,
  ),
  Gunung(
    nama: 'Gunung Semeru',
    lokasi: 'Bromo Tengger Semeru National Park, Jawa Timur',
    deskripsi:
    'Gunung Semeru, juga dikenal sebagai Mahameru, adalah gunung berapi tertinggi di Pulau Jawa. Terletak di Taman Nasional Bromo Tengger Semeru, gunung ini memiliki ketinggian 3.676 meter di atas permukaan laut. Pendakian ke puncak Semeru menawarkan pemandangan panorama Tengger Caldera dan lautan pasir. Saat mencapai puncak, pendaki dapat menyaksikan letusan gunung berapi kecil yang terjadi secara periodik.',
    ketinggian: 3676,
    tipe: 'Stratovolcano',
    fotoAsset: 'images/semeru.jpeg',
    fotoUrls: [
      'https://akcdn.detik.net.id/visual/2021/12/09/gunung-semeru-2_43.jpeg?w=720&q=90',
      'https://cdn1-production-images-kly.akamaized.net/us6h7sVXjf92bsUxY42D1cl5hBo=/0x255:5377x3286/800x450/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/3656233/original/088747900_1638941693-000_9U86NL.jpg',
      'https://komitmeniklim.id/wp-content/uploads/2022/01/semeru21.jpg',
      'https://img.okezone.com/content/2022/12/13/337/2726585/gunung-semeru-terpantau-alami-penggembungan-ini-penyebabnya-VMcU3vUjKy.jpg',
    ],
    favorit: false,
  ),
  Gunung(
    nama: 'Gunung Kerinci',
    lokasi: 'Jambi',
    deskripsi:
    'Gunung Kerinci adalah gunung berapi tertinggi di Indonesia dan terletak di Provinsi Jambi, Sumatera. Dengan ketinggian 3.805 meter di atas permukaan laut, Gunung Kerinci menawarkan pemandangan alam yang memukau. Gunung ini terletak di Taman Nasional Kerinci Seblat, yang juga merupakan habitat bagi berbagai jenis flora dan fauna.',
    ketinggian: 3805,
    tipe: 'Stratovolcano',
    fotoAsset: 'images/kerinci.jpeg',
    fotoUrls: [
      'https://awsimages.detik.net.id/community/media/visual/2023/06/10/puncak-indrapura-gunung-kerinci-1_169.jpeg?w=1200',
      'https://static.promediateknologi.id/crop/0x0:0x0/0x0/webp/photo/p2/13/2023/04/30/IMG-20230430-WA0031-1070247256.jpg',
      'https://static.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/2023/08/08/gunung-kerinci-1379339471.jpg',
      'https://asset.kompas.com/crops/IM-dEVj1p1W7JDSPG2dO_7fOTa8=/0x0:800x533/750x500/data/photo/2022/08/04/62eb270149f0c.jpg',
    ],
    favorit: false,
  ),
  Gunung(
    nama: 'Gunung Bromo',
    lokasi: 'Jawa Timur',
    deskripsi:
    'Gunung Bromo atau dalam bahasa Tengger dieja "Brama", juga disebut Kaldera Tengger, adalah sebuah gunung berapi aktif di Jawa Timur, Indonesia.',
    ketinggian: 2329,
    tipe: 'Kaldera',
    fotoAsset: 'images/',
    fotoUrls: [
      'https://awsimages.detik.net.id/community/media/visual/2023/06/10/puncak-indrapura-gunung-kerinci-1_169.jpeg?w=1200',
      'https://static.promediateknologi.id/crop/0x0:0x0/0x0/webp/photo/p2/13/2023/04/30/IMG-20230430-WA0031-1070247256.jpg',
      'https://static.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/2023/08/08/gunung-kerinci-1379339471.jpg',
      'https://asset.kompas.com/crops/IM-dEVj1p1W7JDSPG2dO_7fOTa8=/0x0:800x533/750x500/data/photo/2022/08/04/62eb270149f0c.jpg',
    ],
    favorit: false,
  ),

];
