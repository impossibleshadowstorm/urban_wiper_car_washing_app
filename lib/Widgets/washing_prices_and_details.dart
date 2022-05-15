import 'package:flutter/material.dart';
import 'package:urban_wiper/HomePage/washing_package_details.dart';
import 'package:urban_wiper/Widgets/animate_transition.dart';
import 'package:urban_wiper/Widgets/fade_slide.dart';
import 'package:urban_wiper/modals/animation_items.dart';

class WashingPricesAndDetails extends StatefulWidget {
  final String carTypeName;
  final String carTypeImage;
  const WashingPricesAndDetails({
    Key? key,
    required this.carTypeName,
    required this.carTypeImage,
  }) : super(key: key);

  @override
  State<WashingPricesAndDetails> createState() =>
      _WashingPricesAndDetailsState();
}

class _WashingPricesAndDetailsState extends State<WashingPricesAndDetails>
    with SingleTickerProviderStateMixin {
  List<AnimationItem> animationItems = [
    AnimationItem(
      id: "slide-1",
      entry: 30,
      entryDuration: 300,
      visible: false,
    ),
    AnimationItem(
      id: "slide-2",
      entry: 30,
      entryDuration: 300,
      visible: false,
    ),
    AnimationItem(
      id: "slide-3",
      entry: 35,
      entryDuration: 300,
      visible: false,
    ),
    AnimationItem(
      id: "slide-4",
      entry: 40,
      entryDuration: 300,
      visible: false,
    ),
    AnimationItem(
      id: "slide-12",
      entry: 64,
      entryDuration: 300,
      visible: false,
    ),
  ];

  late AnimationController animationController;
  late Animation animation;

  @override
  void initState() {
    animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    animation = Tween<double>(begin: 0, end: 64).animate(animationController)
      ..addListener(() {
        setState(() {
          animationItems = updateVisibleState(animationItems, animation.value);
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 420,
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 15.0),
          FadeSlide(
            offsetX: 0.0,
            offsetY: 150.0,
            duration: getSlideDuration("slide-1", animationItems),
            child: Image.asset(
              widget.carTypeImage,
              width: 50.0,
            ),
            direction: !getItemVisibility("slide-1", animationItems),
          ),
          const SizedBox(height: 8.0),
          FadeSlide(
            offsetX: 0.0,
            offsetY: 150.0,
            duration: getSlideDuration("slide-2", animationItems),
            child: Text(
              widget.carTypeName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 27.0,
              ),
            ),
            direction: !getItemVisibility("slide-2", animationItems),
          ),
          FadeSlide(
            offsetX: 0.0,
            offsetY: 150.0,
            duration: getSlideDuration("slide-3", animationItems),
            child: const Text(
              "Washing Options",
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey,
              ),
            ),
            direction: !getItemVisibility("slide-3", animationItems),
          ),
          const SizedBox(height: 20.0),
          SizedBox(
            height: 200.0,
            child: FadeSlide(
              offsetX: 0.0,
              offsetY: 150.0,
              direction: !getItemVisibility("slide-4", animationItems),
              duration: getSlideDuration("slide-4", animationItems),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        await animationController.forward();
                        animateTransition(
                          context,
                          WashingPackageDetails(
                            carTypeImg: widget.carTypeImage,
                            carTypeNm: widget.carTypeName,
                            package: 1,
                          ),
                        );
                      },
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              width: 130.0,
                              padding: const EdgeInsets.all(20.0),
                              decoration: BoxDecoration(
                                color: const Color(0xFFE4E4EE),
                                borderRadius: BorderRadius.circular(12.0),
                                image: const DecorationImage(
                                  image: AssetImage(
                                      "assets/images/carbig-grey.png"),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          const Text(
                            "12 Days",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                            ),
                          ),
                          const SizedBox(height: 2.0),
                          const Text(
                            "Light Package",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              width: 130.0,
                              padding: const EdgeInsets.all(20.0),
                              decoration: BoxDecoration(
                                color: const Color(0xFFE4E4EE),
                                borderRadius: BorderRadius.circular(12.0),
                                image: const DecorationImage(
                                  image: AssetImage(
                                      "assets/images/carbig-green.png"),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          const Text(
                            "24 Days",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                            ),
                          ),
                          const SizedBox(height: 2.0),
                          const Text(
                            "Premium Package",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // FadeSlide(
          //   offsetX: 0.0,
          //   offsetY: 150.0,
          //   direction: !getItemVisibility("slide-12", animationItems),
          //   duration: getSlideDuration("slide-12", animationItems),
          //   child: Container(
          //     width: MediaQuery.of(context).size.width * .7,
          //     decoration: BoxDecoration(
          //       color: kPrimaryColor,
          //       borderRadius: BorderRadius.circular(24.0),
          //     ),
          //     child: GestureDetector(
          //       onTap: () async {
          //          await animationController.forward();
          //           animateTransition(context, const WashingPackageDetails());
          //       },
          //       child: Container(
          //         padding: const EdgeInsets.symmetric(vertical: 22.0),
          //         child: const Text(
          //           "View All",
          //           style: TextStyle(
          //             color: Colors.white,
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
