import 'package:flutter/material.dart';

class bottomSheetItem extends StatefulWidget {
  @override
  _bottomSheetItemState createState() => _bottomSheetItemState();
}

class _bottomSheetItemState extends State<bottomSheetItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: Card(
        elevation: 0.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        semanticContainer: true,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
            new BoxShadow(
                color: Colors.grey[200],
                blurRadius: 10.0
            )
          ],
            borderRadius: BorderRadius.all(
              Radius.circular(14.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right : 8.0),
                  child: Icon(
                    Icons.brightness_1,
                    color: Colors.lightGreenAccent,
                    size: 10,
                  ),
                ),
                Text("Android")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
