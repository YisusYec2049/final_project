import 'package:final_project/util/linePainter2.dart';
import 'package:final_project/util/navigationBar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 40, 20, 10),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 4,
                        )
                      ]),
                  child: const Icon(
                    Icons.person,
                    size: 30,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 10),
                child: Column(
                  children: [
                    Text(
                      'Usuario',
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      'Adoptante',
                      style: GoogleFonts.roboto(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 50, 20, 50),
                  child: CustomPaint(
                    painter: LinePainter2(),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.person_2_outlined,
                    color: Colors.deepPurple,
                    size: 30,
                  ),
                ),
              ),
              const Text('Informacion Personal'),
              const SizedBox(
                width: 140,
              ),
              const Icon(Icons.keyboard_arrow_right),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.settings,
                    color: Colors.blue,
                    size: 30,
                  ),
                ),
              ),
              const Text('Configuracion'),
              const SizedBox(
                width: 190,
              ),
              const Icon(Icons.keyboard_arrow_right),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  decoration: BoxDecoration(
                    color: Colors.orangeAccent.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.orange,
                    size: 30,
                  ),
                ),
              ),
              const Text('Favoritos'),
              const SizedBox(
                width: 220,
              ),
              const Icon(Icons.keyboard_arrow_right),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  decoration: BoxDecoration(
                    color: Colors.redAccent.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.exit_to_app,
                    color: Colors.red,
                    size: 30,
                  ),
                ),
              ),
              const Text('Salir'),
              const SizedBox(
                width: 250,
              ),
              const Icon(Icons.keyboard_arrow_right),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
                  child: CustomPaint(
                    painter: LinePainter2(),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.info_outline,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
              ),
              const Text('Ayuda y comentarios'),
              const SizedBox(
                width: 140,
              ),
              const Icon(Icons.keyboard_arrow_right),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.border_color_outlined,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
              ),
              const Text('Manual'),
              const SizedBox(
                width: 230,
              ),
              const Icon(Icons.keyboard_arrow_right),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.textsms_rounded,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
              ),
              const Text('Salir'),
              const SizedBox(
                width: 250,
              ),
              const Icon(Icons.keyboard_arrow_right),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          const CustomBottomNavigationBar(
            icons: [Icons.home, Icons.book, Icons.person],
            texts: ['Home', 'Success Stories', 'Account'],
            currentIndex: 2,
          )
        ],
      ),
    );
  }
}
