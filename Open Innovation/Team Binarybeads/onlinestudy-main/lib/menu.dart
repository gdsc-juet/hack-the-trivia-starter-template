import 'package:flutter/material.dart';

// ignore: camel_case_types
class menu extends StatelessWidget {
  final String title;
  final IconData icon;
  const menu({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: GestureDetector(
        child: Row(children: [
          Icon(
            icon,
            size: 25,
            color: Colors.white,
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
              child: Text(
            title,
            style: const TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
          ))
        ]),
      ),
    );
  }
}
