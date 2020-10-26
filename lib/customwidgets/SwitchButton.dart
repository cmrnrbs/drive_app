import 'package:flutter/material.dart';

import '../colors.dart';

class SwitchButton extends StatefulWidget {
  @override
  _SwitchButtonState createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton>
    with TickerProviderStateMixin {
  bool isActive = true;

  Animation<double> animation;
  AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    animation = Tween<double>(begin: 5, end: 18).animate(animationController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed ||
            status == AnimationStatus.reverse) {
          setState(() {
            if (!isActive)
              isActive = true;
            else
              isActive = false;
          });
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (isActive)
          animationController.forward();
        else
          animationController.reverse();
      },
      child: Container(
        width: 34.29,
        height: 20,
        child: Stack(
          children: [
            Transform.translate(
              offset: Offset(animation.value, 4),
              child: Container(
                width: 11.43,
                height: 11.43,
                decoration:
                    BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isActive ? activeColor : blueTextColor.withOpacity(.6)),
      ),
    );
  }
}
