import 'package:flutter/material.dart';

class ProfilSayfasi extends StatefulWidget {




  const ProfilSayfasi({ super.key});
  @override
  State<ProfilSayfasi> createState() => _ProfilSayfasiState();
}

class _ProfilSayfasiState extends State<ProfilSayfasi> {
  final double coverHeight = 280;
  final double profileHeight = 160;

  @override
  Widget build(BuildContext context) {
    final top = coverHeight - profileHeight / 2;

    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              kapakResmiOLustur(),
              Positioned(
                top: top,
                child: profilResmiOlustur(),
              ),
            ],
          ),
          const SizedBox(height: 80),
          adSoyadBolumOlustur(),
          const SizedBox(height: 16),
          profilDuzenleButonu(),
        ],
      ),
    );
  }

  Widget kapakResmiOLustur() => Container(
    color: Colors.grey,
    child: Image.asset(
      'resimler/yazilimcı_arka_plan_fotosu.jpg',
      width: double.infinity,
      height: coverHeight,
      fit: BoxFit.cover,
    ),
  );

  Widget profilResmiOlustur() => CircleAvatar(
    radius: profileHeight / 2,
    backgroundColor: Colors.grey.shade800,
    backgroundImage: AssetImage('resimler/cagtay.jpg'),
  );

  Widget adSoyadBolumOlustur() => Column(
    children:  [
      Text(
        " Ayşe Söğüt",
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 8),
      Text(
        ' Yazılım Mühendisliği',
        style: TextStyle(fontSize: 18, color: Colors.grey),
      ),
    ],
  );

  Widget profilDuzenleButonu() => Padding(
    padding: const EdgeInsets.only(top: 16.0),
    child: ElevatedButton(
      onPressed: () {
        // Profili düzenleme işlemleri buraya gelecek
      },
      child: const Text('Profili Düzenle'),
    ),
  );
}