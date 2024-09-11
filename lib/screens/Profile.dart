import 'package:flutter/material.dart';
import 'package:flutter_application/components/DrawerComponent.dart';
import '../components/MyAppBar.dart';

class Profile extends StatelessWidget{
  final bool isDarkTheme;

  final VoidCallback onThemeChange;

  const Profile({super.key, required this.isDarkTheme, required this.onThemeChange});

  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: MyAppBar(
          title: 'Estate Ease',
          leading: true,
          isDarkTheme: isDarkTheme,
          onThemeChange: onThemeChange
      ),
      drawer: DrawerComponent(),
      body: (
          const Center(
            child: Text('My Profile'),
          )
      ),
    );
  }
}