import 'package:desktop_app/models/event_model.dart';
import 'package:desktop_app/screens/dodaj_dogadjaj_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DogadjajiScreen extends StatefulWidget {
  const DogadjajiScreen({Key? key}) : super(key: key);

  @override
  State<DogadjajiScreen> createState() => _DogadjajiScreenState();
}

class _DogadjajiScreenState extends State<DogadjajiScreen> {
  TextEditingController searchController =
      TextEditingController(text: 'Search');
  var dropdownValue = mockEventData.first.kategorija;
  final ScrollController controller = ScrollController();

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
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: TextFormField(
                  controller: searchController,
                  decoration: const InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                flex: 2,
                child: DropdownButtonFormField<String>(
                  isDense: true,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(0.0),
                    hintStyle: TextStyle(color: Colors.grey),
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  focusColor: Colors.transparent,
                  value: dropdownValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue.toString();
                    });
                  },
                  items: mockEventData.map((event) {
                    return DropdownMenuItem<String>(
                      value: event.kategorija,
                      child: Text(event.kategorija),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    _openAddEventScreen(context);
                  },
                  child: const Text('Dodaj'),
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
                      DataColumn(label: Text('Naziv')),
                      DataColumn(label: Text('Datum')),
                      DataColumn(label: Text('Kategorija')),
                      DataColumn(label: Text('Podkategorija')),
                      DataColumn(label: Text('Lokacija')),
                      DataColumn(label: Text('Slika')),
                    ],
                    rows: mockEventData
                        .map(
                          (event) => DataRow(
                            cells: [
                              DataCell(Text(event.naziv)),
                              DataCell(Text(event.datum)),
                              DataCell(Text(event.kategorija)),
                              DataCell(Text(event.podkategorija)),
                              DataCell(Text(event.lokacija)),
                              DataCell(Text(event.slika)),
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
