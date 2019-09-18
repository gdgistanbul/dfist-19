import 'package:dfist19/widgets/bottomSheetItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class bottomSheet extends StatefulWidget {
  @override
  _bottomSheetState createState() => _bottomSheetState();
}

class _bottomSheetState extends State<bottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new GridView.builder(
          itemCount: 20,
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 3, crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Container(child: Center(child: bottomSheetItem())),
            );
          }),
    );
  }
}
