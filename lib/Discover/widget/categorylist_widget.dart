import 'package:flutter/material.dart';

class CategorylistWidget extends StatefulWidget {
  const CategorylistWidget({super.key});

  @override
  State<CategorylistWidget> createState() => _CategorylistWidgetState();
}

class _CategorylistWidgetState extends State<CategorylistWidget> {
  int currentIndex = 0;
  List<String> categoryList = [
    "all",
    "sports",
    "Politics",
    "Entertainment",
    "Technology",
    "Science",
    "Education",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        padding: const EdgeInsets.only(left: 10),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                currentIndex = index;
              });
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                margin: const EdgeInsets.all(1),
                padding: const EdgeInsets.all(10),
                color:
                    currentIndex == index
                        ? Colors.amber
                        : const Color.fromARGB(255, 51, 53, 54),
                child: Text(
                  categoryList[index],
                  style: const TextStyle(
                    color: Color.fromARGB(255, 238, 236, 236),
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 5),
        itemCount: categoryList.length,
      ),
    );
  }
}
