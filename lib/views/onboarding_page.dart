import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:weather/models/weather_model..dart';
import 'package:weather/views/home_page.dart';
import 'package:weather/widgets/custom_onboard.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});
  static const routeName = "onboardingPage";
  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  PageController pageCont = PageController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Expanded(
              child: Center(
                child: PageView.builder(
                  controller: pageCont,
                  onPageChanged: (val) {
                    setState(() => currentIndex = val);
                  },
                  itemCount: weathersOnboard.length,
                  itemBuilder: (context, i) {
                    return CustomOnboarding(
                      img: weathersOnboard[i].img,
                      title: weathersOnboard[i].title,
                      des: weathersOnboard[i].des,
                    );
                  },
                ),
              ),
            ),
            Positioned(
              bottom:10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if(currentIndex < weathersOnboard.length - 1)
                    TextButton(
                      onPressed: () {
                        pageCont.jumpToPage(weathersOnboard.length - 1);
                      },
                      child:const Text("Skip"),
                    ),
                  SmoothPageIndicator(
                      controller: pageCont, // PageController
                      count: weathersOnboard.length, //ength, //ength, //
                      effect: const ScaleEffect(), // your preferred effect
                      onDotClicked: (index) {}),
                  MaterialButton(
                    onPressed: () {
                      if (currentIndex < weathersOnboard.length - 1) {
                        pageCont.nextPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInExpo,
                        );
                      }else{
                        // Navigate to main app after completing onboarding
                        Navigator.of(context).pushReplacementNamed(Home.routeName);
                      }
                    },
                    child: currentIndex < weathersOnboard.length - 1
                        ? const Text('Next')
                        : const Text("Get Started"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
