import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:bord/const.dart';
import 'package:bord/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:bord/models/organization.dart';
import 'package:bord/models/promotion.dart';

class NewsLVSeparatedContainer extends StatefulWidget {
  const NewsLVSeparatedContainer({
    Key? key,
  }) : super(key: key);

  @override
  State<NewsLVSeparatedContainer> createState() =>
      _NewsLVSeparatedContainerState();
}

class _NewsLVSeparatedContainerState extends State<NewsLVSeparatedContainer> {
  List<Organization> organizations = [
    Organization(
      organizationID: 1,
      organizationName: 'Cafe Bilhares',
      averageCheck: 3500,
      kitchen: 'Итальянская',
      rating: 4.5,
      ratedUsersAmount: 25,
      imageAsset: 'images/news_photo.png',
    ),
    Organization(
      organizationID: 2,
      organizationName: 'Maki-Maki',
      averageCheck: 5000,
      kitchen: 'Японская',
      rating: 4.7,
      ratedUsersAmount: 15,
      imageAsset: 'images/news_photo.png',
    ),
    Organization(
      organizationID: 3,
      organizationName: 'Zheka\'s Doner House',
      averageCheck: 2400,
      kitchen: 'Турецкая',
      rating: 3.9,
      ratedUsersAmount: 34,
      imageAsset: 'images/news_photo.png',
    ),
  ];

  @override
  void initState() {
    log('ORGANIZATION NAME => ${organizations.first.organizationName}');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Promotion> promotions = [
      Promotion(
        organization: organizations[0],
        promotionDescription:
            'Закажи одну пиццу и получи вторую бесплатно... typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a ',
        promotionTitle: 'Акция 1+1',
        promotionStartDate: DateTime(2022, 9, 7),
        promotionEndDate: DateTime(2022, 9, 9),
      ),
      Promotion(
        organization: organizations[1],
        promotionDescription:
            'Закажи две пиццы и получи вторую бесплатно... typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a ',
        promotionTitle: 'Напитки по акции',
        promotionStartDate: DateTime(2022, 9, 5),
        promotionEndDate: DateTime(2022, 9, 20),
      ),
      Promotion(
        organization: organizations[2],
        promotionDescription:
            'Закажи три пиццу и получи вторую бесплатно... typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a ',
        promotionTitle: 'Празднуем Хэллоуин',
        promotionStartDate: DateTime(2022, 9, 12),
        promotionEndDate: DateTime(2022, 9, 17),
      ),
    ];
    return Container(
      color: Colors.white,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: promotions.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 12),
            child: GestureDetector(
              onTap: () {
                // log("message");
                context.router.push(PromotionInfoRoute(
                    organization: organizations[index],
                    promotions: promotions[index]));
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.2573,
                width: MediaQuery.of(context).size.width * 0.9173,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(-1, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 4,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(5.0)),
                        child: Image.asset(
                          organizations[index].imageAsset,
                          fit: BoxFit.cover,
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  promotions[index].promotionTitle,
                                  style: kPromoTextStyle,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  '${promotions[index].promotionStartDate.day}.${promotions[index].promotionStartDate.month}-${promotions[index].promotionEndDate.day}.${promotions[index].promotionEndDate.month}',
                                  style: kPromoTimeTextStyle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            promotions[index].organization.organizationName,
                            style: kNameTextStyle,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            promotions[index].promotionDescription,
                            style: kPromoDescriptionTextStyle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
