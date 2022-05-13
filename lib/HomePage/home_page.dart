import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:urban_wiper/Constants/constants.dart';
import 'package:urban_wiper/Widgets/fade_slide.dart';
import 'package:urban_wiper/Widgets/scale_animation.dart';
import 'package:urban_wiper/Widgets/washing_prices_and_details.dart';
import 'package:urban_wiper/modals/animation_items.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

List<String> carTypes = [
  "assets/images/hatchback.png",
  "assets/images/sedan.png",
  "assets/images/xuvs.png",
];

List<String> carTypeName = [
  "Hatchback",
  "Sedan",
  "XUVs & MUVs",
];

const Y_OFFSET = 60.0;

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late PageController pageController;
  double pageScrollValue = 4.0;
  int activePage = 4;

  late AnimationController animationController;
  late Animation animation;

  List<AnimationItem> animationItems = [
    AnimationItem(
      id: "slide-1",
      entry: 100,
      entryDuration: 400,
      visible: false,
    ),
    AnimationItem(
      id: "slide-2",
      entry: 150,
      entryDuration: 400,
      visible: false,
    ),
    AnimationItem(
      id: "slide-3",
      entry: 160,
      entryDuration: 400,
      visible: false,
    ),
    AnimationItem(
      id: "slide-4",
      entry: 180,
      entryDuration: 400,
      visible: false,
    ),
    AnimationItem(
      id: "slide-5",
      entry: 200,
      entryDuration: 400,
      visible: false,
    ),
    AnimationItem(
      id: "slide-6",
      entry: 190,
      entryDuration: 400,
      visible: false,
    ),
    AnimationItem(
      id: "slide-7",
      entry: 210,
      entryDuration: 400,
      visible: false,
    ),
  ];

  @override
  void initState() {
    pageController = PageController(initialPage: 4, viewportFraction: .55)
      ..addListener(() {
        setState(() {
          activePage = pageController.page!.round();
          pageScrollValue = pageController.page!;
        });
      });

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    animation = Tween<double>(begin: 0, end: 210).animate(animationController)
      ..addListener(() {
        setState(() {
          animationItems = updateVisibleState(animationItems, animation.value);
        });
      });

    animationController.forward();

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FadeSlide(
                direction: getItemVisibility("slide-1", animationItems),
                offsetX: 0.0,
                offsetY: Y_OFFSET,
                duration: getSlideDuration("slide-1", animationItems),
                child: const Text(
                  "Urban Wiper",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26.0,
                    color: kPrimaryColor,
                  ),
                ),
              ),
              const SizedBox(height: 50.0),
              FadeSlide(
                direction: getItemVisibility("slide-2", animationItems),
                offsetX: 0.0,
                offsetY: Y_OFFSET,
                duration: getSlideDuration("slide-2", animationItems),
                child: const Text(
                  "CHOOSE\nYOUR CAR\nTYPE",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32.0,
                    height: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              FadeSlide(
                direction: getItemVisibility("slide-3", animationItems),
                offsetX: 0.0,
                offsetY: Y_OFFSET,
                duration: getSlideDuration("slide-3", animationItems),
                child: const Text(
                  "Get Best Deals On Washing",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                    height: 1.5,
                  ),
                ),
              ),
              Flexible(
                child: PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  controller: pageController,
                  itemBuilder: (context, index) {
                    return Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: index.toDouble() == pageScrollValue
                                ? Text(
                                    carTypeName[index],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  )
                                : Text(
                                    carTypeName[index],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                    ),
                                  ),
                          ),
                          const SizedBox(height: 30),
                          Stack(
                            alignment: Alignment.topRight,
                            children: <Widget>[
                              ScaleAnimation(
                                duration:
                                    getSlideDuration("slide-4", animationItems),
                                direction: getItemVisibility(
                                    "slide-4", animationItems),
                                child: AnimatedContainer(
                                  padding: const EdgeInsets.all(40.0),
                                  duration: const Duration(milliseconds: 300),
                                  height: activePage == index ? 180.0 : 100.0,
                                  width: activePage == index ? 180.0 : 100.0,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFFE4E4EE),
                                  ),
                                  child: Transform.scale(
                                    scale: max(
                                      .5,
                                      1.0 - (pageScrollValue - index).abs(),
                                    ),
                                    child: Image.asset(
                                      carTypes[index],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 10.0,
                                right: 10.0,
                                child: ScaleAnimation(
                                  duration: getSlideDuration(
                                      "slide-6", animationItems),
                                  direction: getItemVisibility(
                                      "slide-6", animationItems),
                                  child: AnimatedSwitcher(
                                    duration: const Duration(
                                      milliseconds: 150,
                                    ),
                                    child: index.toDouble() == pageScrollValue
                                        ? Container(
                                            width: 30.0,
                                            height: 30.0,
                                            decoration: const BoxDecoration(
                                              color: kPrimaryColor,
                                              shape: BoxShape.circle,
                                            ),
                                            child: const Icon(
                                              Icons.check,
                                              color: Colors.white,
                                            ),
                                          )
                                        : const SizedBox.shrink(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: carTypes.length,
                ),
              ),
              FadeSlide(
                direction: getItemVisibility("slide-5", animationItems),
                offsetX: 0.0,
                offsetY: Y_OFFSET,
                duration: getSlideDuration("slide-5", animationItems),
                child: const Text(
                  "Swipe left or right to see more",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                    height: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              FadeSlide(
                offsetX: 0.0,
                offsetY: Y_OFFSET,
                duration: getSlideDuration("slide-7", animationItems),
                direction: getItemVisibility("slide-7", animationItems),
                child: GestureDetector(
                  onTap: () {
                    // Show bottom sheet on click
                    showModalBottomSheet(
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50.0),
                          topRight: Radius.circular(50.0),
                        ),
                      ),
                      barrierColor: Colors.black.withOpacity(.8),
                      context: context,
                      builder: (_) {
                        return const WashingPricesAndDetails();
                      },
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          "Continue",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
