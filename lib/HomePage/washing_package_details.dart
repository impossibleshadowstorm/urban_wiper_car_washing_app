import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:urban_wiper/Constants/constants.dart';
import 'package:urban_wiper/Constants/details.dart';
import 'package:urban_wiper/HomePage/home_page.dart';
import 'package:urban_wiper/Widgets/animate_transition.dart';
import 'package:urban_wiper/Widgets/fade_slide.dart';
import 'package:urban_wiper/Widgets/scale_animation.dart';
import 'package:urban_wiper/modals/animation_items.dart';

class WashingPackageDetails extends StatefulWidget {
  final String carTypeImg;
  final String carTypeNm;
  final int package;
  final int carTypeIndex;
  const WashingPackageDetails({
    Key? key,
    required this.carTypeNm,
    required this.carTypeImg,
    required this.package,
    required this.carTypeIndex,
  }) : super(key: key);

  @override
  State<WashingPackageDetails> createState() => _WashingPackageDetailsState();
}

List<Map> colors = [
  {
    "name": "black",
    "color": Colors.black,
    "asset": "assets/images/carbig-black.png",
  },
  {
    "name": "green",
    "color": Colors.green,
    "asset": "assets/images/carbig-green.png",
  },
  {
    "name": "grey",
    "color": Colors.grey,
    "asset": "assets/images/carbig-grey.png",
  },
  {
    "name": "purple",
    "color": Colors.purple,
    "asset": "assets/images/carbig-purple.png",
  },
  {
    "name": "red",
    "color": Colors.red,
    "asset": "assets/images/carbig.png",
  },
];

