import 'package:flutter/material.dart';
import 'package:my_profile/Discover/model/news_data_model.dart';

class SliderContainerWidget extends StatefulWidget {
  const SliderContainerWidget({super.key});

  @override
  State<SliderContainerWidget> createState() => _SliderContainerWidgetState();
}

class _SliderContainerWidgetState extends State<SliderContainerWidget> {
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

  NewsDataModel? newsDataModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
        padding: const EdgeInsets.only(left: 10),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
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
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 9, 92, 143),
                image: DecorationImage(
                  image: AssetImage(sliderlist[index].image),
                  fit: BoxFit.cover,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    sliderlist[index].title,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    sliderlist[index].description,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Text(
                    sliderlist[index].publishertime,
                    style: const TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 5),
        itemCount: sliderlist.length,
      ),
    );
  }
}
