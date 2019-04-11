import 'package:flutter/material.dart';
import 'newMaison.dart';
// import 'package:GreatLakesBusiness/listeMaisons.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'detailsAppart.dart';
import 'about.dart';
import 'listeMaison_location.dart';
import 'connect.dart';
import 'listeMaisons.dart';


class consulter_activite extends StatefulWidget {
  @override
  _consulter_activiteState createState() => _consulter_activiteState();
}

class _consulter_activiteState extends State<consulter_activite> {

  var id_proprio="";
  var usermail="";
  var fullname="";
   _getId_Proprio() async {
              id_proprio=connection.userID.toString().trim();
              usermail=connection.userMail.toString().trim();
              fullname=connection.fullname.toString().trim();
          }


  var isLoading = false;
  List responseData=List();

  void initState()
  {
    super.initState();
    _getAppart();
  }

  Future <List<appart>> _getAppart() async{
    final String url="http://192.168.43.246/greatlakesbusinness/getOperation.php";
    var receivedData= await http.post(url, body: {"userID":connection.userID.toString().trim()}).then((response){
        var jsonData=jsonDecode(response.body);
        // print(response);
        List<appart> apparts=[];
        
        if (response.statusCode == 200) 
        {
            responseData = json.decode(response.body) as List;
            setState(() {
                isLoading = false;
            });
        } else {
            throw Exception('Failed to load data');
        }
    });
    
  }



  @override
  Widget build(BuildContext context) {
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
              leading: new Icon(Icons.add_shopping_cart, color: Colors.lightBlue),
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
              leading: new Icon(Icons.verified_user),
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
      body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )

              : new ListView.builder(
                  itemCount: responseData.length,
                  itemBuilder: (BuildContext context, int index)
                  {
                    
                      if(responseData!=null)
                      {
                        return new appart(responseData[index]["id_appart"], responseData[index]["nomProprio"], responseData[index]["typeOperation"], responseData[index]["dateOperation"], responseData[index]["prixAppart"], responseData[index]["adresseAppart"], responseData[index]["phoneNumber"], "http://192.168.43.246/greatlakesbusinness/images/apparts/" +responseData[index]["imageAppart"].toString().trim());
                      }
                      else if(responseData==null)
                      {
                        return CircularProgressIndicator();
                      }
                      
                  },
              ),
        );
  }
}


class appart extends StatelessWidget {
  final String idappart;
  final String nomProprio;
  final String typeOp;
  final String dateOp;
  final String prixAppart;
  final String adresseAppart;
  final String phoneNumber;
  final String imgUrl;
  appart(this.idappart, this.nomProprio, this.typeOp, this.dateOp, this.prixAppart, this.adresseAppart, this.phoneNumber,this.imgUrl);
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
          // Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>new detailsAppart(
          //        idappart, nomProprio, prixAppart, adresseAppart, phoneNumber, imgUrl
          // )));
            
      },
      title: new Card(
        elevation: 5.0,
        child: new Container(
          height: 200,
          child: new GridTile(
            child: Container(
              child: new Image(
                  image: new NetworkImage(imgUrl),
            ),
          ),
          footer: new Container(
            color: Colors.white70,
            child: new ListTile(
              // leading: new Text(nomProprio, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
              title: new Container(
                child: new Row(
                  children: <Widget>[
                    new Column(
                      
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text("Proprio :" +nomProprio, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                        new Text("Mouv : "+typeOp+" ; en date du " +dateOp),
                        new Text("Prix : \$"+prixAppart, style: TextStyle(color: Colors.redAccent, fontSize: 16.0, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  // new Expanded(
                  //   child: new Text(" Mouvement : "+typeOp+" |  "),
                  // ),
                  // SizedBox(height: 5.0,),
                  // new Expanded(
                  //   child: new Text("Prix\$"+prixAppart, style: TextStyle(color: Colors.redAccent, fontSize: 16.0, fontWeight: FontWeight.bold),)
                  // ),
                ],
                
                ),
              ),
            ),

          ),
        ),
      ),
    ),
    );
  }
}