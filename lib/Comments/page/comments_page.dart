import 'package:flutter/material.dart';
import 'package:my_profile/Comments/datamodel/page/data_model.dart';

class CommentsPage extends StatefulWidget {
  const CommentsPage({super.key});

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  List<DataModel> sliderlist = [
    DataModel(
      title: 'Mr Sam',
      description:
          'Mr Sam is always the good person with the good personality that wonders everywhere,',
      CircleAvatar: 'assets/one.jpg',
    ),
    DataModel(
      title: 'Ms. Gauri',
      description: 'Its ady and hw he created the days all out of as sudedden',
      CircleAvatar: 'assets/one.jpg',
    ),
    DataModel(
      title: 'Karan dar',
      description:
          'Its always good for the starting days to begin the days that has always been wondering days.',
      CircleAvatar: 'assets/one.jpg',
    ),
    DataModel(
      title: 'Kevin Dadaadd',
      description:
          'Its going to be late to v=begin the days out from here in the shine',
      CircleAvatar: 'assets/one.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Comments")),
      body: ListView(
        shrinkWrap: true,
        children: [
          Column(
            children: [
              SizedBox(
                height: 15000,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,

                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/detail',
                          arguments: sliderlist[index],
                        );
                      },
                      child: Container(
                        width: 100,
                        height: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Container(
                                width: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color.fromARGB(255, 9, 92, 143),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      sliderlist[index].CircleAvatar,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),

                            Column(
                              children: [
                                SizedBox(
                                  width: 180,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      sliderlist[index].title,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: const Color.fromARGB(
                                          255,
                                          9,
                                          9,
                                          9,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  width: 180,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      sliderlist[index].description,

                                      style: TextStyle(
                                        color: const Color.fromARGB(
                                          255,
                                          9,
                                          9,
                                          9,
                                        ),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },

                  separatorBuilder:
                      (context, index) => SizedBox(width: 12, height: 10),

                  itemCount: sliderlist.length,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
