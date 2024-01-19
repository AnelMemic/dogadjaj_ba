import 'dart:ui';

import 'package:dogadjaj_ba/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:dogadjaj_ba/models/ticket_model.dart';
import 'package:dogadjaj_ba/providers/baseprovider.dart';
import 'package:dogadjaj_ba/providers/ticket_provider.dart';

class KarteScreen extends StatefulWidget {
  const KarteScreen({Key? key}) : super(key: key);

  @override
  State<KarteScreen> createState() => _KarteScreenState();
}

class _KarteScreenState extends State<KarteScreen> {
  final ScrollController controller = ScrollController();
  final TicketProvider ticketProvider = TicketProvider();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Ticket>>(
      future: ticketProvider
          .get(), // Assuming 'get' method fetches a list of tickets
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          List<Ticket> tickets = snapshot.data ?? [];

          return Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pregled karata",
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
                            DataColumn(label: Text('Ticket ID')),
                            DataColumn(label: Text('User ID')),
                            DataColumn(label: Text('Event ID')),
                            DataColumn(label: Text('Price')),
                          ],
                          rows: tickets
                              .map(
                                (ticket) => DataRow(
                                  cells: [
                                    DataCell(Text(ticket.ticketId.toString())),
                                    DataCell(Text(ticket.userId.toString())),
                                    DataCell(Text(ticket.eventId.toString())),
                                    DataCell(Text(
                                        ticket.cijena?.toString() ?? 'N/A')),
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
      },
    );
  }
}
