import 'package:banu_life/data/entity/bolum.dart';
import 'package:banu_life/ui/views/arama_sayfa/arama_sayfa_bilgileri/bolum_detay_sayfa.dart';
import 'package:flutter/material.dart';


class AramaSayfa extends StatefulWidget {
  const AramaSayfa({super.key});

  @override
  State<AramaSayfa> createState() => _AramaSayfaState();
}

class _AramaSayfaState extends State<AramaSayfa> {
  final TextEditingController _searchController = TextEditingController();
  List<Bolumler> filteredData = [];
  List<Bolumler> bolumListesi = [];

  @override
  void initState() {
    super.initState();
    bolumleriYukle().then((value) {
      setState(() {
        bolumListesi = value;
        filteredData = bolumListesi; // Başlangıçta tüm bölümleri göster
      });
    });
  }

  Future<List<Bolumler>> bolumleriYukle() async {
    return [
      Bolumler(bolum_ad: "Yazılım Mühendisliği"),
      Bolumler(bolum_ad: "Bilgisayar Mühendisliği"),
      Bolumler(bolum_ad: "Elektrik Mühendisliği"),
      Bolumler(bolum_ad: "Elektrik-Elektronik Mühendisliği"),
      Bolumler(bolum_ad: "Hemşirelik"),
      Bolumler(bolum_ad: "İşletme"),
      Bolumler(bolum_ad: "Maliye"),
      Bolumler(bolum_ad: "İktisat"),
      Bolumler(bolum_ad: "Sosyal Hizmet"),
      Bolumler(bolum_ad: "Uluslararası İlişkiler"),
    ];
  }

  void _onSearchChanged(String query) {
    setState(() {
      filteredData = bolumListesi
          .where((bolum) =>
          bolum.bolum_ad.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF0F8FF),
        title:  Text('Arama Sayfası',
            style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.secondary)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              onChanged: _onSearchChanged,
              decoration: InputDecoration(
                labelText: 'Bölüm Ara',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    _onSearchChanged('');
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: filteredData.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(filteredData[index].bolum_ad),
                    leading: const Icon(Icons.school),
                    onTap: () {
                      // Bölüme tıklandığında, detay sayfasına git
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BolumDetaySayfa(
                            bolum: filteredData[index],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
