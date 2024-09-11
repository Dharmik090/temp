import 'package:flutter/material.dart';
import '../models/Property.dart';

class PropertyCard extends StatelessWidget {
  final Property property;
  final bool isDarkTheme;
  final VoidCallback onThemeChange;


  const PropertyCard({super.key,
    required this.property,
    required this.isDarkTheme,
    required this.onThemeChange
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/details',
            arguments: property
          );
        },
        child: Card(
          color: isDarkTheme ? Colors.black.withOpacity(1) : Colors.white.withOpacity(1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 5,
          margin: const EdgeInsets.only(bottom: 16),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image(
                    image: AssetImage(property.imageUrl),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  property.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  property.location,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  property.price,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.teal[700],
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        )
    );

  }
}


