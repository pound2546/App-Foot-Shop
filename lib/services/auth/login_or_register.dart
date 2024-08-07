import 'package:flutter/material.dart';
import 'package:flutter_application_pj2/pages/login_page.dart';
import 'package:flutter_application_pj2/pages/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  //show login page
  bool showLoginPage = true;

  //toggle between login
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onTap: togglePages);
    } else {
      return RegisterPage(ontap: togglePages,
      );
    }
  }
}
