import 'package:final_project/model/pets.dart';
import 'package:final_project/providers/petsProvider.dart';
import 'package:final_project/screen/information.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PetsPageState extends StatefulWidget {
  final PetsProvider petsProvider;
  final String selectedCity;

  const PetsPageState(
      {Key? key, required this.petsProvider, required this.selectedCity})
      : super(key: key);

  @override
  State<PetsPageState> createState() =>
      _PetsPageStateState(selectedCity: selectedCity);
}

class _PetsPageStateState extends State<PetsPageState> {
  late Future<List<Pets>> _listPets;
  final String selectedCity;

  _PetsPageStateState({required this.selectedCity});

  @override
  void initState() {
    super.initState();
    print('Selected City in initState: $selectedCity');
    _listPets = widget.petsProvider.fetchLocation(selectedCity);
  }

  @override
  Widget build(BuildContext context) {
    print('Building PetsPageState for location: $selectedCity');
    return FutureBuilder(
      future: _listPets,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text("Error ${snapshot.error}"),
          );
        } else if (snapshot.hasData) {
          List<Pets> shuffledList = List.from(snapshot.data as List<Pets>)
            ..shuffle();
          print('Filtered Pets: $shuffledList');
          print('Filtered Pets Length: ${shuffledList.length}');
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: shuffledList.length,
            itemBuilder: (context, index) {
              return _listPet(shuffledList)[index];
            },
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }

  List<Widget> _listPet(List<Pets> data) {
    return List.generate(
      data.length,
      (index) {
        var pet = data[index];
        print('Building Widget for Pet: $pet');
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 4,
                            offset: Offset(4, 8),
                          ),
                        ],
                      ),
                      child: GestureDetector(
                        onDoubleTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => InformationScreen(
                                      info: pet.toInformation())));
                        },
                        child: Column(
                          children: [
                            AspectRatio(
                              aspectRatio: 1.5,
                              child: Image(
                                image: NetworkImage(pet.image_url),
                                height: 90,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              pet.name,
                              style: GoogleFonts.poppins(),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}