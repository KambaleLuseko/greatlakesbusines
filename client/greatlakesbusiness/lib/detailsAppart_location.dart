import 'package:flutter/material.dart';
import 'listeMaisons.dart';
import 'package:http/http.dart' as http;
import 'about.dart';
import 'connect.dart';
import 'dart:convert';




class detailsAppart_location extends StatefulWidget {
  final String detail_id_appart;
  final String detail_nomProprio;
  final String detail_typeAppart;
  final String detail_prixAppart;
  final String detail_adresseAppart;
  final String detail_phoneNumber;
  final String detail_imgUrl;
  detailsAppart_location(this.detail_id_appart, this.detail_nomProprio, this.detail_typeAppart, this.detail_prixAppart, this.detail_adresseAppart, this.detail_phoneNumber, this.detail_imgUrl);
  @override
  _detailsAppart_locationState createState() => _detailsAppart_locationState();
}

class _detailsAppart_locationState extends State<detailsAppart_location> {
  TextEditingController dateDebut=new TextEditingController();
  TextEditingController dateFin=new TextEditingController();
  @override
  String msgResponse="";
  var id_user="";

  _getId_Proprio() async {
              id_user=connection.userID.toString().trim();
              print(id_user);
          }


  Future<List> _saveOperation() async{
    var typeOperation="";
    var url="http://192.168.43.246/greatlakesbusinness/saveOperation.php";
    if(widget.detail_typeAppart.toString().trim()=="A louer")
    {
      typeOperation="Location";
    }
    else if(widget.detail_typeAppart.toString().trim()=="A vendre")
    {
        typeOperation="Vente";
    }
        _getId_Proprio();
        // var test=typeOperation.toString().trim();
        var date=DateTime.now().year.toString().trim()+"-"+DateTime.now().month.toString().trim()+"-"+DateTime.now().day.toString().trim();
        // print(test);
        final response=await http.post(url, body: {
            "id_client": id_user.toString().trim(),
            "id_appart": widget.detail_id_appart.toString().trim(),
            "typeOperation":typeOperation.toString().trim(),
            "dateOperation":date
        }).then((response){
              var responseData=json.decode(response.body);
              // print(response.body);
              if(responseData.toString().trim().length==0)
              {
                  setState(() {
                        msgResponse="Server error";
                    });
              }
              else if(responseData.toString().trim()=="success")
              {
                  setState(() {
                        msgResponse=typeOperation+" enregistrée";
                    });
              }
              else
              {
                  setState(() {
                        msgResponse=responseData;
                    });
              }
        }); 
  }
  
  @override
  Widget build(BuildContext context) {
    final msgRes=Text(msgResponse, style: TextStyle(color: Colors.red, fontSize: 14.0), textAlign: TextAlign.center,);

    final dateDebutTxt=TextFormField(
      // controller: dateDebut,
      // keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
        hintText: '2019-03-29',
        contentPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      ),
    );

    final dateFinTxt=TextFormField(
      // controller: dateFin,
      // keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
        hintText: '2019-03-29',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
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
      body: new ListView(
        padding: EdgeInsets.all(30.0),
        children: <Widget>[
          new Container(
            padding: EdgeInsets.all(0.0),
            height: 220,
            child: GridTile(
              child: Card(
                elevation: 5.0,
                 child: new Image(
                  image: new NetworkImage(widget.detail_imgUrl),
                  fit: BoxFit.cover,
            ),
              ),
            ),
          ),
          new Row(
            children: <Widget>[
              new SingleChildScrollView(
                child: Column(
                  children: <Widget>[

                    SizedBox(height: 30,),
                    new Text("Proprio : "+widget.detail_nomProprio, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
                    SizedBox(height: 10,),
                    new Text("Contact : "+widget.detail_phoneNumber, style: TextStyle(fontSize: 18)),
                    SizedBox(height: 30,),
                    new Text("Type : "+widget.detail_typeAppart, style: TextStyle(fontSize: 16)),
                    SizedBox(height: 10,),
                    new Text("Adresse : "+widget.detail_adresseAppart, style: TextStyle(fontSize: 16)),                    
                    SizedBox(height: 20,),
                    new Text("Prix : \$"+widget.detail_prixAppart, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.redAccent, fontSize: 50), textAlign: TextAlign.center,),
                    // SizedBox(height: 5,),
                    // new TextField(),
                    // dateDebutTxt,
                    // SizedBox(height: 5,),
                    // dateFinTxt,
                    Container(
                      child: dateFinTxt,
                    ),
                    new Container(
                      child:Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Material(
                          shadowColor: Colors.lightBlue.shade100,
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.lightBlue,
                          elevation: 3.0,
                          child: MaterialButton(
                            onPressed: (){
                                _saveOperation();
                            },
                            minWidth: 400.0,
                            height: 50.0,
                            child: Text('Commander', style: TextStyle(color: Colors.white, fontSize: 18.0)),
                          ),
                        ),
                                        )
                     
                      ),
                      SizedBox(height: 20,),
                      msgRes
                ],
                ),
                //mainAxisAlignment: MainAxisAlignment.start,
                //crossAxisAlignment: CrossAxisAlignment.start,
                
              )
              
            ],
          )
        ],
      ),
      
    );
  }
}