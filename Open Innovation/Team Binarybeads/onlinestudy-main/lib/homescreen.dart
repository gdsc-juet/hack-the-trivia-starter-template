import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Homeescreen extends StatefulWidget {
  const Homeescreen({super.key});

  @override
  State<Homeescreen> createState() => _HomeescreenState();
}

class _HomeescreenState extends State<Homeescreen> {
  bool menuop = false;
  double tranx = 0, trany = 0, scale = 1;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 30),
        curve: Curves.fastOutSlowIn,
        transform: Matrix4.translationValues(tranx, trany, 0)..scale(scale),
        color: Colors.white,
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
              const SizedBox(
                height: 30,
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [
                  !menuop
                      ? IconButton(
                          icon: const Icon(Icons.menu),
                          onPressed: () {
                            scale = 0.5;
                            tranx = 300;
                            trany = 150;
                            setState(() {
                              menuop = true;
                            });
                          },
                          color: Colors.black,
                        )
                      : IconButton(
                          icon: const Icon(Icons.arrow_back_ios,
                              color: Colors.black),
                          onPressed: () {
                            scale = 1;
                            tranx = 0;
                            trany = 0;
                            setState(() {
                              menuop = false;
                            });
                          }),
                ]),
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.redAccent,
                        backgroundImage:
                            AssetImage('assets/images/download1.png'),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "WELCOME BACK!\nAMAN",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          size: 30,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.chat,
                          size: 30,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications,
                          size: 30,
                        )),
                    const SizedBox(width: 55),
                    Image.asset(
                        height: 100,
                        width: 200,
                        fit: BoxFit.cover,
                        'assets/images/Untitled_design-removebg-preview.png')
                  ],
                )
              ]),
              const SizedBox(
                height: 25,
              ),
              Column(children: [
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Live Classes",
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 20),
                        ),
                        Text(
                          "View all",
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w900,
                              fontSize: 20),
                        ),
                      ]),
                ),
                Container(
                    margin: const EdgeInsets.all(20),
                    height: 200,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[Colors.yellow, Colors.red],
                      ),
                    ),
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "WORLD OF LIVING",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  "FATMA KHAN | SCIENCE",
                                  style: TextStyle(fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Row(children: [
                                  Icon(
                                    Icons.child_care,
                                    color: Colors.grey,
                                  ),
                                  Text("28 Students Enrolled")
                                ]),
                                Container(
                                    margin: const EdgeInsets.all(20),
                                    width: 70,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.white),
                                    padding: const EdgeInsets.all(10),
                                    child: const Text(
                                      "JOIN",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue),
                                    )),
                              ]),
                          Image.asset(
                              height: 400,
                              width: 130,
                              fit: BoxFit.cover,
                              'assets/images/download1.png')
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 5,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Today's classes",
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 20),
                        ),
                        Icon(
                          Icons.calendar_today_outlined,
                          size: 25,
                          color: Colors.blue,
                        )
                      ]),
                ),
                Container(
                    margin: const EdgeInsets.all(20),
                    height: 200,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[Colors.blue, Colors.lightGreenAccent],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Period 1",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                const Text(
                                  "SCIENCE",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Row(children: [
                                  Text("Chapter 3:Science and its uses")
                                ]),
                                const SizedBox(
                                  height: 35,
                                ),
                                Container(
                                    alignment: Alignment.bottomLeft,
                                    padding: const EdgeInsets.all(10),
                                    child: const Text(
                                      "View lesson",
                                      style: TextStyle(fontSize: 15),
                                    )),
                              ]),
                          Container(
                            alignment: Alignment.topRight,
                            child: Image.asset(
                                height: 400,
                                width: 100,
                                fit: BoxFit.cover,
                                'assets/images/work-removebg-preview (1).png'),
                          )
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 6,
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Tomorrow's classes",
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 20),
                        ),
                        Icon(
                          Icons.calendar_month,
                          size: 25,
                          color: Colors.blue,
                        )
                      ]),
                ),
                Container(
                    margin: const EdgeInsets.all(20),
                    height: 200,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[Colors.yellow, Colors.green],
                      ),
                    ),
                    alignment: Alignment.center,
                    child: const Text("yet to come"))
              ])
            ])));
  }
}
