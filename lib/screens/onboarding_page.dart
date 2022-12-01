import 'package:flutter/material.dart';

const Color kMainColor = Color(0xff2E4392);

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              /* Row(
                children: [
                  _pageIndex != 0
                      ? GestureDetector(
                          onTap: () {
                            setState(() {
                              _pageIndex--;
                              _pageController =
                                  PageController(initialPage: _pageIndex);
                            });
                          },
                          child: Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Icon(
                                Icons.arrow_back_ios,
                                size: 20,
                                color: kMainColor,
                              ),
                              const Text(
                                'Назад',
                                style: TextStyle(
                                  color: kMainColor,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        )
                      : SizedBox(),
                  const Spacer(),
                  _pageIndex != 2
                      ? GestureDetector(
                          onTap: () {
                            setState(() {
                              _pageIndex = 2;
                              _pageController =
                                  PageController(initialPage: _pageIndex);
                            });
                          },
                          child: Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Text(
                                'Пропустить',
                                style: TextStyle(
                                  color: kMainColor,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        )
                      : SizedBox(),
                ],
              ), */
              SizedBox(
                height: 300,
                child: Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                          itemCount: demoData.length,
                          controller: _pageController,
                          onPageChanged: (index) {
                            setState(() {
                              _pageIndex = index;
                            });
                          },
                          itemBuilder: (context, index) {
                            index = _pageIndex;
                            return OnboardContent(
                              image: demoData[index].image,
                            );
                          }),
                    ),
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
              ),

              /* Row(
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
                  const Spacer(),
                  _pageIndex != 2
                      ? Container(
                          width: 97,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: Color(0xff2E4392),
                          ),
                          height: 50,
                          child: TextButton(
                            onPressed: () {
                              _pageController.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.ease);
                            },
                            child: const Text(
                              'Дальше',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        )
                      : Container(
                          width: 97,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: Color(0xff2E4392),
                          ),
                          height: 50,
                          child: TextButton(
                            onPressed: () {
                              _pageController.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.ease);
                            },
                            child: const Text(
                              'Начать',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                ],
              ) */
            ],
          ),
        ),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
    this.isActive = false,
  }) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 4,
      width: isActive ? 24 : 10,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xff2E4392) : Colors.grey,
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }
}

class Onboard {
  final String image;

  Onboard({
    required this.image,
  });
}

final List<Onboard> demoData = [
  Onboard(image: 'images/cafe.png'),
  Onboard(
    image: 'images/cafe.png',
  ),
  Onboard(
    image: 'images/cafe.png',
  ),
];

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Spacer(),
      Image.asset(
        image,
        height: 200,
        width: 300,
      ),
      const SizedBox(
        height: 50,
      ),
      const Spacer(),
    ]);
  }
}
