import 'package:flutter/material.dart';

class ListTileCourse extends StatefulWidget {
  ListTileCourse(
      {super.key,
      required this.index,
      required this.title,
      required this.expandedIndex,
      required this.function});
  String title;
  int index, expandedIndex;
  Function function;

  @override
  State<ListTileCourse> createState() => _ListTIleCourseState();
}

class _ListTIleCourseState extends State<ListTileCourse> {
  // bool _checkBox = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      // leading: Checkbox(
      //   onChanged: (value) {
      //     setState(() {
      //       _checkBox = value!;
      //     });
      //   },
      //   value: _checkBox,
      // ),
      onTap: () {
        setState(() {
          widget.function(widget.expandedIndex, widget.index);
        });
      },
      title: Text(
        widget.title,
        style: Theme.of(context).textTheme.bodyText1,
      ),
      trailing: widget.expandedIndex == widget.index
          ? const Icon(
              Icons.arrow_drop_up,
              color: Color(0xffF0F5F9),
            )
          : const Icon(
              Icons.arrow_drop_down,
              color: Color(0xffF0F5F9),
            ),
    );
  }
}
