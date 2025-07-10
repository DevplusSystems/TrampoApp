import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trampoapp/screens/events_list_screen.dart';
import 'package:trampoapp/screens/venue_list_screen.dart';

import 'bottomNav/ChatBootScreen.dart';
import 'bottomNav/CustomBottomNavBar.dart';
import 'bottomNav/PricingScreen.dart';
import 'home_screen.dart';

class MainScreen extends StatelessWidget {
  final int currentIndex;

  const MainScreen({
    Key? key,
    this.currentIndex = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screens = [
      HomeScreen(),
      VenueListScreen(),
      ChatBootScreen(),
      EventsListScreen(),
      PricingScreen(),
    ];

    return Stack(
      children: [
        /// Your screen content — this goes all the way behind the nav bar
        Positioned.fill(
          child: screens[currentIndex],
        ),

        /// Custom bottom nav bar — always stays on top
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: IgnorePointer( // allows touches to go through if necessary
            ignoring: false,
            child: CustomBottomNavBar(
              currentIndex: currentIndex,
              onTap: (int newIndex) {
                if (newIndex != currentIndex) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainScreen(currentIndex: newIndex),
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}

