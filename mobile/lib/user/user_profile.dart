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
  late GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<User> users = <User>[];
  List<User> selectedUsers = <User>[];
  late MediaQueryData mediaQueryData;
  final TextEditingController _usernameNameController = TextEditingController();
  final TextEditingController _nameLastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  ValueNotifier<File?> _pickedFileNotifier = ValueNotifier(null);

  final int userId = 0;
  User? user;
  DateTime selectedDate = DateTime.now();
  late UserProvider _userProvider;
  bool isEditing = false;
  int? selectedGender;
  int? selectedRole;
  bool _isActive = false;
  bool _isVerified = false;
  File? _pickedFile;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    mediaQueryData = MediaQuery.of(context);
  }

  @override
  void initState() {
    super.initState();

    _userProvider = context.read<UserProvider>();
    loadUser();
  }

  void loadUser() async {
    var id = _userProvider.getUserId();
    print(id);
    try {
      var usersResponse = await _userProvider.getUserById(id!);
      setState(() {
        user = usersResponse;
      });
    } on Exception catch (e) {
      showErrorDialog(context, e.toString().substring(11));
    }
  }

  void DeleteUser(int id) async {
    try {
      var user = await _userProvider.delete(id);
      if (user == "OK") {}
    } on Exception catch (e) {
      showErrorDialog(context, e.toString().substring(11));
    }
  }

  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    if (user == null) {
      return _buildLoadingIndicator();
    }

    return SafeArea(
      child: Scaffold(
         backgroundColor: kBackgroundColor,
        appBar: AppBar(
          backgroundColor: kBackgroundColor,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white, // Postavite boju strelice za nazad ovdje
            ),
            onPressed: () {
             Navigator.of(context).pop();
            },
          ),
        ),
        body: SizedBox(
          width: mediaQueryData.size.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                
                _buildUserProfile(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: kBackgroundColor,
          body: Center(
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: kBackgroundColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

Widget _buildUserProfile() {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Korisnički podaci',
          style: TextStyle(
            fontSize: 18,  // Adjust the font size as needed
            fontWeight: FontWeight.bold,color: white
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildUserData("IME: ", user?.korisnickoIme ?? "--"),
                _buildUserData("PREZIME: ", user?.imePrezime ?? "--"),
                _buildUserData("EMAIL: ", user?.email ?? "--"),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        //_buildEditUserButton(),
      ],
    ),
  );
}
  Widget _buildUserData(String label, String value) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,color: white
              ),
            ),
            Text(
              value,
              style: TextStyle(fontSize: 14, color: white),
            ),
          ],
        ),
        SizedBox(height: 10),
      ],
    );
  }

  ElevatedButton _buildEditUserButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: teal,
        padding: EdgeInsets.symmetric(horizontal: 15),
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: appTheme.bgSecondary,
              title: Text(
                "Uredi podatke",
                style: TextStyle(color: white, fontSize: 18),
              ),
              // content: AddUserForm(isEditing: true, userToEdit: user),
              actions: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: teal,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Zatvori",
                    style: TextStyle(fontSize: 12, color: white),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: teal,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    if (_formKey.currentState!.validate()) {
                      // editUser(user!.id);
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                      "Spremi",
                      style: TextStyle(color: white, fontSize: 12),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
      child: Text(
        "Uredi profil",
        style: TextStyle(fontSize: 14, color: white),
      ),
    );
  }
}
