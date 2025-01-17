import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BANÜ LİFE", style: TextStyle(fontSize: 20, color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          // 📌 Ana Sayfa Postları Burada Gösterilecek

          ListView(
            padding: EdgeInsets.all(10),
            children: [
              postKart("resimler/banuokul.jpg", "Bandırma Onyedi Eylül Üniversitesi."),
              SizedBox(height: 10),
              postKart("resimler/banuokul.jpg", "Bandırma Onyedi Eylül Üniversitesi."),
              SizedBox(height: 10),
              postKart("resimler/banuokul.jpg", "Bandırma Onyedi Eylül Üniversitesi."),
              SizedBox(height: 10),
              postKart("resimler/banuokul.jpg", "Bandırma Onyedi Eylül Üniversitesi."),
              SizedBox(height: 10),
              postKart("resimler/banuokul.jpg", "Bandırma Onyedi Eylül Üniversitesi."),
              SizedBox(height: 10),
              postKart("resimler/banuokul.jpg", "Bandırma Onyedi Eylül Üniversitesi."),
              SizedBox(height: 10),
              postKart("resimler/banuokul.jpg", "Bandırma Onyedi Eylül Üniversitesi."),
              SizedBox(height: 10),
              postKart("resimler/banuogrenci.jpg", "BANÜ'ye 5 bin 500 üzerinde öğrenci yerleşti."),
            ],
          ),
          Center(child: Text("🔍 Arama İçeriği", style: TextStyle(fontSize: 22))),
          Center(child: Text("❤️ Favoriler İçeriği", style: TextStyle(fontSize: 22))),
          Center(child: Text("🔔 Bildirimler İçeriği", style: TextStyle(fontSize: 22))),
          Center(child: Text("👤 Profil İçeriği", style: TextStyle(fontSize: 22))),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Anasayfa'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Arama'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favoriler'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Bildirimler'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
    );
  }

  // 📌 Post Kartı Oluşturan Fonksiyon
  Widget postKart(String imagePath, String description) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.asset(imagePath, fit: BoxFit.cover, width: double.infinity, height: 200),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(description, style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }
}


