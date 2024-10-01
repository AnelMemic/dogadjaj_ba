import 'package:dogadjaj_ba/main.dart';
import 'package:dogadjaj_ba/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:dogadjaj_ba/screens/add_post_screen.dart';
import 'package:dogadjaj_ba/screens/add_ticket_screen.dart';
import 'package:dogadjaj_ba/screens/dodaj_dogadjaj_screen.dart';
import 'package:dogadjaj_ba/screens/dodaj_notifikaciju_screen.dart';
import 'package:dogadjaj_ba/screens/dogadjaji_screen.dart';
import 'package:dogadjaj_ba/screens/edit_event_screen.dart';
import 'package:dogadjaj_ba/screens/edit_post_screen.dart';
import 'package:dogadjaj_ba/screens/edit_user_screen.dart';
import 'package:dogadjaj_ba/screens/izvjestajscreen.dart';
import 'package:dogadjaj_ba/screens/karte_screen.dart';
import 'package:dogadjaj_ba/screens/notifications_screen.dart';
import 'package:dogadjaj_ba/screens/post_screen.dart';
import 'package:dogadjaj_ba/screens/pregled_korisnika_screen.dart';
import 'package:dogadjaj_ba/init_screen/init_screen.dart';


class AppRoutes {
  static const String initScreen = '/init_screen';
  static const String loginScreen = '/login_screen';
  static const String registrationScreen = '/registration_screen';
  static const String dogadjajiScreen = '/dogadjaji_screen';
  static const String pregledKorisnikaScreen = '/pregled_korisnika_screen';
  static const String karteScreen = '/karte_screen';
  static const String izvjestajScreen = '/izvjestaj_screen';
  static const String notificationsScreen = '/notifications_screen';
  static const String postScreen = '/post_screen';
  static const String addPostScreen = '/add_post_screen';
  static const String addTicketScreen = '/add_ticket_screen';
  static const String dodajDogadjajScreen = '/dodaj_dogadjaj_screen';
  static const String dodajNotifikacijuScreen = '/dodaj_notifikaciju_screen';
  static const String editEventScreen = '/edit_event_screen';
  static const String editPostScreen = '/edit_post_screen';
  static const String editUserScreen = '/edit_user_screen';
   static const String homeScreen = '/main'; 

  

  static Map<String, WidgetBuilder> routes = {
    initScreen: (context) => const InitScreen(),
    loginScreen: (context) => const LoginScreen(),
    dogadjajiScreen: (context) => const DogadjajiScreen(),
    pregledKorisnikaScreen: (context) => const PregledKorisnikaScreen(),
    karteScreen: (context) => const KarteScreen(),
    izvjestajScreen: (context) => IzvjestajWidget(),
    notificationsScreen: (context) => NotificationsScreen(),
    postScreen: (context) => PostScreen(),
    addPostScreen: (context) => AddPostScreen(),
    addTicketScreen: (context) => AddTicketScreen(),
    dodajDogadjajScreen: (context) => DodajDogadjajScreen(),
    dodajNotifikacijuScreen: (context) => DodajNotifikacijuScreen(),
 homeScreen: (context) => const MyHomePage(),
    editUserScreen: (context) => EditUserScreen(),
  };
}
