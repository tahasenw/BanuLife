import 'package:flutter/material.dart';


class FavorilerSayfa extends StatefulWidget {
  const FavorilerSayfa({super.key});

  @override
  State<FavorilerSayfa> createState() => _FavorilerSayfaState();
}

class _FavorilerSayfaState extends State<FavorilerSayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title:  Text('Favoriler',
          style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.secondary),),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,  // 2 sütun
          crossAxisSpacing: 10,  // Yatay boşluk
          mainAxisSpacing: 10,   // Dikey boşluk
          childAspectRatio: 3/4, // Kartların oranı (genişlik/yükseklik)
        ),
        itemCount: 9, // Artık toplam 9 kart olacak
        itemBuilder: (context, index) {
          if (index == 0) {
            return akademikTakvimKart(context); // İlk kart Akademik Takvim
          } else if (index == 1) {
            return yemekListesiKart(context); // İkinci kart Yemek Listesi
          } else if (index == 2) {
            return kampanyalar(context); // Üçüncü kart Kampanyalar
          } else if (index == 3) {
            return universitede_saatler(context); // Dördüncü kart Üniversitede Saatler
          } else if (index == 4) {
            return adayOgrenciKart(context); // Beşinci kart Aday Öğrenci
          } else if (index == 5) {
            return dersProgramiKart(context); // Altıncı kart Ders Programı
          }

          return SizedBox.shrink(); // Varsayılan bir widget döndürüyoruz
        },
      ),
    );
  }

  // Ders Programı Kartı
  Widget dersProgramiKart(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: InkWell(
              onTap: () {
                // Ders programı sayfasına yönlendirme yapılacak
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Scaffold(
                      appBar: AppBar(title: const Text('Ders Programı')),
                      body: Center(
                        child: Text(
                          'Ders programı sayfası buraya gelecek.',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                );
              },
              child: const Center(
                child: Icon(Icons.menu_book, size: 80, color: Colors.blue), // Takvim ikonu
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                "Ders Programı",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Ders programınızı görüntüleyin.",
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  // Aday Öğrenci Kartı
  Widget adayOgrenciKart(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          InkWell(
            onTap: ()  {
            },
            child: const Center(
              child: Icon(Icons.school, size: 80, color: Colors.purple),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(child: Text("Aday Öğrenci",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            ),
          ),
        ],
      ),
    );
  }

  // Akademik Takvim Kartı
  Widget akademikTakvimKart(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Scaffold(
                      appBar: AppBar(title: const Text('Akademik Takvim')),
                      body: Center(
                        child: Image.asset(
                          'resimler/akademik_takvim.jpg', // Akademik takvimi göster
                          fit: BoxFit.fitWidth,
                          width: double.infinity,
                        ),
                      ),
                    ),
                  ),
                );
              },
              child: const Center(
                child: Icon(Icons.calendar_today, size: 80, color: Colors.blue),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                "Akademik Takvim",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "2024-2025",
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  // Üniversitede Saatler Kartı
  Widget universitede_saatler(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: InkWell(
              onTap: () {
                // Saatler sayfası eklenebilir
              },
              child: const Center(
                child: Icon(Icons.access_time, size: 80, color: Colors.blue),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                "Üniversitede Saatler",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Okulun çalışma saatleri",
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  // Yemek Listesi Kartı
  Widget yemekListesiKart(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Scaffold(
                      appBar: AppBar(title: const Text('Yemek Listesi')),
                      body: Center(
                        child: Image.asset(
                          'resimler/yemek_listesi.jpg', // Yemek listesi görseli
                          fit: BoxFit.fitWidth,
                          width: double.infinity,
                        ),
                      ),
                    ),
                  ),
                );
              },
              child: const Center(
                child: Icon(Icons.restaurant, size: 80, color: Colors.green),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                "Yemek Listesi",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Bugün Neler Var?",
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  // Kampanyalar Kartı
  Widget kampanyalar(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: InkWell(
              onTap: () {
                // Kampanyalar sayfası eklenebilir
              },
              child: const Center(
                child: Icon(Icons.local_offer, size: 80, color: Colors.orange),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                "Kampanyalar",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "İndirimler ve fırsatlar",
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}

