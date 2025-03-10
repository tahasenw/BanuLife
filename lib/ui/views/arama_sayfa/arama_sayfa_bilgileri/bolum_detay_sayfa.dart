import 'package:banu_life/data/entity/bolum.dart';
import 'package:flutter/material.dart';


class BolumDetaySayfa extends StatelessWidget {
  final Bolumler  bolum; // Tıklanan bölümün verisi

  const BolumDetaySayfa({super.key, required this.bolum});

  @override
  Widget build(BuildContext context) {
    // Bölüm açıklaması (örnek olarak statik bir açıklama ekliyoruz, bunu dinamik hale getirebilirsiniz)
    String bolumAciklama = "Bu bölüm, modern yazılım mühendisliği uygulamaları ve teorileri üzerine yoğunlaşmaktadır. Öğrenciler, yazılım geliştirme süreçlerinden, yazılım testlerine kadar geniş bir yelpazede bilgi sahibi olmaktadırlar.";

    // Öğretim üyeleri (örnek olarak statik öğretim üyeleri ekliyoruz)
    List<String> ogretimUyeleri = ["Prof. Dr. Ahmet Yılmaz", "Doç. Dr. Mehmet Kaya", "Dr. Öğr. Üyesi Selin Demir"];

    return Scaffold(
      appBar: AppBar(
        title: Text(bolum.bolum_ad),
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Bölüm adı
            Text(
              bolum.bolum_ad,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Bölüm açıklaması
            Text(
              "Bölüm Açıklaması:",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              bolumAciklama,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            // Öğretim üyeleri
            Text(
              "Öğretim Üyeleri:",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ...ogretimUyeleri.map((ogretimUyesi) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  ogretimUyesi,
                  style: TextStyle(fontSize: 16),
                ),
              );
            }).toList(),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: (){}, child:  Text("${bolum.bolum_ad} bölümünüm web sitesi")),
          ],
        ),
      ),
    );
  }
}
