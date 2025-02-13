import 'package:flutter/material.dart';
import 'package:dogadjaj_ba/models/user.dart';
import 'package:dogadjaj_ba/providers/user_provider.dart';

class EditUserScreen extends StatefulWidget {
  final User? user;

  const EditUserScreen({Key? key, this.user}) : super(key: key);

  @override
  _EditUserScreenState createState() => _EditUserScreenState();
}

class _EditUserScreenState extends State<EditUserScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final UserProvider userProvider = UserProvider();

  late TextEditingController imePrezimeController;
  late TextEditingController korisnickoImeController;
  late TextEditingController emailController;
  late TextEditingController sifraController;
  late TextEditingController sifraPotvrdaController;

  @override
  void initState() {
    super.initState();
    imePrezimeController = TextEditingController(text: widget.user?.imePrezime ?? '');
    korisnickoImeController = TextEditingController(text: widget.user?.korisnickoIme ?? '');
    emailController = TextEditingController(text: widget.user?.email ?? '');
    
  }

  @override
  void dispose() {
    imePrezimeController.dispose();
    korisnickoImeController.dispose();
    emailController.dispose();
   
    super.dispose();
  }

  Future<bool> saveUser() async {
    if (_formKey.currentState!.validate()) {
      try {
        User newUser = User(
          id: widget.user?.id ?? 0,
          imePrezime: imePrezimeController.text,
          korisnickoIme: korisnickoImeController.text,
          email: emailController.text,
   
        );

        bool result;
        if (widget.user == null) {
          result = await userProvider.addUser(newUser);
        } else {
          result = await userProvider.updateUser(widget.user!.id!, newUser);
        }

        return result;
      } catch (e) {
        return false;
      }
    }
    return false;
  }

  void clearForm() {
    imePrezimeController.clear();
    korisnickoImeController.clear();
    emailController.clear();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user == null ? 'Dodaj Korisnika' : 'Uredi Korisnika'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: imePrezimeController,
                decoration: const InputDecoration(labelText: 'Ime Prezime'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Unesite ime i prezime!';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: korisnickoImeController,
                decoration: const InputDecoration(labelText: 'Korisnicko Ime'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Unesite korisnicko ime!';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Unesite email!';
                  }
                  if (!value.contains('@')) {
                    return 'Email mora sadržavati @!';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
            
              const SizedBox(height: 16.0),
              
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: () async {
                  if (await saveUser()) {
                    clearForm();
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
