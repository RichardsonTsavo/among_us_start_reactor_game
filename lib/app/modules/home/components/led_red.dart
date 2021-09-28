import 'package:among_us_start_reactor_game/app/shared/utils/style/style.dart';
import 'package:flutter/material.dart';
class LedRed extends StatelessWidget {
  final BoxConstraints constraints;
  LedRed({Key? key,required this.constraints}) : super(key: key);
  final ConstStyle constStyle = ConstStyle();
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: constraints.maxWidth*0.045,
        backgroundColor: Colors.black,
        child: Image.asset(constStyle.imageLedRedPath,
          width: constraints.maxWidth*0.07,
        )
    );
  }
}
