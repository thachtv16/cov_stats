import 'package:cov_stats/app_color.dart';
import 'package:cov_stats/app_scroll_behavior.dart';
import 'package:cov_stats/app_string.dart';
import 'package:cov_stats/app_styles.dart';
import 'package:cov_stats/app_svg.dart';
import 'package:cov_stats/bottom_bar.dart';
import 'package:cov_stats/model/welcome_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  int _currentIndex = 0;
  late PageController _pageController;

  List<WelcomeData> welcomes = [];

  getWelcomeData() {
    welcomes.add(WelcomeData(AppSvg.SVG_FEVER, "Fever", AppString.fever));
    welcomes.add(WelcomeData(AppSvg.SVG_COUGH, "Cough", AppString.cough));
    welcomes.add(WelcomeData(
        AppSvg.SVG_BREATHING, "Breathing Difficulty", AppString.breathing));
  }

  @override
  void initState() {
    _pageController = PageController();
    getWelcomeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.colorPrimary,
      body: Column(
        children: [
          Expanded(
              flex: 7,
              child: Container(
                child: PageView.builder(
                    scrollBehavior: OverScrollBehavior(),
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    itemCount: welcomes.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Column(
                          children: [
                            Container(
                              height: size.height * 5 / 8,
                              child: Container(
                                  alignment: Alignment.bottomCenter,
                                  padding: const EdgeInsets.only(bottom: 44),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: AppColor.colorBackground,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                              color: AppColor.colorBoxShadow,
                                              offset: Offset(3, 6),
                                              blurRadius: 6)
                                        ]),
                                    child: SvgPicture.asset(
                                      welcomes[index].avatar!,
                                    ),
                                  )),
                            ),
                            Container(
                              height: size.height / 4,
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Text(
                                    welcomes[index].title!,
                                    textAlign: TextAlign.center,
                                    style: AppStyles.b28,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Text(
                                      welcomes[index].description!,
                                      textAlign: TextAlign.center,
                                      style: AppStyles.r16,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              )),
          Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        gotoBottomBar();
                      },
                      child: Text(
                        "Skip",
                        style: AppStyles.r16,
                      )),
                  Center(
                    child: Container(
                      alignment: Alignment.center,
                      width: 64,
                      height: 24,
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      child: ScrollConfiguration(
                        behavior: OverScrollBehavior(),
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return buildIndicator(index == _currentIndex);
                            }),
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        if (_currentIndex != 2) {
                          _currentIndex++;
                          _pageController.animateToPage(_currentIndex,
                              duration: const Duration(microseconds: 400),
                              curve: Curves.easeIn);
                        } else {
                          gotoBottomBar();
                        }
                      },
                      child: Text(
                        "Next",
                        style: AppStyles.r16,
                      ))
                ],
              ))
        ],
      ),
    );
  }

  Widget buildIndicator(bool isActive) {
    return Container(
      width: 8,
      height: 8,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: isActive
              ? AppColor.colorSecondary
              : AppColor.colorIndicatorInactive,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(
                color: AppColor.colorBoxShadow,
                offset: Offset(2, 3),
                blurRadius: 3)
          ]),
    );
  }

  void gotoBottomBar() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => BottomBar()), (route) => false);
  }
}
