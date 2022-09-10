import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({
    Key? key,
    required this.doc,
  }) : super(key: key);

  final dynamic doc;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: context.paddingLow,
      padding: context.paddingLow,
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: context.normalBorderRadius,
      ),
      child: Row(
        children: [
          Container(
            width: context.width * 0.3,
            height: context.height * 0.15,
            decoration: BoxDecoration(
              borderRadius: context.normalBorderRadius,
              image: DecorationImage(
                image: NetworkImage(doc["image"]),
                fit: BoxFit.cover,
              ),
            ),
          ),
          context.emptySizedWidthBoxLow,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: context.width * 0.5,
                child: Text(
                  doc["title"],
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.headline5?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
              context.emptySizedHeightBoxLow,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    color: Colors.pink,
                    size: 30,
                  ),
                  SizedBox(
                    width: context.width / 2,
                    child: Text(
                      doc["location"],
                      style: context.textTheme.subtitle1?.copyWith(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
