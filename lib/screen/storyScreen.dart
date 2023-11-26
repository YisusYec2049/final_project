import 'package:final_project/providers/storyProvider.dart';
import 'package:final_project/util/navigationBar.dart';
import 'package:final_project/util/storyAPI.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StoryScreen extends StatefulWidget {
  const StoryScreen({super.key});

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  final StoryProviders storyProviders = StoryProviders();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/fondo2.png'),
                fit: BoxFit.fill,
                opacity: 0.5,
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 50, 10, 10),
                child: Text(
                  'Historias de exitos',
                  style: GoogleFonts.roboto(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: StoryPageState(storyProviders: storyProviders)),
              ),
              const CustomBottomNavigationBar(
                icons: [Icons.home, Icons.book, Icons.person],
                texts: ['Home', 'Success Stories', 'Account'],
                currentIndex: 1,
              )
            ],
          )
        ],
      ),
    );
  }
}
