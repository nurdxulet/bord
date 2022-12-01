import 'package:auto_route/auto_route.dart';
import 'package:bord/const.dart';
import 'package:bord/models/organization.dart';
import 'package:flutter/material.dart';
import 'package:bord/custom/get_sredniy_check.dart';
import 'package:bord/custom/onboard.dart';
import 'package:bord/models/promotion.dart';

class PromotionInfo extends StatefulWidget {
  final Organization organization;
  final Promotion promotions;
  const PromotionInfo(
      {super.key, required this.organization, required this.promotions});

  @override
  State<PromotionInfo> createState() => _PromotionInfoState();
}

class _PromotionInfoState extends State<PromotionInfo> {
  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final List<Onboard> _demoData = [
    Onboard(image: 'images/news_photo.png'),
    Onboard(
      image: 'images/news_photo.png',
    ),
    Onboard(
      image: 'images/news_photo.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leadingWidth: MediaQuery.of(context).size.width * 0.3,
        leading: ElevatedButton.icon(
          onPressed: () => context.router.pop(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.green,
          ),
          label: const Text(
            'Назад',
            style: TextStyle(
              color: Colors.green,
            ),
          ),
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.261,
            width: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: 1,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: PageView.builder(
                itemCount: _demoData.length,
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _pageIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  index = _pageIndex;
                  return OnboardContent(
                    image: _demoData[index].image,
                  );
                }),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.021,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                demoData.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: DotIndicator(
                    isActive: index == _pageIndex,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.021,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.promotions.promotionTitle,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    widget.organization.organizationName,
                    style: const TextStyle(
                      fontSize: 25,
                      color: Color(0xff0AAB39),
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    'Дата проведения: ${widget.promotions.promotionStartDate.day}.${widget.promotions.promotionStartDate.month}-${widget.promotions.promotionStartDate.day}.${widget.promotions.promotionStartDate.month}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const Text(
                    'Описание',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    widget.promotions.promotionDescription,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.1194,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 1,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 24,
                    child: Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.organization.organizationName,
                            style: const TextStyle(
                                color: Color(0xff59B433),
                                fontWeight: FontWeight.w600,
                                fontSize: 20),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Text(
                                ' ${widget.organization.kitchen}',
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              const Icon(
                                Icons.circle_rounded,
                                size: 5,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              getSredniyCheck(widget.organization.averageCheck),
                              const SizedBox(
                                width: 4,
                              ),
                              const Icon(
                                Icons.circle_rounded,
                                size: 5,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                ' ${widget.organization.rating}',
                                style: kRestaurantOpisanie,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                '(${widget.organization.ratedUsersAmount})',
                                style: kRestaurantOpisanie,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                        'images/open_now_cafe0.png',
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
