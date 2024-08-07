import 'package:flutter/material.dart';
import 'package:flutter_application_pj2/components/my_button.dart';
import 'package:flutter_application_pj2/components/my_textfield.dart';
import 'package:flutter_application_pj2/services/auth/auth_service.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //login method
  void login() async {
    //get instance of auth service
    final authService = AuthService();

    //try Sign in
    try {
      await authService.signInWithEmailPassword(
        emailController.text,
        passwordController.text,
      );
    }

    //display any errores
    catch (e) {
      if (mounted) {
        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text("Email and Password incorrect!"),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          
          // logo
          Image.asset(
            'lib/assets/images/Footshop.png',
            height: 250,
          ),

          const SizedBox(height: 25),

          //message, app slogan
          const Text(
            'Sneaker Store',
            style: TextStyle(
                color: Colors.black, fontFamily: 'Inter', fontSize: 30),
          ),

          const SizedBox(height: 25),

          // email textfield
          MyTextField(
              controller: emailController,
              hintText: "Email",
              obscuretext: false),

          const SizedBox(height: 10),

          //password textfield
          MyTextField(
            controller: passwordController,
            hintText: "password",
            obscuretext: true,
          ),

          const SizedBox(height: 10),

          //sign in button
          MyButton(
            text: "Sign In",
            onTap: login,
          ),
          const SizedBox(height: 20),
          //not a member? register now
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Not a Member?",
                style: TextStyle(color: Colors.black),
              ),
              const SizedBox(width: 4),
              GestureDetector(
                onTap: widget.onTap,
                child: const Text(
                  "Register now",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}
