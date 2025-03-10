import 'package:flutter/material.dart';

class HakkindaSayfa extends StatefulWidget {
  const HakkindaSayfa({super.key});

  @override
  State<HakkindaSayfa> createState() => _HakkindaSayfaState();
}

class _HakkindaSayfaState extends State<HakkindaSayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hakkında'),
        centerTitle: true,
        backgroundColor: Color(0xFF42B4C6), // Uygulama renkleriyle uyumlu
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '🔥 Banu Life – Kampüs Hayatına Yeni Bir Boyut!',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),


              const SizedBox(height: 20),
              const Text(
                ' Katkıda Bulunan Okul Öğrencileri: ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text('🖥️ Taha Şen', style: TextStyle(fontSize: 16)),
              const Text('🖥️ Pınar Altınkaya', style: TextStyle(fontSize: 16)),
              const Text('🖥️ Ayşe Söğüt', style: TextStyle(fontSize: 16)),
              const Text('🖥️ Erdem Yüksel', style: TextStyle(fontSize: 16)),
              const Text('🖥️ Burak Hasçelik', style: TextStyle(fontSize: 16)),
              const Text('🖥️ İsmail Topuçar', style: TextStyle(fontSize: 16)),
              const Text('🖥️ Sudenaz Lök', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 20),
              const Text(
                '💻 Banu Life v1.0 – Sürümü :',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Banu Life v1.0, Banmec CodeLab ekibi tarafından geliştirilen bir uygulamadır. Bu uygulama, '
                    'tamamen öğrenciler için öğrenciler tarafından tasarlanıp kodlanmıştır. Kampüs yaşamını daha pratik ve '
                    'verimli hale getirmek için geliştirilmiştir.',
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              const SizedBox(height: 20),
              const Text(
                '🎓 Bandırma Onyedi Eylül Üniversitesi Öğrencileri İçin, Öğrencilere Özel Bir Deneyim!',
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
