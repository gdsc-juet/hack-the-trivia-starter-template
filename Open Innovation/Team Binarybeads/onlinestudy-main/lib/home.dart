import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:online/drawer.dart';
import 'package:online/homescreen.dart';

class Homescreeen extends StatefulWidget {
  const Homescreeen({super.key});

  @override
  State<Homescreeen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreeen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        backgroundColor: Colors.blue,
        items: const <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.computer_outlined, size: 30),
          Icon(Icons.book_sharp, size: 30),
          Icon(Icons.inbox_outlined, size: 30),
          Icon(Icons.av_timer, size: 30),
        ],
        onTap: (index) {
          setState(() {});
        },
      ),
      body: const Stack(
        children: [Drawerscreen(), Homeescreen()],
      ),
      backgroundColor: Colors.white,
    );
  }
}
