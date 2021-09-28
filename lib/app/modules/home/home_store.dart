import 'dart:math';

import 'package:among_us_start_reactor_game/app/modules/home/components/led_off.dart';
import 'package:among_us_start_reactor_game/app/modules/home/components/led_on.dart';
import 'package:among_us_start_reactor_game/app/modules/home/components/led_red.dart';
import 'package:among_us_start_reactor_game/app/modules/home/components/led_sequence.dart';
import 'package:among_us_start_reactor_game/app/shared/utils/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:soundpool/soundpool.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  Soundpool pool = Soundpool(streamType: StreamType.notification);
  ObservableList<Widget> computerLeds = ObservableList();
  ObservableList<LetSequence> ledsSequence = ObservableList();
  ObservableList<Widget> playerLeds = ObservableList();
  ObservableList<Widget> buttonsSequence = ObservableList();
  BoxConstraints? constraints;
  ConstStyle constStyle = ConstStyle();
  @observable
  bool isPlayerTurn = false;
  List<int> sequence = [];
  int playerMaxTurn = 5;
  int playerCounterTurn = 0;
  int playerPlay = 0;


  @observable
  bool isStarted = false;
  @observable
  bool isWin = false;
  @observable
  bool isLose = false;

  @action
  void initUi() {
    resetComputerLeds();
    for (int i = 0; i < 5; i++) {
      playerLeds.add(LedOff(constraints: constraints!));
    }
    for (int i = 0; i < 9; i++) {
      buttonsSequence.add(Padding(
        padding: const EdgeInsets.all(5),
        child: Observer(
          builder: (context) => Container(
            width: constraints!.maxWidth * 0.14,
            height: constraints!.maxWidth * 0.14,
            decoration: const BoxDecoration(
                color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(5))
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 5, 3, 3),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith((states) =>
                  states.contains(MaterialState.disabled)
                      ? Colors.grey
                      : constStyle.primaryColor),
                  overlayColor: MaterialStateColor.resolveWith(
                          (states) => Colors.greenAccent),
                  maximumSize: MaterialStateProperty.resolveWith((states) => Size(
                      constraints!.maxWidth * 0.13, constraints!.maxWidth * 0.13)),
                  minimumSize: MaterialStateProperty.resolveWith((states) => Size(
                      constraints!.maxWidth * 0.13, constraints!.maxWidth * 0.13)),
                ),
                onPressed: isPlayerTurn
                    ? () {
                  setSequence(i);
                }
                    : null,
                child: const Text(""),
              ),
            ),
          ),
        ),
      ));
    }
    for (int i = 0; i < 9; i++) {
      ledsSequence.add(LetSequence(
        color: Colors.black,
        constraints: constraints!,
      ));
    }
  }

  @action
  void setPlayerLeds(int index, int indexColor) {
    playerLeds[index] = indexColor == 0
            ? LedOn(constraints: constraints!)
            : LedRed(constraints: constraints!);
  }

  @action
  Future<void> animationWin() async {
    for(int i = 0; i < 3;i++){
      resetComputerLeds();
      resetLedsSequence();
      await Future.delayed(const Duration(milliseconds: 200));
      computerLeds.clear();
      for (int i = 0; i < 5; i++) {
        computerLeds.add(LedOn(constraints: constraints!));
      }
      ledsSequence.clear();
      for (int i = 0; i < 9; i++) {
        ledsSequence.add(LetSequence(
          color: Colors.green,
          constraints: constraints!,
        ));
      }
      await Future.delayed(const Duration(milliseconds: 200));
    }
    resetComputerLeds();
    resetLedsSequence();
    resetPlayerLeds();
  }

  @action
  Future<void> animationFail() async {
    for(int i = 0; i < 3;i++){
      resetComputerLeds();
      resetLedsSequence();
      await Future.delayed(const Duration(milliseconds: 200));
      computerLeds.clear();
      for (int i = 0; i < 5; i++) {
        computerLeds.add(LedRed(constraints: constraints!));
      }
      ledsSequence.clear();
      for (int i = 0; i < 9; i++) {
        ledsSequence.add(LetSequence(
          color: Colors.red,
          constraints: constraints!,
        ));
      }
      await Future.delayed(const Duration(milliseconds: 200));
    }
    resetComputerLeds();
    resetLedsSequence();
    resetPlayerLeds();
  }

  @action
  void resetPlayerLeds() {
    playerLeds.clear();
    for (int i = 0; i < 5; i++) {
      playerLeds.add(LedOff(constraints: constraints!));
    }
  }

  @action
  void setComputerLeds(int index, int indexColor) {
    computerLeds[index] = indexColor == 0
        ? LedOn(constraints: constraints!)
        : LedRed(constraints: constraints!);
  }

  @action
  void resetComputerLeds() {
    computerLeds.clear();
    for (int i = 0; i < 5; i++) {
      computerLeds.add(LedOff(constraints: constraints!));
    }
  }
  @action
  void resetLedsSequence() {
    ledsSequence.clear();
    for (int i = 0; i < 9; i++) {
      ledsSequence.add(LetSequence(
        color: Colors.black,
        constraints: constraints!,
      ));
    }
  }

  @action
  Future<void> showSequence() async {
    for (int i = 0; i < playerCounterTurn; i++) {
      int soundId = await rootBundle
          .load(constStyle.audioButtonsPath[sequence[i]])
          .then((ByteData soundData) {
        return pool.load(soundData);
      });
      await pool.play(soundId);
      setComputerLeds(i,0);
      ledsSequence[sequence[i]] = LetSequence(
        color: constStyle.secundareColor,
        constraints: constraints!,
      );
      await Future.delayed(const Duration(milliseconds: 400));
      ledsSequence[sequence[i]] = LetSequence(
        color: Colors.black,
        constraints: constraints!,
      );
    }
    resetComputerLeds();
    changeStateButtons();
  }

  @action
  Future<void> startGame() async {
    int soundId = await rootBundle
        .load(constStyle.audioStartPath)
        .then((ByteData soundData) {
      return pool.load(soundData);
    });
    await pool.play(soundId);
    playerCounterTurn++;
    isStarted = true;
    isWin = false;
    isLose = false;
    sequence.clear();
    var rng = Random();
    for (int i = 0; i < 5; i++) {
      sequence.add(rng.nextInt(9));
    }
    await Future.delayed(const Duration(seconds: 2));
    showSequence();
  }

  @action
  void changeStateButtons() {
    isPlayerTurn = !isPlayerTurn;
    buttonsSequence.clear();
    for (int i = 0; i < 9; i++) {
      buttonsSequence.add(Padding(
        padding: const EdgeInsets.all(5),
        child: Observer(
          builder: (context) => Container(
            width: constraints!.maxWidth * 0.14,
            height: constraints!.maxWidth * 0.14,
            decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(5))
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 5, 3, 3),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith((states) =>
                  states.contains(MaterialState.disabled)
                      ? Colors.grey
                      : constStyle.primaryColor),
                  overlayColor: MaterialStateColor.resolveWith(
                          (states) => Colors.greenAccent),
                  maximumSize: MaterialStateProperty.resolveWith((states) => Size(
                      constraints!.maxWidth * 0.13, constraints!.maxWidth * 0.13)),
                  minimumSize: MaterialStateProperty.resolveWith((states) => Size(
                      constraints!.maxWidth * 0.13, constraints!.maxWidth * 0.13)),
                ),
                onPressed: isPlayerTurn
                    ? () {
                  setSequence(i);
                }
                    : null,
                child: const Text(""),
              ),
            ),
          ),
        ),
      ));
    }
  }

  @action
  Future<void> setSequence(int index) async {
    if (playerCounterTurn <= playerMaxTurn) {
      if (index == sequence[playerPlay]) {
        int soundId = await rootBundle
            .load(constStyle.audioButtonsPath[index])
            .then((ByteData soundData) {
          return pool.load(soundData);
        });
        await pool.play(soundId);
        setPlayerLeds(playerPlay,0);
        playerPlay++;
        if (playerPlay == playerCounterTurn) {
          if (playerCounterTurn == playerMaxTurn) {
            changeStateButtons();
            animationWin();
            playerPlay = 0;
            playerCounterTurn = 0;
            int soundId = await rootBundle
                .load(constStyle.audioConpletePath)
                .then((ByteData soundData) {
              return pool.load(soundData);
            });
            await pool.play(soundId);
            await Future.delayed(const Duration(milliseconds: 1500));
            isStarted = true;
            isWin = true;
            isLose = false;
          } else {
            changeStateButtons();
            playerPlay = 0;
            playerCounterTurn++;
            await Future.delayed(const Duration(seconds: 1));
            resetPlayerLeds();
            showSequence();
          }
        }
      } else {
        animationFail();
        changeStateButtons();
        setPlayerLeds(playerPlay,1);
        playerPlay = 0;
        playerCounterTurn = 0;
        int soundId = await rootBundle
            .load(constStyle.audioFailPath)
            .then((ByteData soundData) {
          return pool.load(soundData);
        });
        await pool.play(soundId);
        await Future.delayed(const Duration(seconds: 2));
        isStarted = true;
        isWin = false;
        isLose = true;
      }
    }
  }
}
