import 'package:flutter/material.dart';
import 'package:foodie/constants.dart';
import 'package:foodie/demodata.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Column(
              children: [
                Text("DELIVERY TO",
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(color: kActiveColor)),
                const Text(
                  "Surat Gujarat",
                  style: TextStyle(color: Colors.black),
                )
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Filter',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
          const SliverToBoxAdapter(
            child: ImageCarousel(),
          )
        ],
      ),
    );
  }
}

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({
    Key? key,
  }) : super(key: key);

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.81,
      child: Stack(children: [
        PageView.builder(
          itemCount: demoBigImages.length,
          onPageChanged: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          itemBuilder: (context, index) => Image.asset(demoBigImages[index]),
        ),
        Positioned(
            bottom: defaultPadding,
            right: defaultPadding,
            child: Row(
                children: List.generate(
                    demoBigImages.length,
                    (index) => Padding(
                        padding:
                            const EdgeInsets.only(left: defaultPadding / 4),
                        child: Indicator(isActive: index == currentIndex)))))
      ]),
    );
  }
}

class Indicator extends StatelessWidget {
  final bool isActive;
  const Indicator({
    Key? key,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: 8,
      decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.white30,
          borderRadius: const BorderRadius.all(Radius.circular(12))),
    );
  }
}
