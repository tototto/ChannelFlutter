import 'package:flutter/material.dart';

class BottomNavigationBarMenu extends StatefulWidget {
  
  final Function selectedNavigationIndex;

  const BottomNavigationBarMenu(this.selectedNavigationIndex, {super.key});

  @override
  State<BottomNavigationBarMenu> createState() =>
      _BottomNavigationBarMenuState();
}

class _BottomNavigationBarMenuState extends State<BottomNavigationBarMenu> {
 
 int _selectedIndex = 0;
 
 void _onItemTapped(int index) {
    
  setState(() {
      _selectedIndex = index;
      widget.selectedNavigationIndex(_selectedIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_outlined),
          label: 'Messages',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'FAQ',
        ),
      ],
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.amber[800],
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      iconSize: 25,
      currentIndex: _selectedIndex,
      onTap: (index) => _onItemTapped(index),
    );
  }
}
