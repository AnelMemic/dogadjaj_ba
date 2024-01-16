import 'package:desktop_app/models/event_model.dart';
import 'package:flutter/material.dart';

class DodajDogadjajScreen extends StatelessWidget {
  const DodajDogadjajScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nazivController = TextEditingController();

    String kategorija = mockEventData.first.kategorija,
        podkategorija = mockEventData.first.podkategorija,
        lokacija = mockEventData.first.lokacija;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dodaj Novi Dogadjaj'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: nazivController,
                    decoration: const InputDecoration(labelText: 'Naziv'),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    isDense: true,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(0.0),
                      hintStyle: TextStyle(color: Colors.grey),
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    focusColor: Colors.transparent,
                    value: kategorija,
                    onChanged: (String? newValue) {},
                    items: mockEventData.map((event) {
                      return DropdownMenuItem<String>(
                        value: event.kategorija,
                        child: Text(event.kategorija),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    isDense: true,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(0.0),
                      hintStyle: TextStyle(color: Colors.grey),
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    focusColor: Colors.transparent,
                    value: podkategorija,
                    onChanged: (String? newValue) {},
                    items: mockEventData.map((event) {
                      return DropdownMenuItem<String>(
                        value: event.podkategorija,
                        child: Text(event.podkategorija),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    isDense: true,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(0.0),
                      hintStyle: TextStyle(color: Colors.grey),
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    focusColor: Colors.transparent,
                    value: lokacija,
                    onChanged: (String? newValue) {},
                    items: mockEventData.map((event) {
                      return DropdownMenuItem<String>(
                        value: event.lokacija,
                        child: Text(event.lokacija),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    isDense: true,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(0.0),
                      hintStyle: TextStyle(color: Colors.grey),
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    focusColor: Colors.transparent,
                    value: kategorija,
                    onChanged: (String? newValue) {},
                    items: mockEventData.map((event) {
                      return DropdownMenuItem<String>(
                        value: event.kategorija,
                        child: Text(event.kategorija),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle image upload
                    },
                    child: const Text('Upload Image'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
