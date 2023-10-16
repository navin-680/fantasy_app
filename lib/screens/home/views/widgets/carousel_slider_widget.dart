import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MyCarouselSlider extends StatefulWidget {
  const MyCarouselSlider({super.key});

  @override
  State<MyCarouselSlider> createState() => _MyCarouselSliderState();
}

class _MyCarouselSliderState extends State<MyCarouselSlider> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final urlImages1 = [
      'assets/images/a.png',
      'assets/images/b.png',
      'assets/images/c.png',
      'assets/images/d.png',
    ];
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: urlImages1.length,
          itemBuilder: (context, index, realIndex) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8)),
                  child: Image.asset(urlImages1[index], fit: BoxFit.cover),
                ),
              ),
            );
          },
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              currentIndex = index;
              setState(() {});
            },
            viewportFraction: 0.9,
            aspectRatio: 3,
            enlargeCenterPage: false,
            scrollDirection: Axis.horizontal,
            autoPlay: true, // Enlarge the center image
          ),
        ),
        const SizedBox(height: 12),
        Center(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                for (int i = 0; i < urlImages1.length; i++)
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                            color: i == currentIndex ? Colors.red : Colors.grey,
                            borderRadius: BorderRadius.circular(5))),
                  )
              ]),
        )
      ],
    );
  }
}
