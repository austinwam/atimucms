import 'package:flutter/material.dart';

import 'homepage.dart';

// class Homenavipage extends StatelessWidget {
//   const Homenavipage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

class Homenavipage extends StatefulWidget {
  const Homenavipage({super.key});

  @override
  State<Homenavipage> createState() => _HomenavipageState();
}

class _HomenavipageState extends State<Homenavipage> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const Homepage(),
    const Text(
      'Index 1: Business',
    ),
    const Text(
      'Index 2: School',
    ),
    const Text(
      'Index 3: setting',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 211, 204, 204),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Leads',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: 'inv',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 17, 140, 107),
        onTap: _onItemTapped,
      ),
    );
  }
}
