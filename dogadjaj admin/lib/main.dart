import 'package:dogadjaj_ba/custom_container.dart';
import 'package:dogadjaj_ba/providers/dataprovider.dart';
import 'package:dogadjaj_ba/providers/eventprovider.dart';
import 'package:dogadjaj_ba/providers/ticket_provider.dart';
import 'package:dogadjaj_ba/providers/user_provider.dart';
import 'package:dogadjaj_ba/screens/dogadjaji_screen.dart';
import 'package:dogadjaj_ba/screens/izvjestajscreen.dart';
import 'package:dogadjaj_ba/screens/karte_screen.dart';
import 'package:dogadjaj_ba/screens/pregled_korisnika_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => EventProvider()),
    ChangeNotifierProvider(create: (_) => TicketProvider()),
    ChangeNotifierProvider(create: (_) => UserProvider()),
    // ChangeNotifierProvider(create: (_) => DataProvider()),
  ], child: MyApp()));
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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _buildKarteScreen() {
    return Container(
      child: Center(
        child: Text('Karte Screen'),
      ),
    );
  }

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget buildScreen() {
      switch (_selectedIndex) {
        case 0:
          return const DogadjajiScreen();
        case 1:
          return const PregledKorisnikaScreen();
        case 2:
          return const KarteScreen();
        case 3:
          return IzvjestajWidget();
        default:
          return Container();
      }
    }

    void onNavItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

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
        ],
      ),
      body: buildScreen(),
    );
  }
}
