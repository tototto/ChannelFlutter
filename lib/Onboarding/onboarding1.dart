import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Onboarding extends StatefulWidget {
  final Function selectedScreenIndex;

  Onboarding(this.selectedScreenIndex, {super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final int APP_MANAGER_SCREEN = 1;
  List<PageViewModel> listPagesViewModel = [
    // Onboarding Page_1
    PageViewModel(
      title: "Title of introduction page",
      body: "Welcome to the app! This is a description of how it works.",
      image: const Center(
        child: Icon(Icons.waving_hand, size: 50.0),
      ),
    ),

    // Onboarding Page_2
    PageViewModel(
      title: "Title of custom button page2",
      body: "This is a description on a page with a custom button below.",
      image: Image.asset("assets/dbs.jpeg", height: 175.0),
    ),

    // Onboarding Page_3
    PageViewModel(
      title: "Title of custom body page",
      bodyWidget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("Click on "),
          Icon(Icons.edit),
          Text(" to edit a post"),
        ],
      ),
      image: const Center(child: Icon(Icons.android)),
    )
  ];

  void updateSharedPreference() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('isOnboardingDone')) {
      await prefs.setBool('isOnboardingDone', true);
    }
  }

  @override
  Widget build(BuildContext context) {
    updateSharedPreference();
    return IntroductionScreen(
      pages: listPagesViewModel,
      showBackButton: true,
      back: const Icon(Icons.arrow_back),
      next: const Text("Next"),
      done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w700)),
      onDone: () {
        // On Done button pressed
        widget.selectedScreenIndex(APP_MANAGER_SCREEN);
      },
      dotsDecorator: DotsDecorator(
        size: const Size.square(10.0),
        activeSize: const Size(20.0, 10.0),
        activeColor: Theme.of(context).colorScheme.secondary,
        color: Colors.black26,
        spacing: const EdgeInsets.symmetric(horizontal: 3.0),
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      ),
    );
  }
}
