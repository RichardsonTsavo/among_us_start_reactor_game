import 'package:flutter/material.dart';
class LetSequence extends StatefulWidget {
  final BoxConstraints constraints;
  Color color;
  LetSequence({Key? key,required this.constraints,required this.color}) : super(key: key);

  @override
  _LetSequenceState createState() => _LetSequenceState();
}

class _LetSequenceState extends State<LetSequence> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: widget.constraints.maxWidth * 0.12,
      height: widget.constraints.maxWidth * 0.12,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(5)
      ),
    );
  }
}