import 'package:banu_life/ui/views/anasayfa/anasayfa.dart';
import 'package:banu_life/ui/views/app_sayfa.dart';
import 'package:banu_life/ui/views/arama_sayfa/arama_sayfa.dart';
import 'package:banu_life/ui/views/bildirimler_sayfa/bildirimler_sayfa.dart';
import 'package:banu_life/ui/views/favoriler_sayfa/favoriler_sayfa.dart';
import 'package:banu_life/ui/views/profil_sayfa/profil_sayfa.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


final _routerKey = GlobalKey<NavigatorState>();

// rotalar icin ayrı bir class oluşturuyoruz karışmaması için rotaları tanımliycaz
class AppRoutes{
  AppRoutes._();  // nesne oluşmasını engellemek için ekledik bunu

  /*// Giriş (Login) ve kullanıcı doğrulama sayfaları
  static const String firstPage = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';
  static const String resetPassword = '/reset-password';
  static const String appView = '/app-view';*/

  // Ana sayfa ve kullanıcı ekranları
  static const String anasayfa = '/anasayfa';
  static const String arama = '/arama';
  static const String bildirimler = '/bildirimler';
  static const String favoriler = '/favoriler';
  static const String profil = '/profil';

}


final router = GoRouter(
  navigatorKey: _routerKey,
  initialLocation: AppRoutes.anasayfa,
  routes: [
    StatefulShellRoute.indexedStack(
        builder: (context,state,navigationShell) =>
            AppSayfa(navigationShell: navigationShell,),
        branches: [
          StatefulShellBranch(

            routes: [
              GoRoute(
                path: AppRoutes.anasayfa,
                builder: (context, state) => const Anasayfa(),

              ),
            ],
          ),
          StatefulShellBranch(

            routes: [
              GoRoute(
                path: AppRoutes.arama,
                builder: (context, state) => const AramaSayfa(),

              ),
            ],
          ),
          StatefulShellBranch(

            routes: [
              GoRoute(
                path: AppRoutes.favoriler,
                builder: (context, state) => const FavorilerSayfa(),

              ),
            ],
          ),
          StatefulShellBranch(

            routes: [
              GoRoute(
                path: AppRoutes.bildirimler,
                builder: (context, state) =>  BildirimlerSayfa(),

              ),
            ],
          ),
          StatefulShellBranch(

            routes: [
              GoRoute(
                path: AppRoutes.profil,
                builder: (context, state) =>  ProfilSayfasi(),

              ),

            ],
          )
        ]),
  ],

);