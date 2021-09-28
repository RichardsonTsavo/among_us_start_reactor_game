import 'package:among_us_start_reactor_game/app/modules/home/home_store.dart';
import 'package:among_us_start_reactor_game/app/shared/utils/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PlayerPanelPage extends StatefulWidget {
  final String title;
  const PlayerPanelPage({Key? key,
  this.title = 'ComputerPanelPage',}
  ) : super(key: key);
  @override
  PlayerPanelPageState createState() => PlayerPanelPageState();
}
class PlayerPanelPageState extends State<PlayerPanelPage> {
  HomeStore store = Modular.get();
  ConstStyle constStyle = ConstStyle();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(constStyle.imageFramePath,
          width: store.constraints!.maxWidth*0.9,
          height: store.constraints!.maxHeight/2.5,
        ),
        Positioned(
          top: store.constraints!.maxHeight*0.04,
          child: SizedBox(
            width: store.constraints!.maxWidth*0.6,
            child: Observer(
              builder: (context) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: store.playerLeds,
              ),
            ),
          ),
        ),
        Positioned(
          top: store.constraints!.maxHeight*0.07,
          child: Container(
            alignment: Alignment.center,
            width: store.constraints!.maxWidth*0.55,
            height: store.constraints!.maxHeight/3.5,
            child: Observer(
              builder:(context) => Wrap(
                children: store.buttonsSequence,
              ),
            ),
          ),
        )
      ],
    );
  }
}