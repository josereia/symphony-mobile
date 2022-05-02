import 'package:flutter/material.dart';

class SongList extends StatelessWidget {
  final String title;

  const SongList({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        SizedBox(
          height: 220,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(width: 16),
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: const Image(
                      width: 140,
                      height: 140,
                      image: NetworkImage(
                          "https://upload.wikimedia.org/wikipedia/pt/7/71/Sour_-_Olivia_Rodrigo.png"),
                    ),
                  ),
                  Text("good 4 you",
                      style: Theme.of(context).textTheme.titleMedium),
                  const Text("Olivia Rodrigo"),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
