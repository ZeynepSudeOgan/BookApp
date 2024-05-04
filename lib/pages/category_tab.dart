import 'package:flutter/material.dart';

class CategoryTab extends StatefulWidget {
  const CategoryTab({super.key});

  @override
  State<CategoryTab> createState() => _CategoryTabState();
}

class _CategoryTabState extends State<CategoryTab> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SearchBar(),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20),
            itemBuilder: (context, index) => gridItem(index),
            itemCount: 5,
          ),
        ),
      ),
    ]);
  }

  Widget gridItem(int index) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.pink, borderRadius: BorderRadius.circular(20)),
      child: Center(child: Text(index.toString())),
    );
  }
}
