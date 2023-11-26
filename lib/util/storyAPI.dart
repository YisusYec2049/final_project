import 'package:final_project/model/story.dart';
import 'package:final_project/providers/storyProvider.dart';
import 'package:flutter/material.dart';

class StoryPageState extends StatefulWidget {
  final StoryProviders storyProviders;
  const StoryPageState({Key? key, required this.storyProviders})
      : super(key: key);

  @override
  State<StoryPageState> createState() => _StoryPageStateState();
}

class _StoryPageStateState extends State<StoryPageState> {
  late Future<List<Stories>> _listStories;

  @override
  void initState() {
    super.initState();
    _listStories = widget.storyProviders.fetchStories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _listStories,
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
              itemCount: (snapshot.data as List<Stories>).length,
              itemBuilder: (context, index) {
                return _listStory(snapshot.data as List<Stories>)[index];
              },
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}

List<Widget> _listStory(List<Stories> data) {
  return List.generate(data.length, (index) {
    var story = data[index];
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Column(children: [
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
              child: Column(
                children: [
                  Image(
                    image: NetworkImage(story.image_url),
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                  Text(story.tittle),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(story.description)
                ],
              ),
            ),
          ]),
        ),
      ]),
    );
  });
}
