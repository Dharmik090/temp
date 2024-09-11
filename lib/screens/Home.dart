import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/components/DrawerComponent.dart';
import '../components/MyAppBar.dart';
import '../models/Property.dart';
import '../components/PropertyCard.dart';

class HomeScreen extends StatelessWidget {

  final FirebaseFirestore firestore = FirebaseFirestore.instance;


  final bool isDarkTheme;
  final VoidCallback onThemeChange;

  HomeScreen({super.key, required this.isDarkTheme, required this.onThemeChange});

  final List<Property> homes = [
    const Property(
      title: 'Modern Family House',
      location: 'India',
      price: '\$350,000',
      imageUrl: 'assets/images/h1.jpeg'
    ),
    const Property(
      title: 'Cozy Cottage',
      location: 'India',
      price: '\$220,000',
      imageUrl: 'assets/images/h2.jpeg'
    ),
    const Property(
      title: 'Luxury Villa',
      location: 'India',
      price: '\$1,200,000',
      imageUrl: 'assets/images/h3.jpeg'
    )
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
          title: 'Estate Ease',
          leading: false,
          isDarkTheme: isDarkTheme,
          onThemeChange: onThemeChange
      ),
      drawer: DrawerComponent(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: homes.map((home) {
            return PropertyCard(
              property: home,
              isDarkTheme: isDarkTheme,
              onThemeChange: onThemeChange,
            );
          }).toList(),
        ),
      ),
    );
  }
}
