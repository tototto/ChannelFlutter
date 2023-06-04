import 'package:flutter/material.dart';
import './app_manager.dart';
import 'Onboarding/onboarding1.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  Widget appToRun = const MyApp();
  runApp(appToRun);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currScreenIndex = 0;
  final int APP_MANAGER_SCREEN = 1;

  void _updateScreen(int index) {
    setState(() {
      _currScreenIndex = index;
    });
  }

  void _initSharedPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('isOnboardingDone')) {
      await prefs.setBool('isOnboardingDone', false);
    }
  }

  Future<bool?> _showOnboardingDecision() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? result;
    if (prefs.containsKey('isOnboardingDone')) {
      result = prefs.getBool('isOnboardingDone');
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    _initSharedPreferences();

    final screenList = [
      Onboarding(_updateScreen),
      const AppManager(title: 'Channel Home')
    ];

    if (_showOnboardingDecision() == true) {
      _updateScreen(APP_MANAGER_SCREEN);
    }

    return MaterialApp(
        title: 'Channel Home',
        home: IndexedStack(
          index: _currScreenIndex,
          children: screenList,
        ),
        theme: ThemeData(
            primarySwatch: Colors.green,
            appBarTheme: const AppBarTheme(
              backgroundColor: Color.fromARGB(255, 58, 129, 71),
            )));
  }
}
