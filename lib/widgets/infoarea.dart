import 'package:flutter/material.dart';
import 'package:covid19app/datasource.dart';
import 'package:url_launcher/url_launcher.dart';
class InfoArea extends StatefulWidget {
  final String title;
  final String url;
  const InfoArea({this.title, this.url});

  @override
  _InfoAreaState createState() => _InfoAreaState();
}

class _InfoAreaState extends State<InfoArea> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        launch(widget.url);
      },
      child: Container(
        height: 50,
        width: double.infinity,
        color: Theme.of(context).brightness == Brightness.dark? Colors.white : primaryBlack,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(widget.title,
              style: TextStyle(
                color: Theme.of(context).brightness == Brightness.dark? primaryBlack : Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 17
              ),
              ),
              Icon(
                Icons.arrow_forward,
                color: Theme.of(context).brightness == Brightness.dark? primaryBlack : Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
