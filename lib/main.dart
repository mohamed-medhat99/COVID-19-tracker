import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import './screens/home_page.dart';
import 'datasource.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      data: (brightness){
        return ThemeData(
          primaryColor: primaryBlack,
          fontFamily: 'Circular' ,
          brightness: brightness==Brightness.light?Brightness.light:Brightness.dark,
          scaffoldBackgroundColor: brightness==Brightness.dark?Colors.blueGrey[900]:Colors.white,

        );
      },
      themedWidgetBuilder: (context , theme){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme,
          home: HomePage(),
        );
      },
    );
  }
}


