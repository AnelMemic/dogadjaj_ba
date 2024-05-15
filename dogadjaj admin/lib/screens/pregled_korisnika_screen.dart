import 'dart:ui';

import 'package:dogadjaj_ba/models/user.dart';
import 'package:flutter/material.dart';
import 'package:dogadjaj_ba/providers/user_provider.dart';

class PregledKorisnikaScreen extends StatefulWidget {
  const PregledKorisnikaScreen({Key? key}) : super(key: key);

  @override
  State<PregledKorisnikaScreen> createState() => _PregledKorisnikaScreenState();
}

class _PregledKorisnikaScreenState extends State<PregledKorisnikaScreen> {
  final ScrollController controller = ScrollController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                child: FutureBuilder<List<User>>(
                  future:
                      UserProvider().getAll(), // Assuming getAll fetches users
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else {
                      List<User> users = snapshot.data ?? [];

                      return DataTable(
                        border: const TableBorder(
                          right: BorderSide(),
                          left: BorderSide(),
                          top: BorderSide(),
                          bottom: BorderSide(),
                          verticalInside: BorderSide(),
                          horizontalInside: BorderSide(),
                        ),
                        columns: const [
                          DataColumn(label: Text('Korisnicko ime')),
                          DataColumn(label: Text('Email')),
                        ],
                        rows: users
                            .map(
                              (user) => DataRow(
                                cells: [
                                  DataCell(Text(user.korisnickoIme)),
                                  DataCell(Text(user.email)),
                                ],
                              ),
                            )
                            .toList(),
                      );
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
