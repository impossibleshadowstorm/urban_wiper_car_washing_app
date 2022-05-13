import 'package:flutter/material.dart';
import 'package:urban_wiper/Widgets/fade_slide.dart';
import 'package:urban_wiper/modals/animation_items.dart';

class WashingPricesAndDetails extends StatefulWidget {
  const WashingPricesAndDetails({Key? key}) : super(key: key);

  @override
  State<WashingPricesAndDetails> createState() =>
      _WashingPricesAndDetailsState();
}

class _WashingPricesAndDetailsState extends State<WashingPricesAndDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 520,
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 15.0),
            FadeSlide(
              offsetX: 0.0,
              offsetY: 150.0,
              duration: getSlideDuration("slide-1", animationItems),
              child: Image.asset(
                "assets/bmw.png",
                width: 50.0,
              ),
              direction: !getItemVisibility("slide-1", animationItems),
            ),
          ],
        ));
  }
}
