import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  FocusNode focus1;

  SearchWidget({
    Key key,
    @required this.focus1,
  }) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  FocusNode focus = new FocusNode();
  bool isVisible = false;
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    this.isVisible;
    this.widget.focus1 = FocusNode();
    this.widget.focus1.addListener(() {
      if (widget.focus1.hasFocus) {
        isVisible = false;
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    this.focus.dispose();
    this.controller.clear();
    this.controller.clearComposing();
    this.isVisible = false;
    this.widget.focus1.addListener(() {
      if (widget.focus1.hasFocus) {
        isVisible = false;
        controller.clear();
        controller.clearComposing();
      }
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
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
            child: TextField(
              focusNode: focus,
              controller: controller,
              autocorrect: true,
              onTap: () {
                FocusScope.of(context).requestFocus(focus);
                isVisible = true;
              },
              onEditingComplete: () {
                isVisible = false;
              },
              onSubmitted: (text) {
                isVisible = false;
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
                contentPadding: EdgeInsets.all(14.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.0),
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
                suffixIcon: new Visibility(
                  visible: isVisible,
                  child: IconButton(
                    icon: Icon(
                      Icons.clear,
                      color: Colors.grey,
                    ),
                    onPressed: controller.clear,
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
        ),
      ],
    );
  }
}
