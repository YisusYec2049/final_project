import 'package:final_project/model/category.dart';
import 'package:final_project/providers/categoryProvider.dart';
import 'package:flutter/material.dart';

class CategoryPageState extends StatefulWidget {
  final CategoryProvider categoryProvider;

  const CategoryPageState({Key? key, required this.categoryProvider})
      : super(key: key);

  @override
  _CategoryPageStateState createState() => _CategoryPageStateState();
}

class _CategoryPageStateState extends State<CategoryPageState> {
  late Future<List<Category>> _listCategories;

  @override
  void initState() {
    super.initState();
    _listCategories = widget.categoryProvider.fetchCategory();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _listCategories,
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
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: (snapshot.data as List<Category>).length,
            itemBuilder: (context, index) {
              return _listCat(snapshot.data as List<Category>)[index];
            },
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }

  List<Widget> _listCat(List<Category> data) {
    return List.generate(data.length, (index) {
      var category = data[index];
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
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
                    child: Image(
                      image: NetworkImage(category.image_url),
                      height: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(category.name),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
