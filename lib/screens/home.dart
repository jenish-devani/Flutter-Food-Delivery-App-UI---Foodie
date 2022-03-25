import 'package:flutter/material.dart';
import 'package:foodie/constants.dart';
import 'package:foodie/demodata.dart';

import '../components/image_carousel.dart';
import '../components/restaurant_card.dart';
import '../components/setction_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            backgroundColor: Colors.white,
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
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding / 1.7),
            sliver: SliverToBoxAdapter(
              child: ImageCarousel(),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(defaultPadding),
            sliver: SectionTitle(title: "Featured Partners", press: () {}),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: defaultPadding / 3, right: 12),
                child: Row(
                  children: List.generate(
                    demoMediumCardData.length,
                    (index) => Padding(
                      padding:
                          const EdgeInsets.only(left: defaultPadding / 1.5),
                      child: RestaurentInfoCard(
                        name: demoMediumCardData[index]['name'],
                        location: demoMediumCardData[index]['location'],
                        rating: demoMediumCardData[index]['rating'],
                        time: demoMediumCardData[index]['delivertTime'],
                        image: demoMediumCardData[index]['image'],
                        press: () {},
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(defaultPadding),
            sliver: SectionTitle(title: "Best Picks", press: () {}),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: defaultPadding / 3, right: 12),
                child: Row(
                  children: List.generate(
                    demoMediumCardData.length,
                    (index) => Padding(
                      padding:
                          const EdgeInsets.only(left: defaultPadding / 1.5),
                      child: RestaurentInfoCard(
                        name: demoMediumCardData[index]['name'],
                        location: demoMediumCardData[index]['location'],
                        rating: demoMediumCardData[index]['rating'],
                        time: demoMediumCardData[index]['delivertTime'],
                        image: demoMediumCardData[index]['image'],
                        press: () {},
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(defaultPadding),
            sliver: SliverToBoxAdapter(
              child: Image.asset('assets/images/Banner.png'),
            ),
          )
        ],
      ),
    );
  }
}
