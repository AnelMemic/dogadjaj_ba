import 'dart:ui';
import 'package:dogadjaj_ba/screens/new_user_screen.dart';
import 'package:flutter/material.dart';
import 'package:dogadjaj_ba/models/user.dart';
import 'package:dogadjaj_ba/providers/user_provider.dart';
import 'package:dogadjaj_ba/screens/edit_user_screen.dart';

class PregledKorisnikaScreen extends StatefulWidget {
  const PregledKorisnikaScreen({Key? key}) : super(key: key);

  @override
  _PregledKorisnikaScreenState createState() => _PregledKorisnikaScreenState();
}

class _PregledKorisnikaScreenState extends State<PregledKorisnikaScreen> {
  final ScrollController controller = ScrollController();
  final UserProvider userProvider = UserProvider();
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> fetchUsers() async {
    try {
      List<User> fetchedUsers = await userProvider.getAll();
      setState(() {
        users = fetchedUsers;
      });
    } catch (e) {
    
    }
  }

  void _openEditUserScreen(BuildContext context, User? user) async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EditUserScreen(user: user),
      ),
    );

    if (result == true) {
      
      fetchUsers();
    }
  }
void _openNewUserScreen(BuildContext context, User? user) async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => NewUserScreen(),
      ),
    );

    if (result == true) {
      
      fetchUsers();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pregled korisnika'),
        actions: [
          TextButton.icon(
            icon: Icon(Icons.add, size: 24.0),
            label: Text('Add User', style: TextStyle(fontSize: 18.0)),
            onPressed: () {
              _openNewUserScreen(context, null);
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.white, // Text color
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Pregled korisnika",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Scrollbar(
                controller: controller,
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context)
                      .copyWith(dragDevices: {PointerDeviceKind.mouse}),
                  child: SingleChildScrollView(
                    controller: controller,
                    child: DataTable(
                      border: const TableBorder(
                        right: BorderSide(),
                        left: BorderSide(),
                        top: BorderSide(),
                        bottom: BorderSide(),
                        verticalInside: BorderSide(),
                        horizontalInside: BorderSide(),
                      ),
                      columns: const [
                        DataColumn(label: Text('Ime Prezime')),
                        DataColumn(label: Text('Korisnicko ime')),
                        DataColumn(label: Text('Email')),
                        DataColumn(label: Text('Edit')),
                      ],
                      rows: users
                          .map(
                            (user) => DataRow(
                              cells: [
                                DataCell(Text(user.imePrezime)),
                                DataCell(Text(user.korisnickoIme)),
                                DataCell(Text(user.email)),
                                DataCell(
                                  IconButton(
                                    icon: Icon(Icons.edit),
                                    onPressed: () {
                                      _openEditUserScreen(context, user);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
