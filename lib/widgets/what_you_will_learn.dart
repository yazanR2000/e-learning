import 'package:flutter/material.dart';

class WhatYouWillLearn extends StatefulWidget {
  final List<dynamic> _list;
  WhatYouWillLearn(this._list);

  @override
  State<WhatYouWillLearn> createState() => _WhatYouWillLearnState();
}

class _WhatYouWillLearnState extends State<WhatYouWillLearn> {
  bool _showAll = false;

  int _length() {
    if (_showAll) {
      return widget._list.length;
    } else {
      return widget._list.length > 5 ? 5 : widget._list.length;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _length() + 1,
      itemBuilder: (ctx, index) {
        if (index == _length() && widget._list.length > 5) {
          return ElevatedButton(
              onPressed: () {
                setState(() {
                  _showAll = !_showAll;
                });
              },
              child: Text(_showAll ? "Show less" : "Show more"),
          );
        }else if(widget._list.length <= 5 && index == _length()){
          return Container();
        }
        return widget._list[index] != null
            ? ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(
                  Icons.done,
                  color: Colors.green,
                ),
                title: Text(
                  widget._list[index],
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              )
            : Container();
      },
    );
  }
}
