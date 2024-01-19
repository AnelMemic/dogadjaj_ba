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
        body: SizedBox(
          width: mediaQueryData.size.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: double.maxFinite,
                  decoration: AppDecoration.fillBlack,
                  child: Text(
                    "Korisnički profil",
                    style: TextStyle(fontSize: 14, color: white),
                  ),
                ),
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
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Container(
                    width: 90,
                    height: 120,
                    color: primary,
                    // child: FutureBuilder<String>(
                    //   future: user?.photo?.guidId != null
                    //       ? loadPhoto(user!.photo!.guidId!)
                    //       : null, // Check if user?.photo is not null before calling loadPhoto
                    //   builder: (BuildContext context,
                    //       AsyncSnapshot<String> snapshot) {
                    //     final imageUrl = snapshot.data;

                    //     return FadeInImage(
                    //       image: imageUrl != null && imageUrl.isNotEmpty
                    //           ? NetworkImage(
                    //               imageUrl,
                    //               headers: Authorization.createHeaders(),
                    //             )
                    //           : AssetImage('assets/images/notFound.png')
                    //               as ImageProvider<Object>,
                    //       placeholder: MemoryImage(kTransparentImage),
                    //       fadeInDuration: const Duration(milliseconds: 100),
                    //       fit: BoxFit.cover,
                    //     );
                    //   },
                    // ),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildUserData("", user?.korisnickoIme ?? "--"),
                  _buildUserData("", user?.imePrezime ?? "--"),
                  _buildUserData("Email: ", user?.email ?? "--"),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          _buildEditUserButton(),
        
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
                fontWeight: FontWeight.normal,
              ),
            ),
            Text(
              value,
              style: TextStyle(fontSize: 14),
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
