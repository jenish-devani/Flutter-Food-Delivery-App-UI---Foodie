import 'package:flutter/material.dart';

import '../constants.dart';

class RestaurentInfoCard extends StatelessWidget {

  final String name, location, image;
  final double rating;
  final int time;
  final VoidCallback press;

  const RestaurentInfoCard({
    Key? key,
    required this.name,
    required this.location,
    required this.rating,
    required this.time,
    required this.press,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        width: 186,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.25,
              child: Image.asset(image),
            ),
            const SizedBox(
              height: defaultPadding / 4,
            ),
            Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              location,
              maxLines: 1,
              style: const TextStyle(color: kBodyTextColor),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
              child: DefaultTextStyle(
                style: const TextStyle(color: Colors.black, fontSize: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          child: Text(
                            rating.toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                      decoration: BoxDecoration(
                          color: kActiveColor,
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    Text("$time Min"),
                    const CircleAvatar(
                      radius: 2,
                      backgroundColor: Color(0xff868686),
                    ),
                    const Text("Free Delivery")
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
