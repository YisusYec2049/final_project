import 'package:final_project/model/user.dart';
import 'package:final_project/providers/userProvider.dart';
import 'package:final_project/screen/account.dart';
import 'package:final_project/screen/home_adopter.dart';
import 'package:final_project/screen/storyScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final List<IconData> icons;
  final List<String> texts;
  final int currentIndex;

  const CustomBottomNavigationBar({
    Key? key,
    required this.icons,
    required this.texts,
    required this.currentIndex,
  }) : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, userProvider, child) {
        final user = userProvider.user;
        return GNav(
          gap: 8,
          tabs: List.generate(
            widget.icons.length,
            (index) => GButton(
                icon: widget.icons[index],
                iconActiveColor: const Color(0xFFF87D28),
                text: widget.texts[index],
                textColor: const Color(0xFFF87D28)),
          ),
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
            gnav(index, user);
          },
        );
      },
    );
  }

  void gnav(int index, User? user) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeAdopter(user: user!),
          ),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const StoryScreen()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Account()),
        );
        break;
    }
  }
}
