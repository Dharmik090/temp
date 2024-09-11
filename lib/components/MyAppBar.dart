import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool leading;
  final bool isDarkTheme;
  final VoidCallback onThemeChange;

  const MyAppBar(
      {super.key,
      required this.title,
      required this.leading,
      required this.isDarkTheme,
      required this.onThemeChange});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      leading: leading
          ? IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context, false),
            )
          : null,
      centerTitle: true,
      backgroundColor: Colors.teal,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(16),
        ),
      ),
      actions: [
        ElevatedButton.icon(
            onPressed: onThemeChange,
            label: isDarkTheme
                ? const Text('Light Mode',
                    style: TextStyle(color: Colors.white))
                : const Text('Dark Mode',
                    style: TextStyle(color: Colors.black)))
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
