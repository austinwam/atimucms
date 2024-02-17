import 'package:flutter/material.dart';
import 'package:frontend/screens/settingspage.dart';
import '../accounts/accounts.dart';
import '../leads/leadpage.dart';
import 'homepage.dart';

class Homenavipage extends StatefulWidget {
  const Homenavipage({super.key});

  @override
  State<Homenavipage> createState() => _HomenavipageState();
}

class _HomenavipageState extends State<Homenavipage> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const Homepage(),
    const Leadpage(),
    const Transactionpage(),
    const Settingspage(),
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
            backgroundColor: Color.fromARGB(255, 17, 140, 107),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Leads',
            backgroundColor: Color.fromARGB(255, 17, 140, 107),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'transactions',
            backgroundColor: Color.fromARGB(255, 17, 140, 107),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'settings',
            backgroundColor: Color.fromARGB(255, 17, 140, 107),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 240, 224, 8),
        onTap: _onItemTapped,
      ),
    );
  }
}
