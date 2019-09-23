import 'package:flutter/material.dart';

class MultiSelectChip extends StatefulWidget {
  final List<String> reportList;

  MultiSelectChip(this.reportList);

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  String selectedChoice = "";

  // this function will build and return the choice list
  _buildChoiceList() {
    List<Widget> choices = List();
    widget.reportList.forEach((item) {
      choices.add(
          Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          avatar:   Icon(
            Icons.brightness_1,
            color: Colors.lightGreenAccent,
            size: 10,
          ),
          shadowColor: Colors.grey[200],
          backgroundColor: Colors.white,
          label: new Text("Android",
              style: TextStyle(
                fontFamily: 'RedHatDisplay',
                color: Color(0xff7090a7),
                fontSize: 12,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                letterSpacing: 0,

              )
          ),
          selectedColor: Colors.grey[200],

          selected: selectedChoice == item,
          onSelected: (selected) {
            setState(() {
              selectedChoice = item;
            });
          },
        ),
      )
      );
    });
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}
