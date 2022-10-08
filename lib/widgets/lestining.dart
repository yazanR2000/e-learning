import 'package:flutter/material.dart';
import '../models/audio.dart';

class Lestining extends StatefulWidget {
  const Lestining({super.key});

  @override
  State<Lestining> createState() => _LestiningState();
}

class _LestiningState extends State<Lestining> {
  int _activeIndex = -1;
  void _changeState(int index) {
    setState(() {
      _activeIndex = _activeIndex == index ? -1 : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(10),
      itemCount: 15,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) =>
          Audio("${index + 1}.mp3", _changeState, index,_activeIndex),
    );
  }
}
