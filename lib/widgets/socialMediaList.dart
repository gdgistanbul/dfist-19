import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaList extends StatefulWidget {
  var linkList = new List<String>();
  var icon;

  SocialMediaList({
    Key key,
    @required this.linkList,
  }) : super(key: key);

  @override
  _SocialMediaListState createState() => _SocialMediaListState();
}

class _SocialMediaListState extends State<SocialMediaList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: widget.linkList == null ? 0 : widget.linkList.length,
        itemBuilder: (BuildContext context, int index) {
          var list = widget.linkList[index];
          List<String> siteName = list.split(".");

          switch (siteName[2]) {
            case "youtube":
              widget.icon = "assets/youtube.png";
              break;

            case "facebook":
              widget.icon = "assets/facebook.png";

              break;

            case "instagram":
              widget.icon = "assets/instagram.png";

              break;

            case "twitter":
              widget.icon = "assets/twitter.png";

              break;

            case "github":
              widget.icon = "assets/instagram.png";

              break;
          }
          return GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: ClipOval(
                    child: Container(
                  height: 48.0, // height of the button
                  width: 48.0, // width of the button
//                child: Image.asset("${widget.icon}", fit: BoxFit.fill),
                  child: Image.asset("assets/instagram.png", fit: BoxFit.fill),
                )),
              ),
              onTap: () {
                _launchURL(list);
              });
        },
      ),
    );
  }

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
