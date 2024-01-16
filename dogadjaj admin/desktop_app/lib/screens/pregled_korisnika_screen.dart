import 'dart:ui';

import 'package:desktop_app/models/user_model.dart';
import 'package:flutter/material.dart';

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
                      DataColumn(label: Text('Username')),
                      DataColumn(label: Text('Email')),
                      // DataColumn(label: Text('Role')),
                    ],
                    rows: mockUsers
                        .map(
                          (user) => DataRow(
                            cells: [
                              DataCell(Text(user.username)),
                              DataCell(Text(user.email)),
                              DataCell(Text(user.role)),
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
    );
  }
}
