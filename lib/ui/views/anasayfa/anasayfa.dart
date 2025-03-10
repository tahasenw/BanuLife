import 'package:banu_life/ui/views/ayarlar_sayfa/ayarlar_sayfa.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title:  Text(
          'BANÜ LİFE',
          style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.secondary),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AyarlarSayfa()),
              );
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            postKart(imagePath: 'resimler/banu_resim.png', text: 'Banu logusu'),
            postKart(imagePath: 'resimler/banuogrenci.jpg', text: 'Banu Öğrenciler'),
            postKart(imagePath: 'resimler/banuokul.jpg', text: 'Banu Okul'),
            postKart(imagePath: 'resimler/banuogrenci.jpg', text: 'Banu Öğrenci 2'),
            postKart(imagePath: 'resimler/banuokul.jpg', text: 'Banu Okul 2'),
            postKart(imagePath: 'resimler/banuogrenci.jpg', text: 'Banu Öğrenci 3'),
            postKart(imagePath: 'resimler/banuokul.jpg', text: 'Banu Okul 3'),
          ],
        ),
      ),
    );
  }
}

class postKart extends StatelessWidget {
  final String imagePath;
  final String text; // Metin için bir parametre ekledik

  postKart({required this.imagePath, required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 10), // Her post arasında boşluk bırakır
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Kenarlara yuvarlama ekler
      ),
      child: Column(  // Column widget'ı ile resim ve metni alt alta yerleştirdik
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15), // Resmin kenarlarını yuvarlar
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              height: 300,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0), // Metnin etrafına padding ekledik
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
