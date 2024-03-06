import 'package:dogadjaj_ba/models/event.dart';
import 'package:dogadjaj_ba/providers/eventprovider.dart';
import 'package:dogadjaj_ba/screens/dodaj_dogadjaj_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DogadjajiScreen extends StatefulWidget {
  const DogadjajiScreen({Key? key}) : super(key: key);

  @override
  State<DogadjajiScreen> createState() => _DogadjajiScreenState();
}

class _DogadjajiScreenState extends State<DogadjajiScreen> {
  TextEditingController searchController = TextEditingController(text: '');
  final ScrollController controller = ScrollController();
  final EventProvider eventProvider = EventProvider();
  String searchEventName = ''; 

  @override
  void dispose() {
    searchController.dispose();
    controller.dispose();
    super.dispose();
  }

  void _openAddEventScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const DodajDogadjajScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dogadjaji'),
        actions: [
          IconButton(
            onPressed: () {
              _openAddEventScreen(context);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Filter po EventName:'),
                const SizedBox(width: 8.0),
                Expanded(
                  child: TextField(
                    controller: searchController,
                    onChanged: (value) {
                      setState(() {
                        searchEventName = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Unesi ime eventa...',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: Scrollbar(
                controller: controller,
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context)
                      .copyWith(dragDevices: {PointerDeviceKind.mouse}),
                  child: SingleChildScrollView(
                    controller: controller,
                    child: FutureBuilder<List<Event>>(
                      future: eventProvider.get(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else {
                          List<Event> events = snapshot.data ?? [];

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
                              DataColumn(label: Text('Naziv')),
                              DataColumn(label: Text('Datum')),
                              DataColumn(label: Text('Kategorija')),
                              DataColumn(label: Text('Opis')),
                            ],
                            rows: events
                                .where((event) =>
                                    searchEventName.isEmpty ||
                                    event.eventName!.toLowerCase().contains(
                                        searchEventName.toLowerCase()))
                                .map(
                                  (event) => DataRow(
                                    cells: [
                                      DataCell(Text(event.eventName ?? 'N/A')),
                                      DataCell(Text(
                                          event.eventDate.toString() ?? 'N/A')),
                                      DataCell(Text(
                                          EventCategoryMapper.mapCategory(
                                                  event.eventType!) ??
                                              'N/A')),
                                      DataCell(Text(event.opis ?? 'N/A')),
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
            ),
          ],
        ),
      ),
    );
  }
}
