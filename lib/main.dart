import 'package:banu_life/app/router.dart';
import 'package:banu_life/app/tema_degistirme.dart';
import 'package:banu_life/app/theme.dart';
import 'package:banu_life/ui/views/anasayfa/anasayfa.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( ChangeNotifierProvider(
    create: (context) => TemaDegistirme(),
    child: const MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TemaDegistirme>(
      builder: (context, tema, child) {
        return MaterialApp.router(
            routerConfig: router, // Eğer router null olabilirse kontrol et
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme:  tema.isDarkMode==true?AppTheme.darkTheme:AppTheme.lightTheme          );
      },
    );
  }
}