class _WashingPackageDetailsState extends State<WashingPackageDetails>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;
  List<AnimationItem> animationItems = [];

  int selectedIndex = 0;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    for (int i = 0; i < 10; i++) {
      animationItems.add(
        AnimationItem(
          id: "slide-${i + 1}",
          entry: 30 * (i + 1),
          entryDuration: 250,
          visible: false,
        ),
      );
    }
    animation = Tween<double>(begin: 0, end: 300).animate(animationController)
      ..addListener(() {
        setState(() {
          animationItems = updateVisibleState(
            animationItems,
            animation.value,
          );
        });
      });
    animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFF4F4FF),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(
                        height: kToolbarHeight,
                      ),
                      FadeSlide(
                        direction: getItemVisibility("slide-1", animationItems),
                        duration: getSlideDuration("slide-1", animationItems),
                        offsetY: 60.0,
                        offsetX: 0.0,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                animateTransition(
                                  context,
                                  const HomePage(),
                                );
                              },
                              child: Container(
                                height: 45.0,
                                width: 45.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                child: const Icon(
                                  FontAwesomeIcons.chevronLeft,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25.0),
                      FadeSlide(
                        direction: getItemVisibility("slide-2", animationItems),
                        duration: getSlideDuration("slide-2", animationItems),
                        offsetY: 60.0,
                        offsetX: 0.0,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: widget.carTypeNm + "\n",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22.0,
                                  color: Color(0xFF333333),
                                ),
                              ),
                              const TextSpan(
                                text: "Light Package",
                                style: TextStyle(
                                  height: 1.7,
                                  fontSize: 14.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      Expanded(
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 500),
                          child: ScaleAnimation(
                            // key: ValueKey(colors[selectedIndex]["asset"]),
                            duration:
                                getSlideDuration("slide-3", animationItems),
                            child: Align(
                              alignment: Alignment.center,
                              child: Image.asset(
                                widget.carTypeImg,
                              ),
                            ),
                            direction:
                                getItemVisibility("slide-3", animationItems),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: FadeSlide(
                  duration: getSlideDuration("slide-4", animationItems),
                  direction: getItemVisibility("slide-4", animationItems),
                  offsetX: 0.0,
                  offsetY: 60.0,
                  child: Container(
                    height: 360.0,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.0),
                        topRight: Radius.circular(50.0),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 32.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedTab = 0;
                                        });
                                      },
                                      child: selectedTab == 0
                                          ? _getTabItem("Features", true)
                                          : _getTabItem("Features", false),
                                    ),
                                  ),
                                  const SizedBox(width: 15.0),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedTab = 1;
                                        });
                                      },
                                      child: selectedTab == 1
                                          ? _getTabItem("About Car", true)
                                          : _getTabItem("About Car", false),
                                    ),
                                  ),
                                  const SizedBox(width: 15.0),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedTab = 2;
                                        });
                                      },
                                      child: selectedTab == 2
                                          ? _getTabItem("Support", true)
                                          : _getTabItem("Support", false),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 25.0),
                              _getPackageDetails(
                                  widget.package, widget.carTypeIndex),
                              const SizedBox(height: 15.0),
                              const Divider(),
                              const SizedBox(height: 15.0),
                              // Row(
                              //   children: colors.map((color) {
                              //     int index = colors.indexOf(color);
                              //     return GestureDetector(
                              //       onTap: () {
                              //         setState(() {
                              //           // Change selected index
                              //           selectedIndex = index;
                              //         });
                              //       },
                              //       child: Container(
                              //         height: 35.0,
                              //         width: 35.0,
                              //         margin: const EdgeInsets.only(
                              //           right: 10.0,
                              //         ),
                              //         decoration: BoxDecoration(
                              //           color: color["color"],
                              //           shape: BoxShape.circle,
                              //           border: Border.all(
                              //             width: 4.0,
                              //             color: index == selectedIndex
                              //                 ? kPrimaryColor
                              //                 : Colors.transparent,
                              //           ),
                              //         ),
                              //       ),
                              //     );
                              //   }).toList(),
                              // ),
                              const SizedBox(height: 30.0),
                            ],
                          ),
                        ),
                        SizedBox(
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 50.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey.shade400,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    12.0,
                                  ),
                                ),
                                child: const Icon(FontAwesomeIcons.heart),
                              ),
                              const SizedBox(width: 20.0),
                              Expanded(
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 17.0,
                                      ),
                                      child: Center(
                                        child: widget.package == 1
                                            ? Text(
                                                lightPackageDetails[widget
                                                        .carTypeIndex]['price']
                                                    .toString(),
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                ),
                                              )
                                            : Text(
                                                premiumPackageDetails[widget
                                                        .carTypeIndex]['price']
                                                    .toString(),
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                ),
                                              ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _getPackageDetails(int pkgNo, int index) {
  if (pkgNo == 1) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          lightPackageDetails[index]['feature1'].toString(),
          style: TextStyle(
            height: 1.5,
            fontSize: 16.0,
            color: Colors.black.withOpacity(.5),
          ),
        ),
        Text(
          lightPackageDetails[index]['feature2'].toString(),
          style: TextStyle(
            height: 1.5,
            fontSize: 16.0,
            color: Colors.black.withOpacity(.5),
          ),
        ),
        Text(
          lightPackageDetails[index]['feature3'].toString(),
          style: TextStyle(
            height: 1.5,
            fontSize: 16.0,
            color: Colors.black.withOpacity(.5),
          ),
        ),
        Text(
          lightPackageDetails[index]['feature4'].toString(),
          style: TextStyle(
            height: 1.5,
            fontSize: 16.0,
            color: Colors.black.withOpacity(.5),
          ),
        ),
        Text(
          lightPackageDetails[index]['feature5'].toString(),
          style: TextStyle(
            height: 1.5,
            fontSize: 16.0,
            color: Colors.black.withOpacity(.5),
          ),
        ),
      ],
    );
  } else {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          premiumPackageDetails[index]['feature1'].toString(),
          style: TextStyle(
            height: 1.5,
            fontSize: 16.0,
            color: Colors.black.withOpacity(.5),
          ),
        ),
        Text(
          premiumPackageDetails[index]['feature2'].toString(),
          style: TextStyle(
            height: 1.5,
            fontSize: 16.0,
            color: Colors.black.withOpacity(.5),
          ),
        ),
        Text(
          premiumPackageDetails[index]['feature3'].toString(),
          style: TextStyle(
            height: 1.5,
            fontSize: 16.0,
            color: Colors.black.withOpacity(.5),
          ),
        ),
        Text(
          premiumPackageDetails[index]['feature4'].toString(),
          style: TextStyle(
            height: 1.5,
            fontSize: 16.0,
            color: Colors.black.withOpacity(.5),
          ),
        ),
        Text(
          premiumPackageDetails[index]['feature5'].toString(),
          style: TextStyle(
            height: 1.5,
            fontSize: 16.0,
            color: Colors.black.withOpacity(.5),
          ),
        ),
      ],
    );
  }
}

Widget _getTabItem(String text, bool isActive) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        text,
        style: TextStyle(
          color:
              isActive ? const Color(0xFF333333) : Colors.black.withOpacity(.5),
          fontSize: isActive ? 17.0 : 14.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      isActive
          ? Container(
              margin: const EdgeInsets.only(top: 5.0),
              height: 4.0,
              width: 40.0,
              decoration: BoxDecoration(
                color: isActive ? kPrimaryColor : Colors.transparent,
                borderRadius: BorderRadius.circular(10.0),
              ),
            )
          : const SizedBox.shrink()
    ],
  );
}
