import 'package:flutter/material.dart';

class MultiSelectChip extends StatefulWidget {
  final String reportList;
  final Color color;
  final Function(List<String>) onSelectionChanged;

  MultiSelectChip(this.color, this.reportList, {this.onSelectionChanged});

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  List<String> selectedChoices = List();

  @override
  Widget build(BuildContext context) {
    List<Widget> choices = List();

    return Container(
      padding: const EdgeInsets.all(2.0),
      child: ChoiceChip(
        avatar: Icon(
          Icons.brightness_1,
          color: widget.color,
          size: 10,
        ),
        label: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 84,
              height: 28,
              alignment: Alignment.centerLeft,
              child: new Text(widget.reportList,
                  style: TextStyle(
                    fontFamily: 'RedHatDisplay',
                    color: selectedChoices.contains(widget.reportList)
                        ? Color(0xffffffff)
                        : Color(0xff7090a7),
                    fontSize: 14,
                    fontWeight: selectedChoices.contains(widget.reportList)
                        ? FontWeight.w700
                        : FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top:8.0,left: 12.0),
              child: Container(
                  height: 12,
                  child: Image.asset("assets/path.png", fit: BoxFit.fill),

              ),
            ),
          ],
        ),
        selectedColor: Color(0xfffecc92),
        backgroundColor: Colors.white,
        selected: selectedChoices.contains(widget.reportList),
        onSelected: (selected) {
          setState(() {
            selectedChoices.contains(widget.reportList)
                ? selectedChoices.remove(widget.reportList)
                : selectedChoices.add(widget.reportList);
            widget.onSelectionChanged(selectedChoices);
          });
          return choices;
        },
      ),
    );
  }
}
