import 'package:among_us_start_reactor_game/app/modules/home/components/computer_panel_page.dart';
import 'package:among_us_start_reactor_game/app/modules/home/components/player_panel_page.dart';
import 'package:among_us_start_reactor_game/app/modules/home/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {

  @override
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          if(store.constraints == null){
            store.constraints = constraints;
            store.initUi();
          }
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: const Text(
                  "Start Reactor Among Us",
                  style: TextStyle(color: Colors.white)
              ),
              centerTitle: true,
            ),
            body: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                  child: Image.asset(store.constStyle.imageAmongUsSpacePath,
                    repeat: ImageRepeat.repeat,),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      ComputerPanelPage(),
                      PlayerPanelPage(),
                    ],
                  ),
                ),
                Positioned(
                    top: constraints.maxHeight*0.2,
                    child: Observer(
                      builder: (context) => store.isStarted?
                      const SizedBox():TextButton(
                        onPressed: (){
                          store.startGame();
                        },
                        child: const Text("Start\nGame",
                          style: TextStyle(color: Colors.green,
                              fontSize: 35),textAlign: TextAlign.center,),
                      ),
                    )
                ),
                Positioned(
                    top: constraints.maxHeight*0.16,
                    child: Observer(
                      builder: (context) => store.isWin?
                      Column(
                        children: [
                          const Text("You Win",
                            style: TextStyle(color: Colors.green,
                                fontSize: 35),textAlign: TextAlign.center,),
                          const SizedBox(height: 10),
                          TextButton(
                            onPressed: (){
                              store.startGame();
                            },
                            child: const Text("Restart\nGame",
                              style: TextStyle(color: Colors.green,
                                  fontSize: 35),textAlign: TextAlign.center,),
                          ),
                        ],
                      ):const SizedBox(),
                    )
                ),
                Positioned(
                    top: constraints.maxHeight*0.16,
                    child: Observer(
                      builder: (context) => store.isLose?
                      Column(
                        children: [
                          const Text("You Lose",
                            style: TextStyle(color: Colors.green,
                                fontSize: 35),textAlign: TextAlign.center,),
                          const SizedBox(height: 10),
                          TextButton(
                            onPressed: (){
                              store.startGame();
                            },
                            child: const Text("Restart\nGame",
                              style: TextStyle(color: Colors.green,
                                  fontSize: 35),textAlign: TextAlign.center,),
                          ),
                        ],
                      ):const SizedBox(),
                    )
                )
              ],
            ),
          );
        });
  }
}
