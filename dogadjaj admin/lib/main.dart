import 'package:desktop_app/custom_container.dart';
import 'package:desktop_app/screens/dogadjaji_screen.dart';
import 'package:desktop_app/screens/karte_screen.dart';
import 'package:desktop_app/screens/pregled_korisnika_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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

  Widget _buildIzvjestajScreen() {
    return const SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(28.0),
          child: Row(
            children: [
              CustomContainer(count: 2, title: 'Dogadjaji'),
              SizedBox(width: 20),
              CustomContainer(count: 2, title: 'Karte'),
              SizedBox(width: 20),
              CustomContainer(count: 2, title: 'Useri'),
            ],
          ),
        ),
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
          return _buildIzvjestajScreen();
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
        actions: [
          TextButton(
            onPressed: () {
              onNavItemTapped(0);
            },
            child: const Text(
              'Dogadjaji',
              style: TextStyle(color: Colors.red),
            ),
          ),
          TextButton(
            onPressed: () {
              onNavItemTapped(1);
            },
            child: const Text('Pregled Korisnika',
                style: TextStyle(color: Colors.red)),
          ),
          TextButton(
            onPressed: () {
              onNavItemTapped(2);
            },
            child: const Text('Karte',
                style: TextStyle(
                  color: Colors.red,
                )),
          ),
          TextButton(
            onPressed: () {
              onNavItemTapped(3);
            },
            child: const Text('Izvjestaj',
                style: TextStyle(
                  color: Colors.red,
                )),
          ),
        ],
      ),
      body: buildScreen(),
    );
  }
}
