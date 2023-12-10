import 'dart:async';

import 'package:flutter/material.dart';

class SliderWidget extends StatefulWidget {
  SliderWidget(
      {super.key,
      required this.children,
      required this.duration,
      required this.curve,
      required this.controller});

  List<Widget> children;
  Duration duration;
  Curve curve;
  PageController controller;

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  int current_page = 0;
  Timer? timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer = Timer.periodic(Duration(milliseconds: 3300), (timer) {
      if (current_page < widget.children.length - 1) {
        setState(() {
          current_page = current_page + 1;
        });
      } else {
        setState(() {
          current_page = 0;
        });
      }
      widget.controller.animateToPage(current_page,
          duration: widget.duration, curve: widget.curve);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: PageView.builder(
        itemCount: widget.children.length,
        controller: widget.controller,
        itemBuilder: (context, index) {
          return Container(
              padding: index == 0
                  ? const EdgeInsets.only(right: 13)
                  : const EdgeInsets.only(right: 13, left: 13),
              height: 200,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(13),
                  child: widget.children[index]));
        },
      ),
    );
  }
}
