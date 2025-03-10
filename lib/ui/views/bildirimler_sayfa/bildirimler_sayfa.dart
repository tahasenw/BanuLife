import 'package:flutter/material.dart';
import 'dart:async'; // Asenkron işlemler için

class BildirimlerSayfa extends StatefulWidget {
  @override
  State<BildirimlerSayfa> createState() => _BildirimlerSayfaState();
}

class _BildirimlerSayfaState extends State<BildirimlerSayfa> {
  List<Map<String, String>> bildirimler = [
    {'title': 'Yeni Duyuru', 'message': 'Yarından itibaren dersler çevrimiçi olacak.', 'date': '2025-03-03'},
    {'title': 'Haber', 'message': 'Kampüs içerisinde yeni kütüphane açıldı!', 'date': '2025-03-02'},
  ];

  // Bildirimleri API'den çeken bir fonksiyon
  Future<void> fetchNotifications() async {
    // Simülasyon amaçlı 2 saniye bekliyoruz
    await Future.delayed(Duration(seconds: 2));

    // Burada API'den gelen verilerle listemizi güncelliyoruz
    setState(() {
      bildirimler.add({
        'title': 'Yeni Duyuru',
        'message': 'Sınav tarihi değişti, yeni tarih 15 Mart.',
        'date': '2025-03-04',
      });
    });
  }

  @override
  void initState() {
    super.initState();
    fetchNotifications(); // Sayfa açıldığında bildirimleri çekiyoruz
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bildirimler'),
      ),
      body: bildirimler.isEmpty
          ? Center(child: CircularProgressIndicator()) // Veriler gelene kadar loading
          : ListView.builder(
        itemCount: bildirimler.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              contentPadding: EdgeInsets.all(12.0),
              title: Text(bildirimler[index]['title']!),
              subtitle: Text(bildirimler[index]['message']!),
              trailing: Text(bildirimler[index]['date']!),
              onTap: () {
                // Bildirime tıklanıldığında yapılacak işlemler
              },
            ),
          );
        },
      ),
    );
  }
}