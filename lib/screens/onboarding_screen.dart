import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  // TODO: Add OnboardingScreen MaterialPage Helper

  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();
  final Color rwColor = const Color.fromRGBO(64, 143, 77, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: const Text('Getting Started'),
          leading: GestureDetector(
            child: const Icon(
              Icons.chevron_left,
              size: 35,
            ),
            onTap: () {
              Navigator.pop(context, true);
            },
          )),
      body: SafeArea(
          child: Column(children: [
        Expanded(child: buildPages()),
        buildIndicator(),
        buildActionButtons(),
      ])),
    );
  }

  Widget buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MaterialButton(
          child: const Text('Skip'),
          onPressed: () {
            // TODO: Onboarding -> Navigate to home
          },
        ),
      ],
    );
  }

  Widget buildIndicator() {
    return SmoothPageIndicator(
      controller: controller,
      count: 3,
      effect: WormEffect(activeDotColor: rwColor),
    );
  }

  Widget onBoardPageView(ImageProvider imageProvider, String text) {
    return Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Image(image: imageProvider, fit: BoxFit.fitWidth)),
              const SizedBox(
                height: 16,
              ),
              Text(text,
                  style: const TextStyle(fontSize: 20),
                  textAlign: TextAlign.center)
            ]));
  }

  Widget buildPages() {
    return PageView(
      controller: controller,
      children: [
        onBoardPageView(
            AssetImage('../../assets/fooderlich_assets/recommend.png'),
            '''Check out weekly recommended recipes and what your friends are cooking!
        '''),
        onBoardPageView(
          AssetImage('../../assets/fooderlich_assets/sheet.png'),
          'Keep track of what you need to buy',
        ),
        onBoardPageView(
          AssetImage('../../assets/fooderlich_assets/list.png'),
          'Keep track of what you need to buy',
        ),
      ],
    );
  }
}
