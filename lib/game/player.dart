import 'package:flutter/material.dart';

class Player extends StatelessWidget {
  const Player({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(11),
      child: Container(
        // color: Color.fromRGBO(133, 106, 30, 0.5),
        color: Colors.orange,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Image.asset('lib/images/avatar.png'),
        ),
      ),
    );
  }
}
