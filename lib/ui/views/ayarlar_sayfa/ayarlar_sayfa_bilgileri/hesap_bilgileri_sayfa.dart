import 'package:banu_life/data/entity/bilgiler.dart';
import 'package:flutter/material.dart';
import 'dart:async'; // Future için gerekli

class HesapBilgileriSayfa extends StatefulWidget {
  const HesapBilgileriSayfa({super.key});

  @override
  State<HesapBilgileriSayfa> createState() => _HesapBilgileriSayfaState();
}

class _HesapBilgileriSayfaState extends State<HesapBilgileriSayfa> {
  late Future<Bilgiler> _bilgileriGetirFuture;

  @override
  void initState() {
    super.initState();
    _bilgileriGetirFuture = _bilgileriGetir(); // Future fonksiyonunu başlat
  }

  Future<Bilgiler> _bilgileriGetir() async {
    await Future.delayed(const Duration(seconds: 2)); // Simüle edilmiş gecikme
    return Bilgiler(
      ad: "Pınar",
      soyad: "Altınkaya",
      email: "pinaraltinkaya@banü.edu.tr",
      ogrenciNo: "2023123456",
      fakulte: "Mühendislik ve Doğa Bilimleri Fakültesi",
      bolum: "Yazılım Mühendisliği",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title:  Text('Hesap Bilgileri',
          style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.secondary),),
        centerTitle: true,
      ),
      body: FutureBuilder<Bilgiler>(
        future: _bilgileriGetirFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator()); // Yükleniyor göstergesi
          } else if (snapshot.hasError) {
            return Center(child: Text("Hata: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            final Bilgiler user = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Theme.of(context).colorScheme.secondary,
                          child: Icon(Icons.person, size: 50, color:Theme.of(context).colorScheme.surface ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildInfoRow("Ad", user.ad),
                      _buildInfoRow("Soyad", user.soyad),
                      _buildInfoRow("Email", user.email),
                      _buildInfoRow("Öğrenci Numarası", user.ogrenciNo),
                      _buildInfoRow("Fakülte", user.fakulte),
                      _buildInfoRow("Bölüm", user.bolum),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const Center(child: Text("Veri bulunamadı"));
          }
        },
      ),
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            "$title:",
            style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color:Theme.of(context).colorScheme.secondary ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
