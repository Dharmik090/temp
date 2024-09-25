import 'package:flutter/material.dart';

class DrawerComponent extends StatelessWidget {
  const DrawerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: 200,
        child: ListView(
          children: [
            ListTile(
                title: const Text('Home'),
                onTap: () {
                  Navigator.pushNamed(context, '/');
                }
            ),
            ListTile(
                title: const Text('Profile'),
                onTap: () {
                  Navigator.pushNamed(context, '/profile');
                }
            ),
            ListTile(
                title: const Text('Signup'),
                onTap: () {
                  Navigator.pushNamed(context, '/signup');
                }
            ),
            ListTile(
                title: const Text('Login'),
                onTap: () {
                  Navigator.pushNamed(context, '/login');
                }
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: (){
                // Logout Login
              },
            )
          ],
        )
    );
  }
}