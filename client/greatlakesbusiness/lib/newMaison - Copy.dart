import 'dart:io';

import 'package:flutter/material.dart';
import 'listeMaisons.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'about.dart';
import 'consulter.dart';
import 'connect.dart';
import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';
// import 'package:shared_preferences/shared_preferences.dart';


class newMaison extends StatefulWidget {

  @override
  _newMaisonState createState() => _newMaisonState();
}

class _newMaisonState extends State<newMaison> {
  InAppWebViewController webView;
  String url = "";
  double progress = 0;
  String msgResponse="";

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  

  TextEditingController typeAppart=new TextEditingController();
  TextEditingController prixAppart=new TextEditingController();
  TextEditingController adresseAppart=new TextEditingController();
  File _image;

    var id_proprio="";
    var usermail="";
    var fullname="";
   _getId_Proprio() async {
              id_proprio=connection.userID.toString().trim();
              usermail=connection.userMail.toString().trim();
              fullname=connection.fullname.toString().trim();
          }


  getImage() async {
    //  var image= await ImagePicker.pickImage(source: ImageSource.gallery);

    // setState(() {
    //   _image = image;
    // });
  }

  Future<List> _newAppartReq() async{
    var url="http://192.168.43.246/greatlakesbusinness/newAppart.php";
    if(typeAppart.text.toString().trim()=="" || prixAppart.text.toString().trim()=="" || adresseAppart.text.toString().trim()=="")
    {
        setState(() {
            msgResponse="Veuillez remplir tous les champs";
        });
    }
    
    else
    {
        _getId_Proprio();
        final response=await http.post(url, body: {
            "id_proprio": id_proprio.toString().trim(),
            "typeAppart": typeAppart.text.toString().trim(),
            "prixAppart":prixAppart.text.toString().trim(),
            "adresseAppart":adresseAppart.text.toString().trim()
        }).then((response){
          var responseData=json.decode(response.body);
          if(responseData.toString().trim().length==0)
          {
              setState(() {
                     msgResponse="Server error";
                });
          }
          else if(responseData.toString().trim()=="Maison ajoutée")
          {
              setState(() {
                     msgResponse="Maison ajoutee avec succes";
                });
          }
          else
          {
              setState(() {
                     msgResponse=responseData;
                });
          }
        // print(responseData);
      });
    }    
  }


  @override
  Widget build(BuildContext context) {

      final pageTitle=Text('Nouvelle maison', style: TextStyle(color: Colors.lightBlue, fontSize: 30.0), textAlign: TextAlign.center);
      final typeLbl=Text('Type', style: TextStyle(color: Colors.lightBlue, fontSize: 16.0));
      final adresseLbl=Text('Adresse', style: TextStyle(color: Colors.lightBlue, fontSize: 16.0));
      final prixLbl=Text('Prix', style: TextStyle(color: Colors.lightBlue, fontSize: 16.0));

      final typeMaisonTxt=TextFormField(
        controller: typeAppart,
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'A louer, A vendre',
        contentPadding: EdgeInsets.fromLTRB(24.0, 10.0, 24.0, 10.0),
      ),
    );

    final adresseMaison=TextFormField(
      controller: adresseAppart,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'DRC/NK/Goma/himbi',
        contentPadding: EdgeInsets.fromLTRB(24.0, 10.0, 24.0, 10.0),
      ),
    );

    final prixMaisonTxt=TextFormField(
      controller: prixAppart,
      keyboardType: TextInputType.number,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Prix de la maison',
        contentPadding: EdgeInsets.fromLTRB(24.0, 10.0, 24.0, 10.0),
      ),
    );

    
    final saveBtn=Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        shadowColor: Colors.lightBlue.shade100,
        borderRadius: BorderRadius.circular(70.0),
        color: Colors.lightBlue,
        elevation: 7.0,
        child: MaterialButton(
          onPressed: (){
            _getId_Proprio();
            _newAppartReq();
          },
          minWidth: 200.0,
          height: 50.0,
          child: Text('Enregistrer', style: TextStyle(color: Colors.white54, fontSize: 18.0)),
        ),
      ),
    );

    final msgRes=Text(msgResponse, style: TextStyle(color: Colors.red, fontSize: 14.0), textAlign: TextAlign.center,);

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
              leading: new Icon(Icons.home, color: Colors.lightBlue),
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
      body: Center(
        // child: _image == null
        //     ? new Text('No image selected.')
        //     : new Image.file(_image),
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            // appName,
            pageTitle,
            SizedBox(height: 40.0,),
            // SizedBox(height: 10.0,),
            typeLbl,
            typeMaisonTxt,
            SizedBox(height: 10.0,),
            adresseLbl,
            adresseMaison,
            SizedBox(height: 10.0,),
            prixLbl,
            prixMaisonTxt,
            SizedBox(height: 10.0,),
            msgRes,
            saveBtn,
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          getImage();
        },
        tooltip: 'Pick Image',
        child: Icon(Icons.photo_library),
      ),
    );
  }
}