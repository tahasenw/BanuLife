import 'package:banu_life/app/tema_degistirme.dart';
import 'package:banu_life/data/entity/yerel_bildirimler.dart';
import 'package:banu_life/ui/views/ayarlar_sayfa/ayarlar_sayfa_bilgileri/hesap_bilgileri_sayfa.dart';
import 'package:banu_life/ui/views/ayarlar_sayfa/ayarlar_sayfa_bilgileri/sifre_degistir_sayfa.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AyarlarSayfa extends StatefulWidget {
  const AyarlarSayfa({super.key});

  @override
  State<AyarlarSayfa> createState() => _AyarlarSayfaState();
}

class _AyarlarSayfaState extends State<AyarlarSayfa> {
  bool _notificationsEnabled = false;

  @override
  Widget build(BuildContext context) {
    // Tema değişim durumunu provider'dan alıyoruz
    final themeProvider = Provider.of<TemaDegistirme>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'Ayarlar',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.secondary),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          _buildSettingsItem(
            context,
            icon: Icons.person,
            title: 'Hesap Bilgileri',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HesapBilgileriSayfa()));
            },
          ),
          _buildSettingsItem(
            context,
            icon: Icons.lock,
            title: 'Şifre Değiştir',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SifreDegistirSayfa()));
            },
          ),
          // Bildirim Ayarları Switch
          SwitchListTile(
            value: _notificationsEnabled,
            onChanged: (bool value) {
              setState(() {
                _notificationsEnabled = value;
              });
              if (_notificationsEnabled) {
                // Bildirimleri normal şekilde göster
                YerelBildirimler().showNotification();
              } else {
                // Bildirimleri sesiz yap
                YerelBildirimler().showNotification();
              }
            },
            title: Text(
              'Bildirim Ayarları',
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            ),
            secondary: Icon(Icons.notifications,
                color: Theme.of(context).colorScheme.secondary),
            activeColor: Theme.of(context).colorScheme.secondary,
          ),
          // Tema Değiştir Switch
          SwitchListTile(
            value:
                themeProvider.isDarkMode, // Tema durumu provider'dan alınıyor
            onChanged: (bool value) {

              themeProvider.toggleTheme(); // Tema değiştir
            },
            title: Text(
              'Tema Değiştir',
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            ),
            secondary: Icon(Icons.dark_mode,
                color: Theme.of(context).colorScheme.secondary),
            activeColor: Theme.of(context).colorScheme.secondary,
          ),
          _buildSettingsItem(
            context,
            icon: Icons.info,
            title: 'Uygulama Hakkında',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SifreDegistirSayfa()));
            },
          ),
          _buildSettingsItem(
            context,
            icon: Icons.exit_to_app,
            title: 'Çıkış Yap',
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SifreDegistirSayfa()));
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsItem(BuildContext context,
      {required IconData icon,
      required String title,
      required VoidCallback onTap}) {
    return ListTile(
      minVerticalPadding: 25,
      leading: Icon(icon, color: Theme.of(context).colorScheme.secondary),
      title: Text(
        title,
        style: TextStyle(color: Theme.of(context).colorScheme.secondary),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Theme.of(context).colorScheme.secondary,
      ),
      onTap: onTap,
    );
  }
}
