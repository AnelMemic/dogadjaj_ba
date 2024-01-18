import 'package:dogadjaj_ba/helpers/app_decoration.dart';
import 'package:dogadjaj_ba/helpers/costum_text_field.dart';
import 'package:dogadjaj_ba/helpers/custom_text_style.dart';
import 'package:dogadjaj_ba/helpers/error_dialog.dart';
import 'package:dogadjaj_ba/models/register.dart';
import 'package:dogadjaj_ba/models/user.dart';
import 'package:dogadjaj_ba/providers/user_provider.dart';
import 'package:dogadjaj_ba/route/rutes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../custom widgets/app_bar_widget.dart';
import '../custom widgets/custom_text_field_widget.dart';
import '../custom widgets/logo_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  late UserProvider _userProvider;
  @override
  void initState() {
    super.initState();
    _userProvider = context.read<UserProvider>();
  }

  void register() async {
    try {
      var newUser = Register(
        imePrezime: _nameController.text,
        korisnickoIme: _usernameController.text,
        email: _emailController.text,
        sifra: _passwordController.text,
        sifraPotvrda: _confirmPasswordController.text,
      );

      var insertedUser = await _userProvider.insert(newUser);
      Navigator.pushNamed(context, AppRoutes.loginScreen);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              backgroundColor: Color(0XFF12B422),
              content: Text('Registracija uspješna.',
                  style: TextStyle(
                    color: Colors.white,
                  ))),
        );
      }
    } on Exception catch (e) {
      showErrorDialog(context, getErrorMessage(e));
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
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            gapH20,
            const LogoWidget(),
            gapH20,
            Center(
              child: Text(
                'Registracija'.toUpperCase(),
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              ),
            ),
            gapH20,
            Center(
                child: Form(
              key: _formKey,
              child: Container(
                width: 300,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 117, 122, 119),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    _buildNameField(context),
                    SizedBox(height: 14),
                    _buildUsernameField(context),
                    SizedBox(height: 14),
                    _buildEmailField(context),
                    SizedBox(height: 14),
                    _buildPasswordField(context),
                    SizedBox(height: 14),
                    _buildConfirmPasswordField(context),
                    SizedBox(height: 14),
                    SizedBox(
                      width: 260,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            register();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black),
                        child: Text('Registruj se'.toUpperCase()),
                      ),
                    ),
                  ],
                ),
              ),
            )),
            gapH64,
          ],
        ),
      ),
    );
  }

  Widget _buildNameField(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 7),
      padding: EdgeInsets.symmetric(
        horizontal: 11,
        vertical: 7,
      ),
      decoration: AppDecoration.outlineBlack.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: Text(
              "Ime i prezime",
              style: CustomTextStyles.titleLargeGray90001,
            ),
          ),
          CustomTextFormField(
            controller: _nameController,
            hintText: "Ime Prezime",
            validator: (value) {
              if (value!.isEmpty) {
                return 'Obavezan unos polja';
              }
              return null;
            },
          )
        ],
      ),
    );
  }

  Widget _buildUsernameField(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 7),
      padding: EdgeInsets.symmetric(
        horizontal: 11,
        vertical: 12,
      ),
      decoration: AppDecoration.outlineBlack.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 4),
            child: Text(
              "Korisnicko ime",
              style: CustomTextStyles.titleLargeGray90001,
            ),
          ),
          SizedBox(height: 2),
          CustomTextFormField(
            controller: _usernameController,
            hintText: "Korisnicko ime",
          )
        ],
      ),
    );
  }

  Widget _buildEmailField(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 7),
      padding: EdgeInsets.symmetric(
        horizontal: 11,
        vertical: 10,
      ),
      decoration: AppDecoration.outlineBlack.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Email",
            style: CustomTextStyles.titleLargeGray90001,
          ),
          SizedBox(height: 2),
          CustomTextFormField(
            suffix: const Icon(
              Icons.email_outlined,
              color: Color.fromARGB(255, 53, 53, 53),
            ),
            controller: _emailController,
            hintText: "ime.prezime@gmail.com",
            textInputType: TextInputType.emailAddress,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Unesite vaš email.';
              }
              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                  .hasMatch(value)) {
                return 'Unesite validan email.';
              }
              return null;
            },
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }

  Widget _buildPasswordField(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 7),
      padding: EdgeInsets.symmetric(
        horizontal: 11,
        vertical: 10,
      ),
      decoration: AppDecoration.outlineBlack.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Sifra",
            style: CustomTextStyles.titleLargeGray90001,
          ),
          SizedBox(height: 2),
          CustomTextFormField(
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
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }

  Widget _buildConfirmPasswordField(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 7),
      padding: EdgeInsets.symmetric(
        horizontal: 11,
        vertical: 10,
      ),
      decoration: AppDecoration.outlineBlack.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Potvrdi sifru",
            style: CustomTextStyles.titleLargeGray90001,
          ),
          SizedBox(height: 2),
          CustomTextFormField(
            suffix: IconButton(
              icon: _obscureConfirmPassword
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
                  _obscureConfirmPassword = !_obscureConfirmPassword;
                });
              },
            ),
            controller: _confirmPasswordController,
            hintText: ".......",
            obscureText: _obscureConfirmPassword,
            textInputType: TextInputType.emailAddress,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Obavezan unos polja';
              }
              return null;
            },
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }
}
