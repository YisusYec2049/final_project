import 'package:final_project/model/pets.dart';
import 'package:final_project/providers/petsProvider.dart';
import 'package:final_project/screen/information.dart';
import 'package:flutter/material.dart';

class InformationAPI extends StatefulWidget {
  final PetsProvider petsProvider;
  const InformationAPI({Key? key, required this.petsProvider})
      : super(key: key);

  @override
  State<InformationAPI> createState() => _InformationAPIState();
}

class _InformationAPIState extends State<InformationAPI> {
  late Future<List<Pets>> _listInfo;

  @override
  void initState() {
    super.initState();
    _listInfo = widget.petsProvider.fetchPets();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _listInfo,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error ${snapshot.error}'),
          );
        } else if (snapshot.hasData) {
          return ListView.builder(
            itemCount: (snapshot.data as List<Pets>).length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InformationScreen(
                        info: snapshot.data![index],
                      ),
                    ),
                  );
                },
                child: _listInf(snapshot.data as List<Pets>)[index],
              );
            },
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }

  List<Widget> _listInf(List<Pets> data) {
    return List.generate(data.length, (index) {
      var info = data[index];
      return Padding(
        padding: const EdgeInsets.all(0.5),
        child: Column(
          children: [
            Image(image: NetworkImage(info.image_url)),
            Text(info.description),
            Text(info.location),
            Text(info.name),
          ],
        ),
      );
    });
  }
}
