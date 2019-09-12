import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  final TextEditingController controller = new TextEditingController();

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    this.isVisible;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      semanticContainer: true,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
        child: TextField(
          controller: widget.controller,
          autocorrect: true,
          onTap: () {
            isVisible = true;

          },
          style: TextStyle(
            fontFamily: 'RedHatDisplay',
            color: Color(0xff80848b),
            fontSize: 15,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            letterSpacing: 0,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(12.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            hintText: "Search..",
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey,
            ),
            suffixIcon: Visibility(
              visible: isVisible,
              child: IconButton(
                icon: Icon(
                  Icons.clear,
                  color: Colors.grey,
                ),
                onPressed: widget.controller.clear,
              ),
            ),
            hintStyle: TextStyle(
              fontFamily: 'RedHatDisplay',
              color: Color(0xff80848b),
              fontSize: 15,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              letterSpacing: 0,
            ),
          ),
          maxLines: 1,
//                  controller: _searchControl,
        ),
      ),
    );
  }
}
