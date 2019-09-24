import 'package:dfist19/widgets/chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BottomSheetList extends StatefulWidget {
  @override
  _BottomSheetListState createState() => _BottomSheetListState();
}

class _BottomSheetListState extends State<BottomSheetList> {
  @override
  Widget build(BuildContext context) {
    List<String> reportList = [
      "Asistant",
      "Android",
      "Web",
      "Cloud",
      "ML & AI",
      "Firebase",
      "Design",
      "iOS",
    ];

    List<Color> colorList = [
      Color(0xff333d47),
      Color(0xff4dae4e),
      Color(0xfff8bb15),
      Color(0xff498fcc),
      Color(0xfffd8369),
      Color(0xfffecc92),
      Color(0xffdc5144),
      Color(0xff74d5de),
    ];

    List<String> selectedReportList = List();

    return Container(
      child: new GridView.builder(
          itemCount: reportList.length,
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 3, crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Container(
                  child: Center(
                child: MultiSelectChip(
                  colorList[index],
                  reportList[index],
                  onSelectionChanged: (selectedList) {
                    setState(() {
                      selectedReportList = selectedList;
                    });
                  },
                ),
//              bottomSheetItem()
              )),
            );
          }),
    );
  }
}
