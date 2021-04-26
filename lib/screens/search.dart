import 'package:flutter/material.dart';

class Search extends SearchDelegate{

  final List countryData;

  Search(this.countryData);
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          query='';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: (){Navigator.pop(context);},
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionlist = query.isEmpty? countryData : countryData.where((element) => element['country'].toString().toLowerCase().startsWith(query)).toList();
     return ListView.builder(
         itemCount: suggestionlist.length,
         itemBuilder: (context , index){
       return Card(
         child: Container(
           height: 130,
           margin: EdgeInsets.symmetric(vertical: 10 , horizontal: 10),

           child: Row(
             children: <Widget>[
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                   Text(suggestionlist[index]['country'],
                     style: TextStyle(fontWeight: FontWeight.bold),
                   ),
                   Image.network(suggestionlist[index]['countryInfo']['flag'],
                     height: 50,
                     width: 60,
                   ),
                 ],
               ),
               Expanded(
                 child: Container(
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
                       Text('CONFIRMED: ${suggestionlist[index]['cases']}',style: TextStyle(fontWeight: FontWeight.bold , color: Colors.red),),
                       Text('ACTIVE: ${suggestionlist[index]['cases']}',style: TextStyle(fontWeight: FontWeight.bold , color: Colors.blue),),
                       Text('RECOVERED: ${suggestionlist[index]['cases']}',style: TextStyle(fontWeight: FontWeight.bold , color: Colors.green),),
                       Text('DEATHS: ${suggestionlist[index]['cases']}',style: TextStyle(fontWeight: FontWeight.bold , color: Colors.grey),),
                     ],
                   ),
                 ),
               ),
             ],
           ),
         ),
       );
     });
  }

}