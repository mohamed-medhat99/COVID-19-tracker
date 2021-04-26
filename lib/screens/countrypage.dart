import 'package:covid19app/screens/search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  List countryData;
  fetchcountryData()async{
    http.Response response = await http.get('https://corona.lmao.ninja/v3/covid-19/countries');
    setState(() {
      countryData = json.decode(response.body);
    });
  }
  @override
  void initState() {
    fetchcountryData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              showSearch(context: context,  delegate: Search(countryData));
            },
          ),
        ],
        centerTitle: true,
        title: Text('Country State',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        ),
      ),
      body: countryData==null ? CircularProgressIndicator() : ListView.builder(
        itemCount: countryData==null ? 0 : countryData.length,
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
                      Text(countryData[index]['country'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Image.network(countryData[index]['countryInfo']['flag'],
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
                          Text('CONFIRMED: ${countryData[index]['cases']}',style: TextStyle(fontWeight: FontWeight.bold , color: Colors.red),),
                          Text('ACTIVE: ${countryData[index]['cases']}',style: TextStyle(fontWeight: FontWeight.bold , color: Colors.blue),),
                          Text('RECOVERED: ${countryData[index]['cases']}',style: TextStyle(fontWeight: FontWeight.bold , color: Colors.green),),
                          Text('DEATHS: ${countryData[index]['cases']}',style: TextStyle(fontWeight: FontWeight.bold , color: Colors.grey),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
