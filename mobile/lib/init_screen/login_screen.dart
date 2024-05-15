import 'package:flutter/material.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/custom%20widgets/app_bar_widget.dart';
import 'package:mobile/helpers/app_decoration.dart';
import 'package:mobile/helpers/costum_text_field.dart';
import 'package:mobile/helpers/custom_text_style.dart';
import 'package:mobile/helpers/error_dialog.dart';
import 'package:mobile/providers/user_provider.dart';
import 'package:mobile/route/rutes.dart';
import 'package:provider/provider.dart';
import '../custom widgets/logo_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernmeController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  late UserProvider userProvider;

  @override
  void initState() {
    super.initState();
    userProvider = context.read<UserProvider>();
  }

  //TODO
  void login() async {
    try {
      await userProvider.loginAsync(
          _usernmeController.text, _passwordController.text);
      if (context.mounted) {
        Navigator.pushReplacementNamed(context, AppRoutes.homeContainerScreen);
      }
    } on Exception catch (e) {
      showErrorDialog(context, getErrorMessage(e));
      print(e);
    }
  }

  String getErrorMessage(dynamic exception) {
    if (exception.toString().contains('GymFit.Core.UserNotFoundException') ||
        exception.toString().contains('UserWrongCredentialsException')) {
      return 'Neispravni korisnički podaci. Pokušajte ponovo.';
    } else if (exception
        .toString()
        .contains('The remote computer refused the network connection')) {
      return 'Došlo je do greške na serveru. Pokušajte kasnije.';
    } else {
      return 'Došlo je do nepoznate greške. Pokušajte ponovo.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const LogoWidget(),
            gapH64,
            Center(
              child: Text(
                'Prijava'.toUpperCase(),
                style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 45),
              ),
            ),
            gapH64,
            Center(
                child: Container(
              width: 300,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 20),
                  _buildUserNameField(context),
                  const SizedBox(height: 20),
                  _buildPasswordField(context),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 260,
                    child: ElevatedButton(
                      onPressed: () {
                        login();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                      child: Text(
                        'Prijava'.toUpperCase(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const Text(
                    'Zaboravili ste šifru?',
                    style: TextStyle(color: Color.fromARGB(255, 97, 97, 97)),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildUserNameField(BuildContext context) {
    return CustomTextFormField(
      controller: _usernmeController,
      fillColor: const Color.fromRGBO(225, 225, 225, 100),
      contentPadding:
          const EdgeInsets.only(left: 18, right: 18, bottom: 14, top: 14),
      hintText: "username",
      textInputType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Unesite vaše korisnicko ime.';
        }
        return null;
      },
    );
  }

  Widget _buildPasswordField(BuildContext context) {
    return CustomTextFormField(
      fillColor: const Color.fromRGBO(225, 225, 225, 100),
      contentPadding:
          const EdgeInsets.only(left: 18, right: 18, bottom: 14, top: 14),
      suffix: IconButton(
        icon: _obscurePassword
            ? const Icon(
                Icons.visibility_outlined,
                color: Color.fromARGB(255, 53, 53, 53),
              )
            : const Icon(
                Icons.visibility_off_outlined,
                color: Color.fromARGB(255, 53, 53, 53),
              ),
        onPressed: () {
          setState(() {
            _obscurePassword = !_obscurePassword;
          });
        },
      ),
      controller: _passwordController,
      hintText: ".......",
      obscureText: _obscurePassword,
      textInputType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Obavezan unos polja';
        }
        return null;
      },
    );
  }
}
