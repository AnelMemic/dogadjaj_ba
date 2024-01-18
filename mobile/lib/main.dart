import 'dart:io';
import 'package:dogadjaj_ba/helpers/my_overrides.dart';
import 'package:dogadjaj_ba/providers/ticket_provider.dart';
import 'package:dogadjaj_ba/providers/user_provider.dart';
import 'package:dogadjaj_ba/route/rutes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
 

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  ///Please update theme as per your need if required.
 
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
    MultiProvider(
      providers: [
         ChangeNotifierProvider(create: (_) => UserProvider()),
         ChangeNotifierProvider(create: (_) => TicketProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData.light(),
        themeMode: ThemeMode.light,
        darkTheme: ThemeData.light(),
        title: 'DogadjajBa',
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.startScreen,
        routes: AppRoutes.routes,
      ),
    );
  }
}
