import 'package:dogadjaj_ba/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dogadjaj_ba/screens/app_routes.dart';
import 'package:dogadjaj_ba/providers/eventprovider.dart';
import 'package:dogadjaj_ba/providers/notification_provider.dart';
import 'package:dogadjaj_ba/providers/post_provider.dart';
import 'package:dogadjaj_ba/providers/ticket_provider.dart';
import 'package:dogadjaj_ba/providers/user_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => EventProvider()),
        ChangeNotifierProvider(create: (_) => TicketProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => NotificationProvider()),
        ChangeNotifierProvider(create: (_) => PostProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      home: const LoginScreen(),
      routes: AppRoutes.routes,
    );
  }
}

class MyHomePage extends StatefulWidget {
   static const String routeName = '/main.dart';
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushNamed(context, AppRoutes.dogadjajiScreen);
        break;
      case 1:
        Navigator.pushNamed(context, AppRoutes.pregledKorisnikaScreen);
        break;
      case 2:
        Navigator.pushNamed(context, AppRoutes.karteScreen);
        break;
      case 3:
        Navigator.pushNamed(context, AppRoutes.izvjestajScreen);
        break;
      case 4:
        Navigator.pushNamed(context, AppRoutes.notificationsScreen);
        break;
      case 5:
        Navigator.pushNamed(context, AppRoutes.postScreen);
        break;
    }
  }

  void logOut() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        actions: [
          TextButton(
            onPressed: () {
              onNavItemTapped(0);
            },
            child: const Text(
              'Dogadjaji',
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () {
              onNavItemTapped(1);
            },
            child: const Text('Pregled Korisnika',
                style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () {
              onNavItemTapped(2);
            },
            child: const Text('Karte',
                style: TextStyle(
                  color: Colors.white,
                )),
          ),
          TextButton(
            onPressed: () {
              onNavItemTapped(3);
            },
            child: const Text('Izvjestaj',
                style: TextStyle(
                  color: Colors.white,
                )),
          ),
          TextButton(
            onPressed: () {
              onNavItemTapped(4);
            },
            child: const Text('Obavijesti',
                style: TextStyle(
                  color: Colors.white,
                )),
          ),
          TextButton(
            onPressed: () {
              onNavItemTapped(5);
            },
            child: const Text('Postovi',
                style: TextStyle(
                  color: Colors.white,
                )),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,  // Center everything vertically
        crossAxisAlignment: CrossAxisAlignment.center,  // Center everything horizontally
        children: [
          const Center(
            child: Text(
              'Welcome to Dogadjaj.ba desktop app ',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
          const SizedBox(height: 40),
          // Center the Log Out button
          ElevatedButton.icon(
            onPressed: logOut,
            icon: const Icon(Icons.logout),
            label: const Text('Log Out'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.yellow,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
          ),
        ],
      ),
    );
  }
}
