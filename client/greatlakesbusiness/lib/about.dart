import 'package:flutter/material.dart';
import 'listeMaisons.dart';
import 'detailsAppart.dart';
import 'newMaison.dart';
import 'connect.dart';
import 'consulter.dart';




class aboutPage extends StatefulWidget {
  @override
  _aboutPageState createState() => _aboutPageState();
}

class _aboutPageState extends State<aboutPage> {


  var id_proprio="";
  var usermail="";
  var fullname="";
   _getId_Proprio() async {
              id_proprio=connection.userID.toString().trim();
              usermail=connection.userMail.toString().trim();
              fullname=connection.fullname.toString().trim();
          }
  @override
  Widget build(BuildContext context) {
    final appName=Text('Greats Lakes Business', style: TextStyle(color: Colors.blueAccent, fontSize: 30.0), textAlign: TextAlign.center,);
    final lblPart=Text('Votre partenaire de confiance', style: TextStyle(color: Colors.grey, fontSize: 20.0), textAlign: TextAlign.center);

    final logo=Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 80.0,
        child: Image.asset('assets/greatlakes.png', width: 130.0, height: 130.0,),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Greats Lakes Business', style: TextStyle(color: Colors.white),),
        actions: <Widget>[
          new IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: (){
              
            },
          ),
        ],
      ),
      drawer: new Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: new Text(fullname.toString().trim(), style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),), 
                accountEmail: new Text(usermail.toString().trim())),
            ListTile(
              leading: new Icon(Icons.note_add),
              title: Text('Nos maisons'),
              onTap: () {

                Navigator.pop(context);
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>new listeMaisons()));
              },
            ),
            Divider(
                height: 2.0,
              ),
            ListTile(
              leading: new Icon(Icons.home, ),
              title: Text('Ajouter une maison'),
              onTap: () {

                Navigator.pop(context);
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>new newMaison()));
              },
            ),
            Divider(
                height: 2.0,
              ),
              ListTile(
              leading: new Icon(Icons.add_shopping_cart),
              title: Text('Consulter   +'),
              onTap: () {

                Navigator.pop(context);
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>new consulter_activite()));
              },
            ),
            Divider(
                height: 2.0,
              ),
              ListTile(
              leading: new Icon(Icons.verified_user, color: Colors.lightBlue),
              title: Text('About'),
              onTap: () {

                Navigator.pop(context);
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>new aboutPage()));
              },
            ),
            Divider(
                height: 2.0,
              ),
          ],
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
            Container(
              decoration: BoxDecoration(color: Colors.white),
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
                        Text("A propos", style: TextStyle(fontSize: 18.0, color: Colors.blueAccent),),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: new Text("Nous sommes une structure de ventes et locations des maison, afin de vous permettre d'avoir un appartement de luxe à votre portée et dans un milieu désiré", style: TextStyle(color: Colors.black, fontSize: 16.0),textAlign: TextAlign.justify,),
                        ),
                          
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                              new Text("Contacts", style: TextStyle(color: Colors.blue, fontSize: 20.0),),
                              SizedBox(height: 10.0,),
                              new Text("+243 840172420", style: TextStyle(color: Colors.black, fontSize: 14.0),),
                              new Text("+243 976703577", style: TextStyle(color: Colors.black, fontSize: 14.0),),
                              new Text("+243 995781249", style: TextStyle(color: Colors.black, fontSize: 14.0),)
                          ],
                        ),
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