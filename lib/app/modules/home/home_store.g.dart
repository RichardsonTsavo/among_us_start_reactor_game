// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  final _$isPlayerTurnAtom = Atom(name: 'HomeStoreBase.isPlayerTurn');

  @override
  bool get isPlayerTurn {
    _$isPlayerTurnAtom.reportRead();
    return super.isPlayerTurn;
  }

  @override
  set isPlayerTurn(bool value) {
    _$isPlayerTurnAtom.reportWrite(value, super.isPlayerTurn, () {
      super.isPlayerTurn = value;
    });
  }

  final _$isStartedAtom = Atom(name: 'HomeStoreBase.isStarted');

  @override
  bool get isStarted {
    _$isStartedAtom.reportRead();
    return super.isStarted;
  }

  @override
  set isStarted(bool value) {
    _$isStartedAtom.reportWrite(value, super.isStarted, () {
      super.isStarted = value;
    });
  }

  final _$isWinAtom = Atom(name: 'HomeStoreBase.isWin');

  @override
  bool get isWin {
    _$isWinAtom.reportRead();
    return super.isWin;
  }

  @override
  set isWin(bool value) {
    _$isWinAtom.reportWrite(value, super.isWin, () {
      super.isWin = value;
    });
  }

  final _$isLoseAtom = Atom(name: 'HomeStoreBase.isLose');

  @override
  bool get isLose {
    _$isLoseAtom.reportRead();
    return super.isLose;
  }

  @override
  set isLose(bool value) {
    _$isLoseAtom.reportWrite(value, super.isLose, () {
      super.isLose = value;
    });
  }

  final _$animationWinAsyncAction = AsyncAction('HomeStoreBase.animationWin');

  @override
  Future<void> animationWin() {
    return _$animationWinAsyncAction.run(() => super.animationWin());
  }

  final _$animationFailAsyncAction = AsyncAction('HomeStoreBase.animationFail');

  @override
  Future<void> animationFail() {
    return _$animationFailAsyncAction.run(() => super.animationFail());
  }

  final _$showSequenceAsyncAction = AsyncAction('HomeStoreBase.showSequence');

  @override
  Future<void> showSequence() {
    return _$showSequenceAsyncAction.run(() => super.showSequence());
  }

  final _$startGameAsyncAction = AsyncAction('HomeStoreBase.startGame');

  @override
  Future<void> startGame() {
    return _$startGameAsyncAction.run(() => super.startGame());
  }

  final _$setSequenceAsyncAction = AsyncAction('HomeStoreBase.setSequence');

  @override
  Future<void> setSequence(int index) {
    return _$setSequenceAsyncAction.run(() => super.setSequence(index));
  }

  final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase');

  @override
  void initUi() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.initUi');
    try {
      return super.initUi();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPlayerLeds(int index, int indexColor) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setPlayerLeds');
    try {
      return super.setPlayerLeds(index, indexColor);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetPlayerLeds() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.resetPlayerLeds');
    try {
      return super.resetPlayerLeds();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setComputerLeds(int index, int indexColor) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setComputerLeds');
    try {
      return super.setComputerLeds(index, indexColor);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetComputerLeds() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.resetComputerLeds');
    try {
      return super.resetComputerLeds();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetLedsSequence() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.resetLedsSequence');
    try {
      return super.resetLedsSequence();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeStateButtons() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.changeStateButtons');
    try {
      return super.changeStateButtons();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isPlayerTurn: ${isPlayerTurn},
isStarted: ${isStarted},
isWin: ${isWin},
isLose: ${isLose}
    ''';
  }
}
