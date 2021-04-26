import 'package:flutter/material.dart';

class MostAffected extends StatelessWidget {
  final List countrydata;

  const MostAffected({this.countrydata});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context , index){
          return Container(
            margin: EdgeInsets.symmetric(vertical: 5 , horizontal: 10),
            child: Row(
              children: <Widget>[
                Image.network(countrydata[index]['countryInfo']['flag'] , height: 30,),
                SizedBox(
                  width: 10,
                ),
                Text(countrydata[index]['country'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text('deathes: ${countrydata[index]['deaths'].toString()}',
                style: TextStyle(
                  color: Colors.red,
                    fontWeight: FontWeight.bold,
                ),
                ),
              ],
            ),
          );
        },
        itemCount: 5,
      ),
    );
  }
}
