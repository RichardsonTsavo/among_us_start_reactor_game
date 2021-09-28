import 'package:among_us_start_reactor_game/app/modules/home/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ComputerPanelPage extends StatefulWidget {
  final String title;
  const ComputerPanelPage({Key? key,
    this.title = 'ComputerPanelPage'}
    ) : super(key: key);

  @override
  ComputerPanelPageState createState() => ComputerPanelPageState();
}
class ComputerPanelPageState extends State<ComputerPanelPage> {
  HomeStore store = Modular.get();


  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(store.constStyle.imageFramePath,
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
                children: store.computerLeds,
              ),
            ),
          ),
        ),
        Positioned(
          top: store.constraints!.maxHeight*0.1,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey.shade400,width: 5)
            ),
            width: store.constraints!.maxWidth*0.5,
            height: store.constraints!.maxHeight/4,
            child: Observer(
              builder:(context) => Wrap(
                children: store.ledsSequence,
              ),
            ),
          ),
        )
      ],
    );
  }
}