import 'package:final_project/model/user.dart';
import 'package:final_project/providers/categoryProvider.dart';
import 'package:final_project/providers/petsProvider.dart';
import 'package:final_project/util/categoryAPI.dart';
import 'package:final_project/util/linePainter.dart';
import 'package:final_project/util/navigationBar.dart';
import 'package:final_project/util/petsAPI.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeAdopter extends StatefulWidget {
  final User user;

  const HomeAdopter({Key? key, required this.user}) : super(key: key);

  @override
  State<HomeAdopter> createState() => _HomeAdopterState();
}

class _HomeAdopterState extends State<HomeAdopter> {
  final CategoryProvider categoryProvider = CategoryProvider();
  final PetsProvider petsProvider = PetsProvider();
  String selectedCity = 'Todos';

  @override
  void initState() {
    super.initState();
  }

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
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 20),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 40, 80, 0),
                              child: Text(
                                'Tu ubicación',
                                style: GoogleFonts.roboto(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 50, 10),
                              child: CityList(
                                onCityChanged: (String city) {
                                  setState(() {
                                    selectedCity = city;
                                  });
                                },
                                selectedCity: selectedCity,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(80, 40, 1, 25),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.black),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Icon(
                            Icons.favorite_border_outlined,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 4,
                                offset: Offset(4, 8))
                          ],
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Buscar mascotas',
                          hintStyle: GoogleFonts.poppins(),
                          prefixIcon: const Icon(Icons.search),
                          prefixIconColor: const Color(0xFFF87D28),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 30, 10, 10),
                        child: Text(
                          'Mascotas',
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              letterSpacing: 0.1,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        width: 100,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 30, 10, 10),
                        child: Text(
                          'Ver todos',
                          style: GoogleFonts.roboto(
                              color: const Color(0xFFF87D28),
                              letterSpacing: 0.1,
                              fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.149,
                child: CategoryPageState(categoryProvider: categoryProvider),
              ),
              Padding(
                padding: const EdgeInsets.all(25),
                child: Row(
                  children: [
                    const Text('Result ('),
                    FutureBuilder(
                      future: petsProvider.fetchPets(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text('${(snapshot.data as List).length})');
                        }
                        return const CircularProgressIndicator();
                      },
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                        child: CustomPaint(
                          painter: LinePainter(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.149,
                  child: PetsPageState(
                      petsProvider: petsProvider, selectedCity: selectedCity),
                ),
              ),
              const CustomBottomNavigationBar(
                icons: [Icons.home, Icons.book, Icons.person],
                texts: ['Home', 'Success Stories', 'Account'],
                currentIndex: 0,
              )
            ],
          ),
        ],
      ),
    );
  }
}

class CityList extends StatefulWidget {
  final String selectedCity;
  final Function(String) onCityChanged;
  const CityList({
    Key? key,
    required this.selectedCity,
    required this.onCityChanged,
  }) : super(key: key);

  @override
  State<CityList> createState() => _CityListState();
}

class _CityListState extends State<CityList> {
  static const List<String> listCity = <String>[
    'Todos',
    'Barranquilla',
    'Bogota',
    'Medellin',
    'Cali',
  ];
  String listSelect = listCity.first;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.location_on,
          color: Color(0xFFA4593C),
          size: 20,
        ),
        const SizedBox(width: 5),
        DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: widget.selectedCity,
            icon: const Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
              child: Icon(Icons.keyboard_arrow_down_rounded),
            ),
            style: GoogleFonts.kanit(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            onChanged: (String? value) {
              setState(() {
                listSelect = value ?? listCity[0];
                widget.onCityChanged(listSelect);
              });
            },
            items: listCity.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
