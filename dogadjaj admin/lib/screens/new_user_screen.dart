import 'package:flutter/material.dart';
import 'package:dogadjaj_ba/models/user.dart';
import 'package:dogadjaj_ba/providers/user_provider.dart';

class NewUserScreen extends StatefulWidget {
  const NewUserScreen({Key? key}) : super(key: key);

  @override
  _NewUserScreenState createState() => _NewUserScreenState();
}

class _NewUserScreenState extends State<NewUserScreen> {
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
    imePrezimeController = TextEditingController();
    korisnickoImeController = TextEditingController();
    emailController = TextEditingController();
    sifraController = TextEditingController();
    sifraPotvrdaController = TextEditingController();
  }

  @override
  void dispose() {
    imePrezimeController.dispose();
    korisnickoImeController.dispose();
    emailController.dispose();
    sifraController.dispose();
    sifraPotvrdaController.dispose();
    super.dispose();
  }

  Future<bool> saveUser() async {
    if (_formKey.currentState!.validate()) {
      try {
        User newUser = User(
          
          imePrezime: imePrezimeController.text,
          korisnickoIme: korisnickoImeController.text,
          email: emailController.text,
          sifra: sifraController.text,
          sifraPotvrda: sifraPotvrdaController.text,
        );

        bool result = await userProvider.addUser(newUser);
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
    sifraController.clear();
    sifraPotvrdaController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dodaj Korisnika'),
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
              TextFormField(
                controller: sifraController,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Šifra'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Unesite šifru!';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: sifraPotvrdaController,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Potvrda Šifre'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Unesite potvrdu šifre!';
                  }
                  if (value != sifraController.text) {
                    return 'Šifre se ne poklapaju!';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: () async {
                  if (await saveUser()) {
                    clearForm();
                    Navigator.of(context).pop(true);
                  }
                },
                child: const Text('Sačuvaj'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
