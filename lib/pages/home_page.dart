import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<String> _titles = [
    'Business',
    'Home',
    'School',
    'Contabilidad',
  ];
  static const List<IconData> _icons = [
    Icons.business_center_outlined,
    Icons.home_outlined,
    Icons.school_outlined,
    Icons.account_balance_wallet_outlined,
  ];
  static const List<IconData> _selectedIcons = [
    Icons.business_center,
    Icons.home_rounded,
    Icons.school_rounded,
    Icons.account_balance_wallet_rounded,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Bienvenido a ${_titles[_selectedIndex]}',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) =>
            setState(() => _selectedIndex = index),
        destinations: List<NavigationDestination>.generate(
          _titles.length,
          (index) => NavigationDestination(
            icon: Icon(_icons[index]),
            selectedIcon: Icon(_selectedIcons[index]),
            label: _titles[index],
          ),
        ),
      ),
    );
  }
}
