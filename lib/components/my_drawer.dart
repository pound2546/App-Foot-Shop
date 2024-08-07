import 'package:flutter/material.dart';
import 'package:flutter_application_pj2/components/my_drawer_title.dart';
import 'package:flutter_application_pj2/services/auth/auth_service.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    final _authService = AuthService();
    _authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Image.asset(
            'lib/assets/images/Footshop.png',
            height: 175,
          ),
        ),

        const Padding(
          padding: EdgeInsets.all(25.0),
          child: Divider(),
        ),

        // home list title
        MyDrawerTitle(
          text: "Home",
          icon: Icons.shop_2,
          onTap: () => Navigator.pop(context),
        ),


        const Spacer(),

        //logout list title
        MyDrawerTitle(
          text: "logout",
          icon: Icons.logout,
          onTap: logout,
        ),

        const SizedBox(height: 25),
      ]),
    );
  }
}
