import 'package:flutter/material.dart';
import 'package:pocogame/magicalUi/magic.dart';
class AutoLayoutBuilder extends StatefulWidget {
  AutoLayoutBuilder({super.key,required this.child,required this.childCount,this.sm = 2,this.md = 2,this.lg = 2,this.xl = 2});
  int sm;
  int md;
  int lg;
  int xl;
  int childCount;
  Widget child;
  @override
  State<AutoLayoutBuilder> createState() => _AutoLayoutBuilderState();
}
class _AutoLayoutBuilderState extends State<AutoLayoutBuilder> {
  
  int crossAxisCount = 2;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      switch (MediaQuery.of(context).magicUiBreakPoints) {
      case MagicUiBreakPoints.sm:
        setState(() {
          crossAxisCount = widget.sm;
        });
        break;
      case MagicUiBreakPoints.md:
        setState(() {
          crossAxisCount = widget.md;
        });
        break;
      case MagicUiBreakPoints.lg:
        setState(() {
          crossAxisCount = widget.lg;
        });
        break;
      case MagicUiBreakPoints.xl:
        setState(() {
          crossAxisCount = widget.xl;
        });
        break;
      default:
      
    }

    return Container(
      margin: EdgeInsets.all(20),
      width: double.infinity,
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            
          ),
          itemBuilder:(context, index) {
            return widget.child;
          },itemCount: widget.childCount,),
    );

  }
}
