import 'package:dogadjaj_ba/models/post.dart';
import 'package:dogadjaj_ba/providers/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dogadjaj_ba/models/event.dart';
import 'package:dogadjaj_ba/providers/eventprovider.dart';
import 'package:dogadjaj_ba/helpers/erorrDialog.dart';
import 'dart:developer' as developer;

class EditPostScreen extends StatefulWidget {
  final Post event;

  const EditPostScreen({Key? key, required this.event}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EditPostScreenState createState() => _EditPostScreenState();
}

class _EditPostScreenState extends State<EditPostScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final EventProvider eventProvider = EventProvider();
  late PostProvider postProvider = PostProvider();

  late TextEditingController nameController;
  late TextEditingController descriptionController;
  late TextEditingController eventDateController;
  late int selectedEventType;
  late int selectedsubEventType;
  late int? lokacijaId;
  DateTime endDate = DateTime.now();
  List<Map<String, dynamic>> locations = [];

  @override
  void initState() {
    super.initState();
    postProvider = PostProvider();

    nameController = TextEditingController(text: widget.event.title);
    descriptionController = TextEditingController(text: widget.event.content);
    eventDateController = TextEditingController(
        text: DateFormat('yyyy-MM-dd').format(widget.event.publishDate!));
  }

 

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    eventDateController.dispose();
    super.dispose();
  }

  Future<bool> updatePost() async {
    if (_formKey.currentState!.validate()) {
      try {
         var post = {
        "id": 0,
        "title": nameController.text,
        "content": descriptionController.text,
        "publishDate": DateTime.now().toUtc().toIso8601String(),
      };

        

        var result = await postProvider.edit(post, widget.event.id);
        if (result != null) {
          return true;
        }
        return false;
      } on Exception catch (e) {
        showErrorDialog(context, e.toString().substring(11));
        return false;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Uredi Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Naslov'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Unesite naslov!';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Sadrzaj'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Unesite sadrzaj!';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: eventDateController,
                decoration: const InputDecoration(
                  labelText: 'Datum',
                  hintText: 'Odaberite datum',
                ),
                onTap: () {
                  showDatePicker(
                    context: context,
                    initialDate: endDate,
                    firstDate: DateTime(1950),
                    lastDate: DateTime(2101),
                  ).then((date) {
                    if (date != null) {
                      setState(() {
                        endDate = date;
                        eventDateController.text =
                            DateFormat('yyyy-MM-dd').format(date);
                      });
                    }
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Unesite datum!';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
         
            
              const SizedBox(
                height: 25,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (await updatePost()) {
                    Navigator.of(context).pop(true);
                  }
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
