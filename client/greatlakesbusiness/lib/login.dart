import 'package:flutter/material.dart';
import 'welcome.dart';
import 'listeMaisons.dart';
import 'dart:io';
import 'package:http/http.dart'  as http;
import 'dart:convert';
import 'connect.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class loginPage extends StatefulWidget {
  static String tag='login-page';
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  String msgResponse="";
  TextEditingController mailUser=new TextEditingController();
  TextEditingController pwdUser=new TextEditingController();

  // Login request
  Future<List> _loginReq() async{
    var url="http://192.168.43.246/greatlakesbusinness/login.php";
    final response=await http.post(url, body: {
            "email": mailUser.text,
            "pwd":pwdUser.text
        }).then((response){
          var responseData=json.decode(response.body);
          print(responseData);
          if(responseData.toString().trim().length==0)
          {
              setState(() {
                     msgResponse="Server error";
                });
          }
          
          else
          {
              var exist=int.tryParse(responseData[0]['id_user'].toString().trim());
              // print(exist);
              if(exist==null || exist=="")
              {
                  setState(() {
                     msgResponse=responseData.toString().trim();
                });
              }
              else
              { 
                  setState(() {
                    connection.userID=exist.toString().trim();
                    connection.userMail=responseData[0]['mailUser'].toString().trim();
                    connection.fullname=responseData[0]['fullname'].toString().trim();
                     msgResponse="Welcome dear visitor";
                  });
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>new listeMaisons()));
              }
          }
    });
    
  }


  @override
  Widget build(BuildContext context) {
    final pageTitle=Text('Login', style: TextStyle(color: Colors.lightBlue, fontSize: 30.0), textAlign: TextAlign.center);
    final appName=Text('Greats Lakes Business', style: TextStyle(color: Colors.lightBlue, fontSize: 25.0));


    final logo=Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 30.0,
        child: Image.asset('assets/greatlakes.png'),
      ),
    );

    final log_mailUserTxt=TextFormField(
      controller: mailUser,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'example@domaine.com',
        contentPadding: EdgeInsets.fromLTRB(24.0, 10.0, 24.0, 10.0),
      ),
    );

    final log_pwdTxt=TextFormField(
      controller: pwdUser,
      obscureText: true,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(24.0, 10.0, 24.0, 10.0),
      ),
    );


    final logBtn=Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        shadowColor: Colors.lightBlue.shade100,
        elevation: 7.0,
        color: Colors.lightBlue,
        borderRadius: BorderRadius.circular(70.0),
        child: MaterialButton(
          minWidth: 200.0,
          height: 50.0,
          child: Text('Login', style: TextStyle(color: Colors.white54, fontSize: 18.0)),
          onPressed: (){
            _loginReq();
            // Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>new listeMaisons()));
          },
        ),
      ),
    );

    final infoLbl=Text("Vous n'avez pas de compte?", style: TextStyle(color: Colors.grey, fontSize: 14.0), textAlign: TextAlign.center,);
    final go_signUpBtn=FlatButton(
      child: Text('Sign up', style: TextStyle(color: Colors.lightBlue, fontSize: 15.0),),
      onPressed: (){
        Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context)=>new welcome()));
      },
      // onPressed: ,
    );
    
    final msgRes=Text(msgResponse, style: TextStyle(color: Colors.red, fontSize: 14.0), textAlign: TextAlign.center,);



    // ------------------------------Adding components to the page------------------------------
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Greats Lakes Business', style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            // appName,
            SizedBox(height: 10.0,),
            logo,
            pageTitle,
            SizedBox(height: 50.0,),
            log_mailUserTxt,
            SizedBox(height: 20.0,),
            log_pwdTxt,
            SizedBox(height: 30.0,),
            logBtn,
            // SizedBox(height: 0.0,),
            infoLbl,
            // SizedBox(height: 0.0,),
            go_signUpBtn,
            SizedBox(height: 10.0,),
            msgRes
          ],
        ),
      ),
    );
  }
  
}