import 'package:flutter/material.dart';
import 'dart:async';
import 'login.dart';
import 'welcome.dart';
import 'connect.dart';
import 'listeMaisons.dart';

class loaderPage extends StatefulWidget {
  static String tag="loader";
  @override
  _loaderPageState createState() => _loaderPageState();
}

class _loaderPageState extends State<loaderPage> {



  final routes=<String, WidgetBuilder>{
    '/welcome':(BuildContext context)=>new welcome(),
    '/login':(BuildContext context)=>new loginPage(),
      // welcome.tag:(context)=>welcome(),
      // loginPage.tag:(context)=>loginPage()
  };


  startTime() async {
    var _duration = new Duration(seconds: 5);
    return new Timer(_duration, navigationPage);
  }
  void navigationPage() {
    if(connection.userID.toString().trim()=="")
    {
        Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>new loginPage()));
    }
    else if(connection.userID.toString().trim()!="")
    {
        Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>new loginPage()));
    }
      
  }
  @override
  void initState() {
    super.initState();
    startTime();
  }


  
  @override
  Widget build(BuildContext context) {
    final appName=Text('Greats Lakes Business', style: TextStyle(color: Colors.white, fontSize: 30.0), textAlign: TextAlign.center,);
    final lblPart=Text('Votre partenaire de confiance', style: TextStyle(color: Colors.white70, fontSize: 20.0), textAlign: TextAlign.center);

    final progress=Container(
      // decoration: BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(backgroundColor: Colors.white,),
          Padding(padding: EdgeInsets.only(top: 20.0),),
          Text('Loading data...', style: TextStyle(color: Colors.white70), textAlign: TextAlign.center,)
        ],
      ),
    );

    final logo=Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 80.0,
        child: Image.asset('assets/greatlakes.png', width: 130.0, height: 130.0,),
      ),
    );
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
            Container(
              decoration: BoxDecoration(color: Colors.blueAccent),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        appName,
                        SizedBox(height: 20.0,),
                        logo,
                        SizedBox(height: 30.0),
                        lblPart, 
                        SizedBox(height: 20.0,),
                        progress,      
                      ],
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}