import 'package:flutter/material.dart';
import '../Navigation/bottom_navigation_bar.dart';
import './faq.dart';
import '../Chat/chat_page.dart';

class AppManager extends StatefulWidget {
  const AppManager({super.key, required this.title});

  final String title;

  @override
  State<AppManager> createState() {
    return _AppManagerState();
  }
}

class _AppManagerState extends State<AppManager> {
  int _currScreenIndex = 0;

  void _selectScreen(int index) {
    setState(() => {_currScreenIndex = index});
  }

  @override
  Widget build(BuildContext context) {
    // List of all App Screen
    final screens = [
      const ChatPage(),
      const ExpansionFAQ()
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: IndexedStack(
        index: _currScreenIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBarMenu(_selectScreen),
    );
  }
}
