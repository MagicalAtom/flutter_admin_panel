
// // Layout Builder for show items in breakpoints

import 'package:flutter/material.dart';
import 'package:pocogame/magicalUi/magic.dart';

class Visible extends StatefulWidget {
  Visible({super.key, required this.child, required this.breakPoint});

  MagicUiBreakPoints breakPoint; // show children in break points
  Widget child; // children show your define breakpoints
  MagicUiBreakPoints? userDeviceSize;

  @override
  State<Visible> createState() => _VisibleState();
}

class _VisibleState extends State<Visible> {

 


  @override
  Widget build(BuildContext context) {
    
    return LayoutBuilder(
      builder: (context, constraints) {
        final _MagicUiBreakPoints = MediaQuery.of(context).magicUiBreakPoints;

        if (_MagicUiBreakPoints == widget.breakPoint) {
          return widget.child;
        }else{
        return SizedBox();
        }
      },
    );
  }
}

class ColumnLayout extends StatefulWidget {
  ColumnLayout({
    super.key,
    required this.children,
    required this.MainbreakPoint,
    required this.defaultchildren,
  });

  MagicUiBreakPoints MainbreakPoint; // show children in break points , sm
  List<Widget> children; // children show your define breakpoints
  List<Widget> defaultchildren;

  @override
  State<ColumnLayout> createState() => _ColumnLayoutState();
}

class _ColumnLayoutState extends State<ColumnLayout> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final _MagicUiBreakPoints = MediaQuery.of(context).magicUiBreakPoints;
        if (_MagicUiBreakPoints == widget.MainbreakPoint) {
          return Column(
            children: widget.children,
          );
        } else {
          return Column(
            children: widget.defaultchildren,
          );
        }
      },
    );
  }
}



class RowLayout extends StatefulWidget {
  RowLayout({
    super.key,
    required this.children,
    required this.MainbreakPoint,
    required this.defaultchildren,
  });

  MagicUiBreakPoints MainbreakPoint; // show children in break points , sm
  List<Widget> children; // children show your define breakpoints
  List<Widget> defaultchildren;

  @override
  State<RowLayout> createState() => _RowLayoutState();
}

class _RowLayoutState extends State<RowLayout> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final _MagicUiBreakPoints = MediaQuery.of(context).magicUiBreakPoints;
        if (_MagicUiBreakPoints == widget.MainbreakPoint) {
          return Row(
            children: widget.children,
          );
        } else {
          return Row(
            children: widget.defaultchildren,
          );
        }
      },
    );
  }
}
