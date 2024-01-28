import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online/menu.dart';

class Drawerscreen extends StatefulWidget {
  const Drawerscreen({super.key});

  @override
  State<Drawerscreen> createState() => _DrawerscreenState();
}

class _DrawerscreenState extends State<Drawerscreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[Colors.blue, Colors.green],
          ),
        ),
        child: Column(children: [
          const SizedBox(
            height: 30,
          ),
          Row(children: [
            const CircleAvatar(
              radius: 35,
              backgroundColor: Colors.white,
              child: Icon(
                FontAwesomeIcons.graduationCap,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
              ),
              margin: const EdgeInsets.all(10),
              child: const Text(
                'Add school',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
              ),
            )
          ]),
          const SizedBox(height: 10),
          const menu(title: "Teachers", icon: Icons.person),
          const menu(title: "Classmates", icon: FontAwesomeIcons.children),
          const menu(title: "Syllabus", icon: FontAwesomeIcons.book),
          const menu(title: "Attendance", icon: FontAwesomeIcons.calendarCheck),
          const menu(title: "Calendar", icon: FontAwesomeIcons.calendar),
          const menu(
              title: "School Board", icon: FontAwesomeIcons.bookOpenReader),
          const menu(
              title: "Fee Portal", icon: FontAwesomeIcons.indianRupeeSign),
          const SizedBox(
            height: 30,
          ),
          Column(children: [
            Image.asset(
                width: 320,
                fit: BoxFit.contain,
                'assets/images/6461-removebg-preview.png'),
          ])
        ]));
  }
}
