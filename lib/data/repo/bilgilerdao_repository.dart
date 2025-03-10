import 'package:banu_life/data/entity/bilgiler.dart';


class BilgilerDaoRepository {
  Future<List<Bilgiler>> getBilgiler() async {
    await Future.delayed(Duration(seconds: 1));
    return [
      Bilgiler(
        ad: 'Ahmet',
        soyad: 'Yılmaz',
        email: 'ahmet.yilmaz@example.com',
        bolum: 'Bilgisayar Mühendisliği',
        fakulte: 'Mühendislik Fakültesi',
        ogrenciNo: '123456789',
      ),
      Bilgiler(
        ad: 'Ayşe',
        soyad: 'Kaya',
        email: 'ayse.kaya@example.com',
        bolum: 'Elektrik-Elektronik Mühendisliği',
        fakulte: 'Mühendislik Fakültesi',
        ogrenciNo: '987654321',
      ),
      // Diğer öğrenciler...
    ];
  }
}
