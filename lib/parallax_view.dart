library parallax_view;

import 'dart:math';

import 'package:flutter/material.dart';

class ParallaxView extends StatefulWidget {
  const ParallaxView({super.key, required this.controller});
  final ScrollController controller;

  @override
  State<ParallaxView> createState() => _ParallaxViewState();
}

class _ParallaxViewState extends State<ParallaxView> {
  double scrollPostion = 0;
  final viewHeight = 300.0;

  @override
  void initState() {
    widget.controller.addListener(scrollListener);
    super.initState();
  }

  void scrollListener() {
    scrollPostion = widget.controller.position.pixels;
    if (scrollPostion > viewHeight) return;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        layer1(),
        layer2(),
        layer3(),
      ],
    );
  }

  Widget layer1() {
    return SizedBox(
      height: viewHeight,
      width: double.infinity,
      child: Image.network(
        'https://static.vecteezy.com/system/resources/previews/026/542/204/non_2x/landscape-natural-beautiful-mountains-and-blue-sky-panorama-photo.jpg',
        fit: BoxFit.fill,
      ),
    );
  }

  Widget layer2() {
    final pos = getPosition(begin: -300, end: -100);
    return AnimatedPositioned(
      duration: Duration(milliseconds: 200),
      curve: Curves.decelerate,
      bottom: pos,
      child: SizedBox(
        height: viewHeight,
        child: Image.network(
          'https://www.treehugger.com/thmb/aG-r6Gfm7seMVqjBoYxUVXMwUt4=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/8860298334_509c5f9698_o-2fba9e1a26cc465bb9d4f9b659b2296d.jpg',
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget layer3() {
    final pos = getPosition(begin: -400, end: -150);
    return AnimatedPositioned(
      duration: Duration(milliseconds: 200),
      bottom: pos,
      curve: Curves.easeOutSine,
      child: SizedBox(
        height: viewHeight,
        child: const Text(
          "WELCOME",
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  double getPosition({
    required double begin,
    required double end,
  }) {
    final scrollPos = scrollPostion + begin;
    if (scrollPos < begin) return begin;
    if (scrollPos > end) return end;
    return scrollPos;
  }

  @override
  void dispose() {
    widget.controller.removeListener(scrollListener);
    super.dispose();
  }
}
