import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/helpers/app_decoration.dart';
import 'package:mobile/helpers/error_dialog.dart';
import 'package:mobile/helpers/theme_helper.dart';
import 'package:mobile/models/user.dart';
import 'package:mobile/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  late GlobalKey<FormState> _formKey;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  
  User? user;
  late UserProvider _userProvider;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _userProvider = context.read<UserProvider>();
    loadUser();
  }

  void loadUser() async {
    var id = _userProvider.getUserId();
    try {
      var usersResponse = await _userProvider.getUserById(id!);
      setState(() {
        user = usersResponse;
        _usernameController.text = user?.korisnickoIme ?? "";
        _nameController.text = user?.imePrezime ?? "";
        _emailController.text = user?.email ?? "";
      });
    } on Exception catch (e) {
      showErrorDialog(context, e.toString().substring(11));
    }
  }

  // void updateUser() async {
  //   if (_formKey.currentState!.validate()) {
  //     try {
  //       var updatedUser = User(
  //         id: user!.id,
  //         korisnickoIme: _usernameController.text.trim(),
  //         imePrezime: _nameController.text.trim(),
  //         email: _emailController.text.trim(),
  //       );

  //       await _userProvider.updateUser(updatedUser);
  //       setState(() {
  //         user = updatedUser;
  //       });

  //       Navigator.of(context).pop();
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text("Podaci uspješno ažurirani!")),
  //       );
  //     } on Exception catch (e) {
  //       showErrorDialog(context, "Greška prilikom ažuriranja: ${e.toString()}");
  //     }
  //   }
  // }
void updateUser() async {
  if (_formKey.currentState!.validate()) {
    try {
      var updatedUser = User(
        id: user!.id,
        korisnickoIme: _usernameController.text.trim(),
        imePrezime: _nameController.text.trim(),
        email: _emailController.text.trim(),
      );

      await _userProvider.updateUser(updatedUser);

      if (mounted) {
        setState(() {
          user = updatedUser;
        });

        // ✅ Zatvara popup pomoću Navigator.of(context, rootNavigator: true).pop();
        Navigator.of(context, rootNavigator: true).pop();

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Podaci uspješno ažurirani!")),
        );
      }
    } on Exception catch (e) {
      if (mounted) {
        showErrorDialog(context, "Greška prilikom ažuriranja: ${e.toString()}");
      }
    }
  }
}


  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return _buildLoadingIndicator();
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Korisnički podaci", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 8),
            _buildUserData("IME: ", user?.korisnickoIme ?? "--"),
            _buildUserData("PREZIME: ", user?.imePrezime ?? "--"),
            _buildUserData("EMAIL: ", user?.email ?? "--"),
            const SizedBox(height: 16),
            _buildEditUserButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildUserData(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Text(label, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)),
          Text(value, style: TextStyle(fontSize: 14, color: Colors.white)),
        ],
      ),
    );
  }

  Widget _buildEditUserButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.teal,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      onPressed: () => _showEditDialog(),
      child: Text("Uredi profil", style: TextStyle(fontSize: 14, color: Colors.white)),
    );
  }

  void _showEditDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey[900],
          title: Text("Uredi podatke", style: TextStyle(color: Colors.white, fontSize: 18)),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildTextField("Ime", _usernameController),
                _buildTextField("Prezime", _nameController),
                _buildTextField("Email", _emailController),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Zatvori", style: TextStyle(color: Colors.red)),
            ),
            ElevatedButton(
              onPressed: updateUser,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
              child: Text("Spremi", style: TextStyle(color: Colors.white)),
              
            ),
          ],
        );
      },
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        controller: controller,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.white70),
          filled: true,
          fillColor: Colors.black45,
          border: OutlineInputBorder(),
        ),
        validator: (value) => value!.isEmpty ? "Unesite $label" : null,
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: CircularProgressIndicator(color: Colors.white),
      ),
    );
  }
}