import 'dart:convert';
import 'package:covid19app/screens/countrypage.dart';
import 'package:covid19app/widgets/infoarea.dart';
import 'package:covid19app/widgets/mostaffectedcountries.dart';
import 'package:covid19app/widgets/worldwidepanels.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:covid19app/datasource.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map WorldData;
  fetchapi() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v3/covid-19/all');
    setState(() {
      WorldData = json.decode(response.body);
    });
  }

  List countrydata;
  fetchcountryapi() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v3/covid-19/countries?sort=cases');
    setState(() {
      countrydata = json.decode(response.body);
    });
  }
 Future fetchAlldata()async{
    fetchapi();
    fetchcountryapi();
  }
  @override
  void initState() {
    fetchAlldata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: (){
              DynamicTheme.of(context).setBrightness(Theme.of(context).brightness==Brightness.light?Brightness.dark:Brightness.light);
            },
             icon: Icon(Theme.of(context).brightness==Brightness.light? Icons.lightbulb_outline : Icons.highlight),
          ),
        ],
        title: Text('COVID-19 TRACKER APP'),
        centerTitle: false,
      ),
      body: RefreshIndicator(
        onRefresh: fetchAlldata,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                color: Colors.orange[100],
                padding: EdgeInsets.all(10.0),
                height: 100,
                width: double.infinity,
                child: Text(
                  DataSource.quote,
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'WorldWide',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context)=>CountryPage(),
                          ));
                        },
                        color: primaryBlack,
                        child: Text(
                          'Regional',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              WorldData == null
                  ? CircularProgressIndicator()
                  : WorldWidePanel(
                      WorldData: WorldData,
                    ),
              Text(
                'Most Affected Countries',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
             countrydata==null ? CircularProgressIndicator() : MostAffected(countrydata: countrydata,),
              SizedBox(height: 5,),
              InfoArea(title: 'ABOUT ME' ,url: 'https://www.facebook.com/mohamed.medhat.5682',),

              SizedBox(height: 5,),

              InfoArea(title: 'DONATE' , url: 'https://www.who.int/emergencies/diseases/novel-coronavirus-2019/donate' ,),

              SizedBox(height: 5,),
              InfoArea(title: 'MYTH BUSTERS', url: 'https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters',),
              SizedBox(height: 20,),
              Center(child: Text('WE ARE TOGETHER IN THE FIGHT',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                ),
              )),
              SizedBox(height: 50,),
            ],
          ),
        ),
      ),
    );
  }
}
