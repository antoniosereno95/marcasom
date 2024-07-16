import 'package:flutter/material.dart';
import '../screens/loginScreen.dart';

class MarcasomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const MarcasomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF9B59B6),
      elevation: 0,
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
        ),
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.cancel, color: Colors.white),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}