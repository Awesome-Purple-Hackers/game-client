import 'package:flutter/material.dart';

class Path extends StatelessWidget {


  const Path({Key? key, this.innerColor, this.outerColor, this.child, this.texture}) : super(key: key);
  final texture;
  final innerColor;
  final outerColor;
  final child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: ClipRRect(
        // borderRadius: BorderRadius.circular(6),
        child: Container(
          // padding: EdgeInsets.all(4),
          color: outerColor,
          child: Container(
            // color: innerColor,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: texture,
                fit: BoxFit.fill,
              ),
              shape: BoxShape.rectangle,
            ),
            child: Center(child: child),
          ),
        ),
      ),
    );
  }
}
