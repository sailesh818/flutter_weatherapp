import 'package:flutter/material.dart';
import 'package:my_profile/Discover/model/news_data_model.dart';

class LastSizedboxWidget extends StatefulWidget {
  const LastSizedboxWidget({super.key});

  @override
  State<LastSizedboxWidget> createState() => _LastSizedboxWidgetState();
}

class _LastSizedboxWidgetState extends State<LastSizedboxWidget> {
  List<NewsDataModel> sliderlist = [
    NewsDataModel(
      title: 'Kevin De Bruyne',
      description: 'Ucl news',
      image: 'assets/one.jpg',
      publishertime: '13:24',
      author: 'Radioboy',
      activeusers: 23,
    ),
    NewsDataModel(
      title: 'Mbape lottery',
      description: 'He hit the loss',
      image: 'assets/two.jpg',
      publishertime: '19:24',
      author: 'deadly day',
      activeusers: 96,
    ),
    NewsDataModel(
      title: 'Rayane mayane glory at ',
      description: 'He dug the earth out from the universe',
      image: 'assets/three.jpg',
      publishertime: '11:24',
      author: 'walking dead',
      activeusers: 54,
    ),
    NewsDataModel(
      title: 'Calling all the day out',
      description: 'Ucl news has been remebered all',
      image: 'assets/four.jpg',
      publishertime: '6:24',
      author: 'Running nose',
      activeusers: 34,
    ),
    NewsDataModel(
      title: 'Futsal',
      description: 'Its popularity hasbeen growing',
      image: 'assets/five.jpg',
      publishertime: '7:24',
      author: 'daily days',
      activeusers: 995,
    ),
    NewsDataModel(
      title: 'Nobody dares to move',
      description: 'Calling all the day out',
      image: 'assets/six.jpg',
      publishertime: '9:24',
      author: 'calling',
      activeusers: 2378,
    ),
    NewsDataModel(
      title: 'Hoping the new',
      description: 'Its begining to bring the glory',
      image: 'assets/seven.jpg',
      publishertime: '10:24',
      author: 'beam Radioboy',
      activeusers: 903,
    ),
    NewsDataModel(
      title: 'Sunlight',
      description: 'was he the one?',
      image: 'assets/eight.jpg',
      publishertime: '3:24',
      author: 'moonlight Radioboy',
      activeusers: 67,
    ),
    NewsDataModel(
      title: 'moonlight in the dimlight',
      description: 'its beautiful night to begin the day',
      image: 'assets/nine.jpg',
      publishertime: '1:24',
      author: 'happy Radioboy',
      activeusers: 89,
    ),
    NewsDataModel(
      title: 'calling the day',
      description: 'it has been all day out',
      image: 'assets/ten.jpg',
      publishertime: '15:267',
      author: 'Radioboy in husk',
      activeusers: 98,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1500,
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
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
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
                          image: AssetImage(sliderlist[index].image),
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
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
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
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 180,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  Text(
                                    sliderlist[index].publishertime,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  const Text(
                                    '+',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    sliderlist[index].author,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder:
            (context, index) => const SizedBox(width: 12, height: 10),
        itemCount: sliderlist.length,
      ),
    );
  }
}
