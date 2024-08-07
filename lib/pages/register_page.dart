import 'package:flutter/material.dart';
import 'package:flutter_application_pj2/components/my_button.dart';
import 'package:flutter_application_pj2/services/auth/auth_service.dart';

import '../components/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? ontap;

  const RegisterPage({
    super.key,
    required this.ontap,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  //register method
  void register() async {
    //get auth service
    final _authService = AuthService();

    //check if password match -> create user
    if (passwordController.text == confirmpasswordController.text) {
      //try creating user
      try {
        await _authService.signUpWithEmailPassword(
          emailController.text,
          passwordController.text,
        );
      }

      //display any errors
      catch (e) {
        if (mounted) {
          showDialog(
            context: context,
            builder: (context) => const AlertDialog(
              title: Text("Please enter your Email and Password!"),
            ),
          );
        }
      }
    }

    //if password dont MATCH!
    else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Password don't match!"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // logo
          Image.asset(
            'lib/assets/images/Footshop.png',
            height: 250,
          ),

          const SizedBox(height: 10),

          //message, app slogan
          const Text(
            ' Create your account',
            style: TextStyle(color: Colors.black, fontSize: 30),
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

          MyTextField(
            controller: confirmpasswordController,
            hintText: "Comfirm password",
            obscuretext: true,
          ),

          const SizedBox(height: 20),

          //sign up button
          MyButton(
            text: "Sign up",
            onTap: register,
          ),
          const SizedBox(height: 20),
          //already have account? Login here
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "already have account?",
                style: TextStyle(color: Colors.black),
              ),
              const SizedBox(width: 4),
              GestureDetector(
                onTap: widget.ontap,
                child: const Text(
                  "Login now",
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
