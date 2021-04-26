import 'package:flutter/material.dart';

class WorldWidePanel extends StatelessWidget {
  final Map WorldData;

  const WorldWidePanel({this.WorldData});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2,
        ),
        children: <Widget>[
          StatusPanel(title: 'CONFIRMED',  number: WorldData['cases'].toString(),PanelColor: Colors.red[100], TextColor: Colors.red,),
          StatusPanel(title: 'ACTIVE',  number: WorldData['active'].toString(), PanelColor: Colors.blue[100], TextColor: Colors.blue,),
          StatusPanel(title: 'RECOVERED',  number: WorldData['recovered'].toString(),PanelColor: Colors.green[100], TextColor: Colors.green,),
          StatusPanel(title: 'DEATH',  number: WorldData['deaths'].toString(),PanelColor: Colors.grey, TextColor: Colors.black,),
        ],
      ),
    );
  }
}
class StatusPanel extends StatelessWidget {
  final Color PanelColor;
  final Color TextColor;
  final String title;
  final String number;
  StatusPanel({@required this.PanelColor , @required this.TextColor, @required this.title, @required this.number});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: PanelColor,
      ),
      margin: EdgeInsets.all(8.0),
      height: 80,
      width: width/2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: TextColor,
          ),
          ),
          Text(number,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: TextColor,
            ),
          ),
        ],
      ),
    );
  }
}

