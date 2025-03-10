import 'package:banu_life/ui/views/arama_sayfa/arama_sayfa.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppSayfa extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const AppSayfa({super.key, required this.navigationShell});

  @override
  State<AppSayfa> createState() => _AppSayfaState();
}

class _AppSayfaState extends State<AppSayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          backgroundColor: Theme.of(context).colorScheme.primary,
          labelTextStyle: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return TextStyle(color: Theme.of(context).colorScheme.primary);
            }
            return TextStyle(color: Theme.of(context).colorScheme.secondary);
          }),
        ),
        child: NavigationBar(
          selectedIndex: widget.navigationShell.currentIndex,
          onDestinationSelected: (int index) {
            if (index == 1) {
              // Arama sayfasına yönlendirme
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AramaSayfa()),
              );
            } else {
              // Diğer sayfalar için navigasyonu yönet
              widget.navigationShell.goBranch(index);
            }
          },
          indicatorColor: Colors.transparent,
          destinations: [
            _menuItem(context, index: 0, currentIndex: widget.navigationShell.currentIndex, label: 'Anasayfa', icon: Icons.home),
            _menuItem(context, index: 1, currentIndex: widget.navigationShell.currentIndex, label: 'Arama', icon: Icons.search),
            _menuItem(context, index: 2, currentIndex: widget.navigationShell.currentIndex, label: 'Favoriler', icon: Icons.bookmark),
            _menuItem(context, index: 3, currentIndex: widget.navigationShell.currentIndex, label: 'Bildirimler', icon: Icons.notifications),
            _menuItem(context, index: 4, currentIndex: widget.navigationShell.currentIndex, label: 'Profil', icon: Icons.person),
          ],
        ),
      ),
    );
  }
}

Widget _menuItem(BuildContext context, {
  required int index,
  required int currentIndex,
  required String label,
  required IconData icon,
}) {
  return NavigationDestination(
    icon: Icon(
      icon,
      color: currentIndex == index
          ? Theme.of(context).colorScheme.secondary
          : Theme.of(context).colorScheme.tertiary,
    ),
    label: label,
  );
}

