import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  final FocusNode focus1;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  SearchWidget({
    Key key,
    @required this.focus1,
    @required this.controller,
    @required this.onChanged,
  }) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  FocusNode focus = new FocusNode();
  bool isVisible = false;

  @override
  void initState() {
    this.isVisible;
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
    this.widget.controller.clear();
    this.widget.controller.clearComposing();
    this.isVisible = false;
    this.widget.focus1.addListener(() {
      if (widget.focus1.hasFocus) {
        isVisible = false;
        widget.controller.clear();
        widget.controller.clearComposing();
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
                new BoxShadow(color: Colors.grey[200], blurRadius: 10.0)
              ],
              borderRadius: BorderRadius.all(
                Radius.circular(14.0),
              ),
            ),
            child: TextField(
              focusNode: focus,
              controller: widget.controller,
              onChanged: widget.onChanged,
              textInputAction: TextInputAction.done,
              autocorrect: true,
              onTap: () {
                FocusScope.of(context).requestFocus(focus);
                isVisible = true;
              },
              onEditingComplete: () {
                isVisible = false;
              },
              onSubmitted: (text) {
                FocusScope.of(context).requestFocus(new FocusNode());
                isVisible = false;
              },
              style: TextStyle(
                fontFamily: 'NunitoSans',
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
                hintText: "Ara...",
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                suffixIcon: new Visibility(
                  visible: focus.hasFocus,
                  child: IconButton(
                    icon: Icon(
                      Icons.clear,
                      color: Colors.grey,
                    ),
                    onPressed: widget.controller.clear,
                  ),
                ),
                hintStyle: TextStyle(
                  fontFamily: 'NunitoSans',
                  color: Color(0xff80848b),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 0,
                ),
              ),
              maxLines: 1,
            ),
          ),
        ),
      ],
    );
  }
}
